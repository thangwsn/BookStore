package businesslogic.userDao;

import model.user.Customer;

import java.sql.*;
import java.util.List;

public class CustomerDaoImpl implements CustomerDao {

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
    public boolean addCustomer(Customer customer) {
        Connection connection = getConnection();
        boolean isSaved = false;
        try {
            connection.setAutoCommit(false);

            // add Account
            String addAccountSQL = "INSERT INTO account(ID, Username, Password) VALUES(?, ?, ?);";
            PreparedStatement preparedStatement = connection.prepareStatement(addAccountSQL);
            preparedStatement.setString(1, customer.getAccount().getID());
            preparedStatement.setString(2, customer.getAccount().getUsername());
            preparedStatement.setString(3, customer.getAccount().getPassword());
            preparedStatement.executeUpdate();

            // add Full name
            String addFullNameSQL = "INSERT INTO fullname(ID, FirstName, LastName) VALUES(?, ?, ?);";
            PreparedStatement preparedStatement1 = connection.prepareStatement(addFullNameSQL);
            preparedStatement1.setString(1, customer.getFullName().getID());
            preparedStatement1.setString(2, customer.getFullName().getFirstName());
            preparedStatement1.setString(3, customer.getFullName().getLastName());
            preparedStatement1.executeUpdate();

            // add Address
            String addAddressSQL = "INSERT INTO address(ID, Ward, District, Province, Country) VALUES(?, ?, ?, ?, ?);";
            PreparedStatement preparedStatement2 = connection.prepareStatement(addAddressSQL);
            preparedStatement2.setString(1, customer.getAddress().getID());
            preparedStatement2.setString(2, customer.getAddress().getWard());
            preparedStatement2.setString(3, customer.getAddress().getDistrict());
            preparedStatement2.setString(4, customer.getAddress().getProvince());
            preparedStatement2.setString(5, customer.getAddress().getCountry());
            preparedStatement2.executeUpdate();

            // add User
            String addUserSQL = "INSERT INTO user(ID, AcccountID, FullNameID, AddressID, Email, PhoneNumber, Dob, Gender, Role) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?);";
            PreparedStatement preparedStatement3 = connection.prepareStatement(addUserSQL);
            preparedStatement3.setString(1, customer.getID());
            preparedStatement3.setString(2, customer.getAccount().getID());
            preparedStatement3.setString(3, customer.getFullName().getID());
            preparedStatement3.setString(4, customer.getAddress().getID());
            preparedStatement3.setString(5, customer.getEmail());
            preparedStatement3.setString(6, customer.getPhoneNumber());
            preparedStatement3.setDate(7, new Date(customer.getDob().getTime()));
            preparedStatement3.setString(8, customer.getGender().toString());
            preparedStatement3.setString(9, customer.getRole().toString());
            preparedStatement3.executeUpdate();

            // add Customer
            String addCustomerSQL = "INSERT INTO customer(UserID, MemberLevel) VALUES(?, ?);";
            PreparedStatement preparedStatement4 = connection.prepareStatement(addCustomerSQL);
            preparedStatement4.setString(1, customer.getID());
            preparedStatement4.setString(2, customer.getMemberLevel().toString());
            preparedStatement4.executeUpdate();

            connection.commit();
            isSaved = true;

        } catch (SQLException throwables) {
            try {
                connection.rollback();
                connection.close();
                isSaved = false;
            } catch (SQLException e) {
                e.printStackTrace();
            }

            throwables.printStackTrace();
        }
        return isSaved;
    }

    @Override
    public List<Customer> getAllCustomer() {
        return null;
    }
}
