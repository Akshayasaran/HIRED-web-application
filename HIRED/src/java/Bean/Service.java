package Bean;

import Utility.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Service {

    private String serviceId;
    private String serviceName;
    private String description;
    private String categoryId;
    private int count;

    public Service() {
    }

    public Service(String serviceId) {
        this.serviceId = serviceId;
    }

    public Service(String serviceId, String serviceName, String description, String categoryId, int count) {
        this.serviceId = serviceId;
        this.serviceName = serviceName;
        this.description = description;
        this.categoryId = categoryId;
        this.count = count;
    }

    public static Service getService(String serviceId) throws SQLException, ClassNotFoundException {
        Service service = new Service(serviceId);
        if (service.getService())
            return service;
        else return null;
    }
    
    public static ArrayList<Service> getAllService() throws SQLException, ClassNotFoundException {
        String sqlQuery = "SELECT * FROM Service ORDER BY CategoryID ASC;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        ResultSet resultSet = statement.executeQuery();
        ArrayList<Service> services = new ArrayList<>();
        while (resultSet.next()) {
            Service service = new Service();
            service.setServiceId(resultSet.getString("ServiceID"));
            service.setServiceName(resultSet.getString("ServiceName"));
            service.setDescription(resultSet.getString("Description"));
            service.setCategoryId(resultSet.getString("CategoryID"));
            service.setCount(resultSet.getInt("Count"));
            services.add(service);
        }
        return services;
    }
    
    public static ArrayList<Service> getTopNService(int n) throws SQLException, ClassNotFoundException {
        String sqlQuery = "SELECT * FROM service ORDER BY Count DESC Limit ?;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setInt(1, n);
        ResultSet resultSet = statement.executeQuery();
        ArrayList<Service> services = new ArrayList<>();
        while (resultSet.next()) {
            Service service = new Service();
            service.setServiceId(resultSet.getString("ServiceID"));
            service.setServiceName(resultSet.getString("ServiceName"));
            service.setDescription(resultSet.getString("Description"));
            service.setCategoryId(resultSet.getString("CategoryID"));
            service.setCount(resultSet.getInt("Count"));
            services.add(service);
        }
        return services;
    }

    public static ArrayList<Service> getServiceByCategory(String categoryId) throws SQLException, ClassNotFoundException {
        String sqlQuery = "SELECT * FROM Service WHERE CategoryID = ? ;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1,categoryId);
        ResultSet resultSet = statement.executeQuery();
        ArrayList<Service> services = new ArrayList<>();
        while (resultSet.next()) {
            Service service = new Service();
            service.setServiceId(resultSet.getString("ServiceID"));
            service.setServiceName(resultSet.getString("ServiceName"));
            service.setDescription(resultSet.getString("Description"));
            service.setCategoryId(resultSet.getString("CategoryID"));
            service.setCount(resultSet.getInt("Count"));
            services.add(service);
        }
        return services;
    }

    public boolean getService() throws SQLException, ClassNotFoundException {
        String sqlQuery = "SELECT * FROM Service WHERE ServiceID = ?;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, serviceId);
        ResultSet resultSet = statement.executeQuery();
        boolean sqlResult = false;
        if (resultSet.next()) {
            serviceName = resultSet.getString("ServiceName");
            description = resultSet.getString("Description");
            categoryId = resultSet.getString("CategoryID");
            count = resultSet.getInt("Count");
            sqlResult = true;
        }
        statement.close();
        connection.close();
        return sqlResult;
    }

    public boolean addService() throws SQLException, ClassNotFoundException {
        String sqlQuery = "INSERT INTO Service (ServiceID, ServiceName, Description, CategoryID, Count) VALUES (?,?,?,?,?);";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, serviceId);
        statement.setString(2, serviceName);
        statement.setString(3, description);
        statement.setString(4, categoryId);
        statement.setInt(5, count);

        boolean sqlResult = statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return sqlResult;
    }

    public boolean deleteService() throws SQLException, ClassNotFoundException {
        String sqlQuery = "DELETE FROM Service WHERE ServiceId = ?;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, serviceId);
        boolean sqlResult = statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return sqlResult;
    }

    public boolean updateService() throws SQLException, ClassNotFoundException {
        String sqlQuery = "UPDATE Service SET ServiceName = ?, Description = ?, CategoryID = ?, Count = ? WHERE ServiceID = ? ;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, serviceName);
        statement.setString(2, description);
        statement.setString(3, categoryId);
        statement.setInt(4, count);
        statement.setString(5, serviceId);
        boolean sqlResult = statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return sqlResult;
    }

    public boolean incrementServiceCount() throws SQLException, ClassNotFoundException {
        String sqlQuery = "UPDATE Service SET Count = Count + 1 WHERE ServiceID = ? ;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, serviceId);
        boolean sqlResult = statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return sqlResult;
    }

    public boolean decrementServiceCount() throws SQLException, ClassNotFoundException {
        String sqlQuery = "UPDATE Service SET Count = Count - 1 WHERE ServiceID = ? ;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, serviceId);
        boolean sqlResult = statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return sqlResult;
    }

    public void displayService() {
        System.out.println("---------------------------------------------");
        System.out.println("ServiceID:\t" + serviceId);
        System.out.println("ServiceName:\t" + serviceName);
        System.out.println("Description:\t" + description);
        System.out.println("CategoryID:\t" + categoryId);
        System.out.println("Count:\t" + count);
        System.out.println("---------------------------------------------");
    }

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }
}
