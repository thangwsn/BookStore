package businesslogic.orderDao;

import businesslogic.bookDao.BookDao;
import businesslogic.bookDao.BookDaoImpl;
import businesslogic.userDao.UserDao;
import businesslogic.userDao.UserDaoImpl;
import model.book.Book;
import model.book.BookItem;
import model.enumeration.*;
import model.order.*;
import model.user.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl implements OrderDao {
    private CartDao cartDao;
    private BookDao bookDao;
    private UserDao userDao;

    public OrderDaoImpl() {
        cartDao = new CartDaoImpl();
        bookDao = new BookDaoImpl();
        userDao = new UserDaoImpl();
    }

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
    public List<ShipmentType> getAllShipmentType() {
        Connection connection = getConnection();
        List<ShipmentType> shipmentTypeList = new ArrayList<>();
        String sql = "SELECT * FROM shipmenttype;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                shipmentTypeList.add(new ShipmentType(rs.getString("ID"), rs.getString("type"), rs.getDouble("fee")));
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
        return shipmentTypeList;
    }

    @Override
    public ShipmentType getShipmentTypeByID(String shipmentTypeID) {
        Connection connection = getConnection();
        String sql = "SELECT * FROM shipmenttype WHERE ID = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, shipmentTypeID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return new ShipmentType(rs.getString("ID"), rs.getString("type"), rs.getDouble("fee"));
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
    public boolean saveOrder(Order order) {
        Connection connection = getConnection();
        boolean isSaved = false;
        try {
            connection.setAutoCommit(false);

            // insert shipment
            String insertShipmentSql = "INSERT INTO shipment(ID, ShipmentTypeID, Address, Note, PhoneNumber) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(insertShipmentSql);
            preparedStatement.setString(1, order.getShipment().getID());
            preparedStatement.setString(2, order.getShipment().getShipmentType().getID());
            preparedStatement.setString(3, order.getShipment().getAddress());
            preparedStatement.setString(4, order.getShipment().getNote());
            preparedStatement.setString(5, order.getShipment().getPhoneNumber());
            preparedStatement.executeUpdate();

            // insert payment
            Payment payment = order.getPayment();
            String insertPaymentSql = "INSERT INTO payment(ID, Amount, CreateTime, PaymentType) VALUES (?, ?, ?, ?);";
            PreparedStatement preparedStatement1 = connection.prepareStatement(insertPaymentSql);
            preparedStatement1.setString(1, payment.getID());
            preparedStatement1.setDouble(2, payment.getAmount());
            preparedStatement1.setDate(3, new Date(payment.getCreateTime().getTime()));
            preparedStatement1.setString(4, payment.getPaymentType().toString());
            preparedStatement1.executeUpdate();

            PreparedStatement preparedStatement2 = null;
            if (payment.getPaymentType() == PaymentType.COD) {
                String insertCODSql = "INSERT INTO cod(PaymentID, Status) VALUES(?, ?);";
                preparedStatement2 = connection.prepareStatement(insertCODSql);
                preparedStatement2.setString(1, payment.getID());
                preparedStatement2.setString(2, ((COD) payment).getCodStatus().toString());
                preparedStatement2.executeUpdate();
            }
            if (payment.getPaymentType() == PaymentType.Credit) {
                String insertCreditSql = "INSERT INTO credit(PaymentID, Number, Name, ExpireDate) VALUES (?, ?, ?, ?);";
                preparedStatement2 = connection.prepareStatement(insertCreditSql);
                preparedStatement2.setString(1, payment.getID());
                preparedStatement2.setString(2, ((Credit) payment).getNumber());
                preparedStatement2.setString(3, ((Credit) payment).getName());
                preparedStatement2.setDate(4, new Date(((Credit) payment).getExpireDate().getTime()));
                preparedStatement2.executeUpdate();
            }
            if (payment.getPaymentType() == PaymentType.Check) {
                String insertCheckSql = "INSERT INTO `check`(PaymentID, Name, BankID) VALUES(?, ?, ?);";
                preparedStatement2 = connection.prepareStatement(insertCheckSql);
                preparedStatement2.setString(1, payment.getID());
                preparedStatement2.setString(2, ((Check) payment).getName());
                preparedStatement2.setString(3, ((Check) payment).getBankID());
                preparedStatement2.executeUpdate();
            }

            // insert order
            String insertOrderSql = "INSERT INTO `Order`(ID, CartID, ShipmentID, PaymentID, Status, CreateTime, CustomerID) VALUES(?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement preparedStatement3 = connection.prepareStatement(insertOrderSql);
            preparedStatement3.setString(1, order.getID());
            preparedStatement3.setString(2, order.getCart().getID());
            preparedStatement3.setString(3, order.getShipment().getID());
            preparedStatement3.setString(4, order.getPayment().getID());
            preparedStatement3.setString(5, order.getOrderStatus().toString());
            preparedStatement3.setDate(6, new Date(order.getCreateTime().getTime()));
            preparedStatement3.setString(7, order.getCustomer().getID());
            preparedStatement3.executeUpdate();

            // update book
            for (Book book : order.getBookList()) {
                String sql = "UPDATE book SET OrderID = ?, Status = ? WHERE ID = ?";
                PreparedStatement preparedStatement4 = connection.prepareStatement(sql);
                preparedStatement4.setString(1, order.getID());
                preparedStatement4.setString(2, BookStatus.Sold.toString());
                preparedStatement4.setString(3, book.getID());
                preparedStatement4.executeUpdate();
            }

            //update quantity of bookitem
            for (CartDetail cartDetail : order.getCart().getCartDetailList()) {
                BookItem bookItem = cartDetail.getBookItem();
                bookItem.setQuantity(bookItem.getQuantity() - cartDetail.getQuantity());
                bookItem.setSoldQuantity(bookItem.getSoldQuantity() + cartDetail.getQuantity());
                bookDao.updateBookItem(bookItem);
            }

            //update cart status
            order.getCart().setCartStatus(CartStatus.Completed);
            cartDao.setCartStatus(connection, order.getCart());

            //commit
            connection.commit();
            isSaved = true;
        } catch (Exception e) {
            isSaved = false;
            if (connection != null) {
                try {
                    connection.rollback();
                    connection.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
        return isSaved;
    }

    @Override
    public List<Book> getBookListForOrder(List<CartDetail> cartDetailList) {
        Connection connection = getConnection();
        List<Book> bookList = new ArrayList<>();
        for (CartDetail cartDetail : cartDetailList) {
            for (Book book : getBookInStock(connection, cartDetail)) {
                bookList.add(book);
            }
        }
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookList;
    }

    @Override
    public Order getOrderByOrderID(String orderID) {
        Connection connection = getConnection();
        Order order = new Order();

        String sql = "SELECT * FROM `order` WHERE ID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, orderID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                order.setID(rs.getString("ID"));
                order.setOrderStatus(OrderStatus.valueOf(rs.getString("Status")));
                order.setCreateTime(rs.getDate("CreateTime"));
                order.setCart(cartDao.getCartByCartID(rs.getString("CartID")));
                order.setShipment(getShipmentByShipmentID(connection, rs.getString("ShipmentID")));
                order.setPayment(getPaymentByPaymentID(connection, rs.getString("PaymentID")));
                order.setCustomer(new Customer());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    @Override
    public List<Order> getOrderByCustomerID(Customer customer) {
        Connection connection = getConnection();
        List<Order> orderList = new ArrayList<>();
        String sql = "SELECT `order`.* FROM `order` INNER JOIN cart ON `order`.CartID = cart.ID WHERE cart.CustomerID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, customer.getID());
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setID(rs.getString("ID"));
                order.setOrderStatus(OrderStatus.valueOf(rs.getString("Status")));
                order.setCreateTime(rs.getDate("CreateTime"));
                order.setCart(cartDao.getCartByCartID(rs.getString("CartID")));
                order.setShipment(getShipmentByShipmentID(connection, rs.getString("ShipmentID")));
                order.setPayment(getPaymentByPaymentID(connection, rs.getString("PaymentID")));
                order.setCustomer(new Customer());
                orderList.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }

    private Payment getPaymentByPaymentID(Connection connection, String paymentID) {
        Payment payment = new Payment();
        String sql = "SELECT * FROM payment WHERE ID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, paymentID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                payment.setID(rs.getString("ID"));
                payment.setAmount(rs.getDouble("Amount"));
                payment.setCreateTime(rs.getDate("CreateTime"));
                payment.setPaymentType(PaymentType.valueOf(rs.getString("PaymentType")));
            }
//            switch (payment.getPaymentType().toString()) {
//                case "COD":
//                    payment = castingCOD(connection, (COD) payment);
//                    break;
//                case "Credit":
//                    payment = castingCredit(connection, (Credit) payment);
//                    break;
//                case "Ckeck":
//                    payment = castingCheck(connection, (Check) payment);
//                    break;
//            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return payment;
    }

    private Check castingCheck(Connection connection, Check payment) {
        String sql = "SELECT * FROM `check` WHERE PaymentID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, payment.getID());
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                payment.setName(rs.getString("Name"));
                payment.setBankID(rs.getString("BankID"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payment;
    }

    private Credit castingCredit(Connection connection, Credit payment) {
        String sql = "SELECT * FROM credit WHERE PaymentID = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, payment.getID());
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                payment.setName(rs.getString("Name"));
                payment.setNumber(rs.getString("Number"));
                payment.setExpireDate(rs.getDate("ExpireDate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payment;
    }

    private COD castingCOD(Connection connection, COD payment) {
        String sql = "SELECT * FROM cod WHERE PaymentID = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, payment.getID());
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                payment.setCodStatus(CodStatus.valueOf(rs.getString("Status")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payment;
    }

    private Shipment getShipmentByShipmentID(Connection connection, String shipmentID) {
        Shipment shipment = new Shipment();
        String sql = "SELECT shipment.* FROM shipment WHERE ID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, shipmentID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                shipment.setID(rs.getString("ID"));
                shipment.setShipmentType(getShipmentTypeByID(rs.getString("ShipmentTypeID")));
                shipment.setAddress(rs.getString("Address"));
                shipment.setNote(rs.getString("Note"));
                shipment.setPhoneNumber(rs.getString("PhoneNumber"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return shipment;
    }

    private List<Book> getBookInStock(Connection connection, CartDetail cartDetail) {
        List<Book> bookList = new ArrayList<>();
        String sql = "SELECT * FROM book WHERE BookItemID = ? AND Status = ? ORDER BY CreateDate DESC LIMIT ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, cartDetail.getBookItem().getID());
            preparedStatement.setString(2, BookStatus.InStock.toString());
            preparedStatement.setInt(3, cartDetail.getQuantity());
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                bookList.add(new Book(rs.getString("ID")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookList;
    }
}
