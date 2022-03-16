package Bean;

import Utility.DatabaseConnection;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author abhis
 */
public class User {

    private String userName;
    private String emailId;
    private String password;
    private String userType;
    private Timestamp createdAt;

    public static User getUserById(String userId) {
        try {
            String sqlQuery = "SELECT * FROM User WHERE EmailID = ? ;";
            Connection connection = DatabaseConnection.initializeDatabase();
            PreparedStatement statement = connection.prepareStatement(sqlQuery);
            statement.setString(1, userId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                User user = new User();
                user.setUserName(resultSet.getString("UserName"));
                user.setEmailId(resultSet.getString("EmailID"));
                user.setPassword(resultSet.getString("Password"));
                user.setUserType(resultSet.getString("UserType"));
                user.setCreatedAt(resultSet.getTimestamp("created_at"));
                return user;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static String validateUser(String emailID, String password, String userType) {
        String result = "";
        try {
            Connection connection = DatabaseConnection.initializeDatabase();
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM User WHERE EmailID = ? AND UserType = ? ;");
            stmt.setString(1, emailID);
            stmt.setString(2, userType);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                if (rs.getString("Password").equals(password)) {
                    result = "login_success";
                } else {
                    result = "login_fail";
                }
            } else {
                result = "login_norecord";
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = "login_error";
        }
        return result;
    }

    public static String addUser(String userName, String emailID, String password, String userType) {
        String msg = "";
        try {
            Connection connection = DatabaseConnection.initializeDatabase();
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM User WHERE EmailID = ?;");
            stmt.setString(1, emailID);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                msg = "register_exist";
            } else {
                stmt.clearParameters();
                stmt = connection.prepareStatement("INSERT INTO User VALUES (?,?,?,?, CURRENT_TIMESTAMP);");
                stmt.setString(1, userName);
                stmt.setString(2, emailID);
                stmt.setString(3, password);
                stmt.setString(4, userType);
                if (stmt.executeUpdate() > 0) {
                    msg = "register_updated";
                } else {
                    msg = "register_failed";
                }
            }
        } catch (Exception e) {
            msg = "register_error";
        }
        return msg;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

}
