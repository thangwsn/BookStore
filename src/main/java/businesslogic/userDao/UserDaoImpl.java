package businesslogic.userDao;

import model.enumeration.Gender;
import model.enumeration.Role;
import model.user.Account;
import model.user.Address;
import model.user.Fullname;
import model.user.User;

import java.sql.*;

public class UserDaoImpl implements UserDao{

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
    public Account login(Account account) {
        Connection connection = getConnection();
        String sql = "SELECT * FROM account WHERE Username = ? AND Password = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, account.getUsername());
            preparedStatement.setString(2, account.getPassword());
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return new Account(rs.getString("ID"), rs.getString("Username"), "" );
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
    public User getUserByAccountID(String accountID) {
        Connection connection = getConnection();
        User user = null;
        String sql = "SELECT user.*, account.Username, address.Country, address.Province, address.District, address.Ward, fullname.FirstName, fullname.LastName " +
                "FROM user " +
                "INNER JOIN account " +
                "ON user.AcccountID = account.ID " +
                "INNER JOIN address " +
                "ON user.AddressID = address.ID " +
                "INNER JOIN fullname " +
                "ON user.FullnameID = fullname.ID " +
                "WHERE user.AcccountID = ? ";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, accountID);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setID(rs.getString("ID"));
                user.setEmail(rs.getString("Email"));
                user.setPhoneNumber(rs.getString("PhoneNumber"));
                user.setDob(rs.getDate("Dob"));
                user.setGender(Gender.valueOf(rs.getString("Gender")));
                user.setRole(Role.valueOf(rs.getString("Role")));
                user.setAccount(new Account(rs.getString("AcccountID"), rs.getString("Username"), ""));
                user.setFullName(new Fullname(rs.getString("FullnameID"), rs.getString("FirstName"),
                                            rs.getString("LastName")));
                user.setAddress(new Address(rs.getString("AddressID"), rs.getString("Ward"),
                                            rs.getString("District"), rs.getString("Province"),
                                            rs.getString("Country")));
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
        return user;
    }

    @Override
    public boolean isExistedUsername(String username) {
        Connection connection = getConnection();
        String sql = "SELECT Username FROM account WHERE Username = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return true;
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
        return false;
    }

    @Override
    public boolean isExistedEmail(String email) {
        Connection connection = getConnection();
        String sql = "SELECT Email FROM user WHERE Email = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return true;
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
        return false;
    }

    @Override
    public boolean isExistedPhoneNumber(String phoneNumber) {
        Connection connection = getConnection();
        String sql = "SELECT PhoneNumber FROM user WHERE PhoneNumber = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, phoneNumber);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return true;
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
        return false;
    }
}
