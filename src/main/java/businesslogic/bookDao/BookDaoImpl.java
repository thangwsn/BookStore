package businesslogic.bookDao;

import model.enumeration.Category;
import model.book.Author;
import model.book.BookItem;
import model.book.Image;
import model.book.Publisher;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDaoImpl implements BookDao {

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
    public List<BookItem> getBookItemListNewest(int number) {
        List<BookItem> bookItemList = new ArrayList<>();
        Connection connection = getConnection();
        String sql = "SELECT bookitem.*, publisher.name FROM bookitem INNER JOIN publisher ON bookitem.PublisherID = publisher.ID WHERE Quantity > 0 ORDER BY createDate DESC LIMIT ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, number);
            ResultSet rs = preparedStatement.executeQuery();
            bookItemList = extractBookItemListFromResultSet(connection, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bookItemList;
    }

    @Override
    public List<BookItem> getBookItemListBestSeller(int number) {
        List<BookItem> bookItemList = new ArrayList<>();
        Connection connection = getConnection();
        String sql = "SELECT bookitem.*, publisher.name FROM bookitem INNER JOIN publisher ON bookitem.PublisherID = publisher.ID WHERE Quantity > 0 ORDER BY soldQuantity DESC LIMIT ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, number);
            ResultSet rs = preparedStatement.executeQuery();
            bookItemList = extractBookItemListFromResultSet(connection, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bookItemList;
    }

    @Override
    public BookItem getBookItemByID(String bookItemID) {
        BookItem bookItem = new BookItem();
        Connection connection = getConnection();
        String sql = "SELECT bookitem.*, publisher.name FROM bookitem INNER JOIN publisher ON bookitem.PublisherID = publisher.ID WHERE bookitem.ID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, bookItemID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                bookItem.setID(rs.getString("ID"));
                bookItem.setISBN(rs.getString("ISBN"));
                bookItem.setTitle(rs.getString("Title"));
                bookItem.setSummary(rs.getString("Summary"));
                bookItem.setCategory(Category.valueOf(rs.getString("Category")));
                bookItem.setPublicationDate(rs.getDate("PublicationDate"));
                bookItem.setNumberOfPage(rs.getInt("NumberOfPage"));
                bookItem.setBuyPrice(rs.getDouble("BuyPrice"));
                bookItem.setQuantity(rs.getInt("Quantity"));
                bookItem.setSoldQuantity(rs.getInt("SoldQuantity"));
                bookItem.setCreateDate(rs.getDate("CreateDate"));
                bookItem.setPublisher(new Publisher(rs.getString("PublisherID"), rs.getString("name")));
                bookItem.setAuthorList(getAuthorListByBookItemID(connection, bookItem.getID()));
                bookItem.setImageList(getImageListByBookItemID(connection, bookItem.getID()));
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
        return bookItem;
    }

    @Override
    public List<BookItem> getAllBookItem() {
        List<BookItem> bookItemList = new ArrayList<>();
        Connection connection = getConnection();
        String sql = "SELECT bookitem.*, publisher.name FROM bookitem INNER JOIN publisher ON bookitem.PublisherID = publisher.ID WHERE Quantity > 0 ORDER BY createDate DESC";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            bookItemList = extractBookItemListFromResultSet(connection, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bookItemList;
    }

    @Override
    public List<BookItem> searchBookItemByName(String searchName) {
        List<BookItem> bookItemList = new ArrayList<>();
        Connection connection = getConnection();
        searchName = "'%" + searchName + "%'";
        String sql = "SELECT bookitem.*, publisher.name FROM bookitem INNER JOIN publisher ON bookitem.PublisherID = publisher.ID WHERE Title LIKE " + searchName + " ORDER BY createDate DESC";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            bookItemList = extractBookItemListFromResultSet(connection, rs);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bookItemList;
    }

    @Override
    public void updateBookItem(BookItem bookItem) {
        Connection connection = getConnection();
        String sql = "UPDATE bookitem SET PublisherID = ?, ISBN = ?, Title = ?, " +
                "Summary = ?, PublicationDate = ?, NumberOfPage = ?, BuyPrice = ?, " +
                "Quantity = ?, SoldQuantity = ?, Category = ? WHERE ID = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, bookItem.getPublisher().getID());
            preparedStatement.setString(2, bookItem.getISBN());
            preparedStatement.setString(3, bookItem.getTitle());
            preparedStatement.setString(4, bookItem.getSummary());
            preparedStatement.setDate(5, new Date(bookItem.getPublicationDate().getTime()));
            preparedStatement.setInt(6, bookItem.getNumberOfPage());
            preparedStatement.setDouble(7, bookItem.getBuyPrice());
            preparedStatement.setInt(8, bookItem.getQuantity());
            preparedStatement.setInt(9, bookItem.getSoldQuantity());
            preparedStatement.setString(10, bookItem.getCategory().toString());
            preparedStatement.setString(11, bookItem.getID());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public Publisher getPublisherByPublisherID(String publisherID) {
        Connection connection = getConnection();
        String sql = "SELECT * FROM publisher WHERE ID = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, publisherID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return new Publisher(rs.getString("ID"), rs.getString("Name"), rs.getString("Address"));
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
    public boolean saveBookItem(BookItem bookItem) {
        Connection connection = getConnection();
        boolean isSaved = false;
        try {
            connection.setAutoCommit(false);
            // save book item table
            String sql1 = "INSERT INTO bookitem(ID, ISBN, PublisherID, Title, Summary, PublicationDate, NumberOfPage, BuyPrice, Quantity, CreateDate, SoldQuantity, Category)" +
                    "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement preparedStatement1 = connection.prepareStatement(sql1);
            preparedStatement1.setString(1, bookItem.getID());
            preparedStatement1.setString(2, bookItem.getISBN());
            preparedStatement1.setString(3, bookItem.getPublisher().getID());
            preparedStatement1.setString(4, bookItem.getTitle());
            preparedStatement1.setString(5, bookItem.getSummary());
            preparedStatement1.setDate(6, new Date(bookItem.getPublicationDate().getTime()));
            preparedStatement1.setInt(7, bookItem.getNumberOfPage());
            preparedStatement1.setDouble(8, bookItem.getBuyPrice());
            preparedStatement1.setInt(9, bookItem.getQuantity());
            preparedStatement1.setDate(10, new Date(bookItem.getCreateDate().getTime()));
            preparedStatement1.setInt(11, bookItem.getSoldQuantity());
            preparedStatement1.setString(12, bookItem.getCategory().toString());
            preparedStatement1.executeUpdate();

            // save image
            String sql2 = "INSERT INTO image(ID, BookItemID, Path) VALUES(?, ?, ?);";
            for(Image image : bookItem.getImageList()) {
                PreparedStatement preparedStatement2 = connection.prepareStatement(sql2);
                preparedStatement2.setString(1, image.getID());
                preparedStatement2.setString(2, bookItem.getID());
                preparedStatement2.setString(3, image.getPath());
                preparedStatement2.executeUpdate();
            }

            // save author of book item
            String sql3 = "INSERT INTO bookitem_author(AuthorID, BookItemID) VALUES(?, ?);";
            for (Author author : bookItem.getAuthorList()) {
                PreparedStatement preparedStatement3 = connection.prepareStatement(sql3);
                preparedStatement3.setString(1, author.getID());
                preparedStatement3.setString(2, bookItem.getID());
                preparedStatement3.executeUpdate();
            }
            connection.commit();
            isSaved = true;
        } catch (SQLException e) {
            try {
                connection.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isSaved;
    }

    @Override
    public List<Publisher> getAllPublisher() {
        Connection connection = getConnection();
        List<Publisher> publisherList = new ArrayList<>();
        String sql = "SELECT * FROM publisher;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                publisherList.add(new Publisher(rs.getString("ID"), rs.getString("Name"), rs.getString("Address")));
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
        return publisherList;
    }

    @Override
    public List<Author> getAllAuthor() {
        Connection connection = getConnection();
        List<Author> authorList = new ArrayList<>();
        String sql = "SELECT * FROM author;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                authorList.add(new Author(rs.getString("ID"), rs.getString("FullName"), rs.getString("Biography"), rs.getString("Address")));
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
        return authorList;
    }

    @Override
    public Author getAuthorByAuthorID(String authorID) {
        Connection connection = getConnection();
        String sql = "SELECT * FROM author WHERE ID = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, authorID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return new Author(rs.getString("ID"), rs.getString("FullName"), rs.getString("Biography"), rs.getString("Address"));
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

    private List<Image> getImageListByBookItemID(Connection connection, String bookItemID) {
        List<Image> imageList = new ArrayList<>();
        String sql = "SELECT * FROM image WHERE BookItemID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, bookItemID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                imageList.add(new Image(rs.getString("ID"), rs.getString("Path")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return imageList;
    }

    private List<Author> getAuthorListByBookItemID(Connection connection, String bookItemID) {
        List<Author> authorList = new ArrayList<>();
        String sql = "SELECT * FROM author INNER JOIN bookitem_author ON author.ID = bookitem_author.AuthorID WHERE BookItemID = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, bookItemID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                authorList.add(new Author(rs.getString("ID"), rs.getString("FullName"), rs.getString("Biography"), rs.getString("Address")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return authorList;
    }

    private List<BookItem> extractBookItemListFromResultSet(Connection connection, ResultSet rs) throws SQLException {
        List<BookItem> bookItemList = new ArrayList<>();
        while (rs.next()) {
            BookItem bookItem = new BookItem();
            bookItem.setID(rs.getString("ID"));
            bookItem.setISBN(rs.getString("ISBN"));
            bookItem.setTitle(rs.getString("Title"));
            bookItem.setSummary(rs.getString("Summary"));
            bookItem.setCategory(Category.valueOf(rs.getString("Category")));
            bookItem.setPublicationDate(rs.getDate("PublicationDate"));
            bookItem.setNumberOfPage(rs.getInt("NumberOfPage"));
            bookItem.setBuyPrice(rs.getDouble("BuyPrice"));
            bookItem.setQuantity(rs.getInt("Quantity"));
            bookItem.setSoldQuantity(rs.getInt("SoldQuantity"));
            bookItem.setCreateDate(rs.getDate("CreateDate"));
            bookItem.setPublisher(new Publisher(rs.getString("PublisherID"), rs.getString("name")));
            bookItem.setAuthorList(getAuthorListByBookItemID(connection, bookItem.getID()));
            bookItem.setImageList(getImageListByBookItemID(connection, bookItem.getID()));
            bookItemList.add(bookItem);
        }
        return bookItemList;
    }
}
