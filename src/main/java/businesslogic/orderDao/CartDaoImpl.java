package businesslogic.orderDao;

import businesslogic.bookDao.BookDao;
import businesslogic.bookDao.BookDaoImpl;
import model.enumeration.CartStatus;
import model.order.Cart;
import model.order.CartDetail;
import model.user.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class CartDaoImpl implements CartDao {
    private BookDao bookDao;

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/pttk_bookstore";
            Connection connection = DriverManager.getConnection(connectionURL, "root", "00023011");
            return connection;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int getQuantityOfCart(String cartID) {
        Connection connection = getConnection();
        String sql = "SELECT SUM(Quantity) AS QuantityTotal FROM cartdetail WHERE CartID = ? ";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cartID);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return rs.getInt("QuantityTotal");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public Cart getCartByCustomerID(Customer customer) {
        Cart cart = new Cart();;
        Connection connection = getConnection();
        String sql = "SELECT cart.* FROM cart WHERE CustomerID = ? AND Status = 'InProgress'";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, customer.getID());
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                cart.setID(rs.getString("ID"));
                cart.setCartStatus(CartStatus.valueOf(rs.getString("Status")));
                cart.setCustomer(new Customer(rs.getString("CustomerID")));
                cart.setCartDetailList(getCartDetailList(connection, cart.getID()));
                cart.setTotal(rs.getDouble("Total"));
            } else {
                cart.setID(UUID.randomUUID().toString());
                cart.setCustomer(new Customer(customer.getID()));
                cart.setCartStatus(CartStatus.InProgress);
                cart.setTotal(0);
                cart = createNewCart(connection, cart);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return cart;
    }

    @Override
    public Cart getCartByCartID(String cartID) {
        Cart cart = null;
        Connection connection = getConnection();
        String sql = "SELECT cart.* FROM cart WHERE ID = ? AND Status = 'Completed'";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cartID);
            ResultSet rs = preparedStatement.executeQuery();
            cart = new Cart();
            if (rs.next()) {
                cart.setID(rs.getString("ID"));
                cart.setCartStatus(CartStatus.valueOf(rs.getString("Status")));
                cart.setCustomer(new Customer(rs.getString("CustomerID")));
                cart.setCartDetailList(getCartDetailList(connection, cart.getID()));
                cart.setTotal(rs.getDouble("Total"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return cart;
    }

    @Override
    public void updateNewestCart(String CustomerID) {
        Connection connection = getConnection();
        Customer customer = new Customer(CustomerID);
        Cart cart = getCartByCustomerID(customer);
        if (cart.getCartDetailList() != null) {
            List<CartDetail> cartDetailList = cart.getCartDetailList();
            for (CartDetail cartDetail : cartDetailList) {
                updateCartDetail(connection, cartDetail);
            }
            updateTotal(connection, cart);
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    @Override
    public boolean updateCartDetail(CartDetail cartDetail) {
        Connection connection = getConnection();
        return updateCartDetail(connection, cartDetail);
    }

    @Override
    public boolean insertCartDetail(Cart cart, CartDetail cartDetail) {
        Connection connection = getConnection();
        int rowEffect = 0;
        String sql = "INSERT INTO cartdetail(ID, CartID, BookItemID, Quantity, BuyPrice) VALUES(?, ?, ?, ?, ?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cartDetail.getID());
            preparedStatement.setString(2, cart.getID());
            preparedStatement.setString(3, cartDetail.getBookItem().getID());
            preparedStatement.setInt(4, cartDetail.getQuantity());
            preparedStatement.setDouble(5, cartDetail.getBuyPrice());
            rowEffect = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return rowEffect > 0;
    }

    @Override
    public boolean removeCartDetail(CartDetail cartDetail) {
        Connection connection = getConnection();
        return deleteCartDetail(connection, cartDetail);
    }

    @Override
    public CartDetail getCartDetailByID(String cartDetailID) {
        Connection connection = getConnection();
        String sql = "SELECT * FROM cartdetail WHERE ID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cartDetailID);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return new CartDetail(rs.getString("ID"), bookDao.getBookItemByID(rs.getString("BookItemID")),
                                    rs.getInt("Quantity"), rs.getDouble("BuyPrice") );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public void updateCart(Cart cart) {
        Connection connection = getConnection();
        List<CartDetail> cartDetailList = cart.getCartDetailList();
        for (CartDetail cartDetail : cartDetailList) {
            updateCartDetail(connection, cartDetail);
        }
        updateTotal(connection, cart);
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public void setCartStatus(Connection connection, Cart cart) {
        String sql = "UPDATE cart SET Status = ? WHERE ID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cart.getCartStatus().toString());
            preparedStatement.setString(2, cart.getID());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Cart createNewCart(Connection connection, Cart cart) {
        String sql = "INSERT INTO cart(ID, CustomerID, Total, Status) VALUES (?, ?, ?, ?);";
        int rowEffect = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cart.getID());
            preparedStatement.setString(2, cart.getCustomer().getID());
            preparedStatement.setDouble(3, cart.getTotal());
            preparedStatement.setString(4, cart.getCartStatus().toString());
            rowEffect = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return (rowEffect > 0) ? cart : null;
    }

    private List<CartDetail> getCartDetailList(Connection connection, String cartID) {
        bookDao = new BookDaoImpl();
        List<CartDetail> cartDetailList = new ArrayList<>();
        String sql = "SELECT cartDetail.* FROM cartDetail WHERE CartID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cartID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                CartDetail cartDetail = new CartDetail(rs.getString("ID"), bookDao.getBookItemByID(rs.getString("BookItemID")),
                                                        rs.getInt("Quantity"), rs.getDouble("BuyPrice"));
                cartDetailList.add(cartDetail);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cartDetailList;
    }

    private boolean updateCartDetail(Connection connection, CartDetail cartDetail) {
        int bookItemQuantityInStock = cartDetail.getBookItem().getQuantity();
        int bookItemQuantityInCart = cartDetail.getQuantity();
        bookItemQuantityInCart = (bookItemQuantityInCart < bookItemQuantityInStock) ? bookItemQuantityInCart : bookItemQuantityInStock;
        cartDetail.setQuantity(bookItemQuantityInCart);
        cartDetail.setBuyPrice(cartDetail.getBookItem().getBuyPrice());

        if (bookItemQuantityInCart > 0) {
            //update
            String sql = "UPDATE cartDetail SET Quantity = ?, BuyPrice = ? WHERE ID = ?; ";
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setInt(1, cartDetail.getQuantity());
                preparedStatement.setDouble(2, cartDetail.getBuyPrice());
                preparedStatement.setString(3, cartDetail.getID());
                return preparedStatement.executeUpdate() > 0;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            //delete
            return deleteCartDetail(connection, cartDetail);
        }
        return false;
    }

    private boolean deleteCartDetail(Connection connection, CartDetail cartDetail) {
        String sql = "DELETE FROM cartDetail WHERE ID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cartDetail.getID());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private void updateTotal(Connection connection, Cart cart) {
        double total = calcTotalCart(connection, cart.getID());
        String sql = "UPDATE cart SET Total = ? WHERE ID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setDouble(1, total);
            preparedStatement.setString(2, cart.getID());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private double calcTotalCart(Connection connection, String cartID) {
        double total = 0;
        String sql = "SELECT SUM(Quantity * BuyPrice) AS Total FROM cartdetail WHERE CartID = ? GROUP BY CartID;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cartID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                total = rs.getDouble("Total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }
}
