package Bean;

import Utility.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Category {

    private String categoryId;
    private String categoryName;
    private String description;

    public Category() {
    }

    public Category(String categoryId) {
        this.categoryId = categoryId;
    }

    public Category(String categoryId, String categoryName, String description) {
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.description = description;
    }

    public static Category getCategory(String categoryId) throws SQLException, ClassNotFoundException {
        Category category = new Category(categoryId);
        if (category.getCategory())
            return category;
        else return null;
    }
    
    public static ArrayList<Category> getALlCategory() throws SQLException, ClassNotFoundException {
        String sqlQuery = "SELECT * FROM Category ORDER BY CategoryID ASC;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        ResultSet resultSet = statement.executeQuery();
        ArrayList<Category> categories = new ArrayList<>();
        while (resultSet.next()) {
            Category category = new Category();
            category.setCategoryId(resultSet.getString("CategoryID"));
            category.setCategoryName(resultSet.getString("CategoryName"));
            category.setDescription(resultSet.getString("Description"));
            categories.add(category);
        }
        return categories;
    }

    public boolean getCategory() throws SQLException, ClassNotFoundException {
        String sqlQuery = "SELECT * FROM Category WHERE CategoryID = ?;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, categoryId);
        ResultSet resultSet = statement.executeQuery();
        boolean sqlResult = false;
        if (resultSet.next()) {
            categoryName = resultSet.getString("CategoryName");
            description = resultSet.getString("Description");
            sqlResult =  true;
        }
        statement.close();
        connection.close();
        return sqlResult;
    }

    public boolean addCategory() throws SQLException, ClassNotFoundException {
        String sqlQuery = "INSERT INTO Category (CategoryID, CategoryName, Description) VALUES (?, ?, ?);";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, categoryId);
        statement.setString(2, categoryName);
        statement.setString(3, description);
        boolean sqlResult =  statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return sqlResult;
    }

    public boolean deleteCategory() throws SQLException, ClassNotFoundException {
        String sqlQuery = "DELETE FROM Category WHERE CategoryId = ?;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, categoryId);
        boolean sqlResult =  statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return sqlResult;
    }

    public boolean updateCategory() throws SQLException, ClassNotFoundException {
        String sqlQuery = "UPDATE Category SET CategoryName = ? , Description = ? WHERE CategoryID = ?;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, categoryName);
        statement.setString(2, description);
        statement.setString(3, categoryId);
        boolean sqlResult =  statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return sqlResult;
    }

    public void displayCategory() {
        System.out.println("---------------------------------------------");
        System.out.println("CategoryID:\t" + categoryId);
        System.out.println("CategoryName:\t" + categoryName);
        System.out.println("Description:\t" + description);
        System.out.println("---------------------------------------------");
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
