package Bean;

import Utility.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;

public class AvailableService {

    private String userId;
    private String userName;
    private String serviceId;
    private String serviceName;
    private boolean availability;
    private Time timeFrom;
    private Time timeTo;
    private String workingDays;
    private float rating;

    public AvailableService() {
    }

    public AvailableService(String userId, String serviceId) {
        this.userId = userId;
        this.serviceId = serviceId;
    }

    public static ArrayList<AvailableService> getAllService() throws SQLException, ClassNotFoundException {
        String sqlQuery = "SELECT AvailableService.*,Service.ServiceName, User.UserName FROM AvailableService " +
                "INNER JOIN Service ON Service.ServiceID = AvailableService.ServiceID  " +
                "INNER JOIN User ON User.EmailID = AvailableService.UserID;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        ResultSet resultSet = statement.executeQuery();
        ArrayList<AvailableService> availableServices = new ArrayList<>();
        while (resultSet.next()) {
            AvailableService service = new AvailableService();
            service.setUserId(resultSet.getString("UserID"));
            service.setServiceId(resultSet.getString("ServiceID"));
            service.setAvailability(resultSet.getBoolean("Availability"));
            service.setTimeFrom(resultSet.getTime("TimeFrom"));
            service.setTimeTo(resultSet.getTime("TimeTo"));
            service.setWorkingDays(resultSet.getString("WorkingDays"));
            service.setRating(resultSet.getFloat("Rating"));
            service.setUserName(resultSet.getString("UserName"));
            service.setServiceName(resultSet.getString("ServiceName"));
            availableServices.add(service);
        }
        return availableServices;
    }

    public AvailableService(String userId, String serviceId, boolean availability, Time timeFrom, Time timeTo, String workingDays, float rating) {
        this.userId = userId;
        this.serviceId = serviceId;
        this.availability = availability;
        this.timeFrom = timeFrom;
        this.timeTo = timeTo;
        this.workingDays = workingDays;
        this.rating = rating;
    }

    public static AvailableService getService(String userId, String serviceId) throws SQLException, ClassNotFoundException {
        AvailableService availableService = new AvailableService(userId, serviceId);
        if (availableService.getService())
            return availableService;
        else return null;
    }

    public static ArrayList<AvailableService> searchServiceByUser(String userId) throws SQLException, ClassNotFoundException {
        String sqlQuery = "SELECT AvailableService.*,Service.ServiceName, User.UserName FROM AvailableService " +
                "INNER JOIN Service ON Service.ServiceID = AvailableService.ServiceID  " +
                "INNER JOIN User ON User.EmailID = AvailableService.UserID " +
                "WHERE AvailableService.UserID = ? ;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, userId);
        ResultSet resultSet = statement.executeQuery();
        ArrayList<AvailableService> availableServices = new ArrayList<>();
        while (resultSet.next()) {
            AvailableService service = new AvailableService();
            service.setUserId(resultSet.getString("UserID"));
            service.setServiceId(resultSet.getString("ServiceID"));
            service.setAvailability(resultSet.getBoolean("Availability"));
            service.setTimeFrom(resultSet.getTime("TimeFrom"));
            service.setTimeTo(resultSet.getTime("TimeTo"));
            service.setWorkingDays(resultSet.getString("WorkingDays"));
            service.setRating(resultSet.getFloat("Rating"));
            service.setUserName(resultSet.getString("UserName"));
            service.setServiceName(resultSet.getString("ServiceName"));
            availableServices.add(service);
        }
        return availableServices;
    }

    public static ArrayList<AvailableService> searchService(String serviceName) throws SQLException, ClassNotFoundException {
//        String sqlQuery = "SELECT * FROM AvailableService WHERE ServiceID = ( SELECT ServiceID FROM Service WHERE ServiceName = ? ) ;";
        String sqlQuery = "SELECT AvailableService.*,Service.ServiceName, User.UserName FROM AvailableService " +
                "INNER JOIN Service ON Service.ServiceID = AvailableService.ServiceID  " +
                "INNER JOIN User ON User.EmailID = AvailableService.UserID " +
                "WHERE AvailableService.Availability = 1 AND AvailableService.ServiceID = ANY" +
                " ( SELECT ServiceID FROM Service WHERE ServiceName LIKE ? ) ;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1,"%" + serviceName + "%");
        ResultSet resultSet = statement.executeQuery();
        ArrayList<AvailableService> availableServices = new ArrayList<>();
        while (resultSet.next()) {
            AvailableService service = new AvailableService();
            service.setUserId(resultSet.getString("UserID"));
            service.setServiceId(resultSet.getString("ServiceID"));
            service.setAvailability(resultSet.getBoolean("Availability"));
            service.setTimeFrom(resultSet.getTime("TimeFrom"));
            service.setTimeTo(resultSet.getTime("TimeTo"));
            service.setWorkingDays(resultSet.getString("WorkingDays"));
            service.setRating(resultSet.getFloat("Rating"));
            service.setUserName(resultSet.getString("UserName"));
            service.setServiceName(resultSet.getString("ServiceName"));
            availableServices.add(service);
        }
        return availableServices;
    }

    public boolean getService() throws SQLException, ClassNotFoundException {
        String sqlQuery = "SELECT AvailableService.*,Service.ServiceName, User.UserName FROM AvailableService " +
                "INNER JOIN Service ON Service.ServiceID = AvailableService.ServiceID  " +
                "INNER JOIN User ON User.EmailID = AvailableService.UserID " +
                "WHERE AvailableService.UserID = ? AND AvailableService.ServiceID = ? ;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, userId);
        statement.setString(2, serviceId);
        ResultSet resultSet = statement.executeQuery();
        boolean sqlResult = false;
        if (resultSet.next()) {
            availability = resultSet.getBoolean("Availability");
            timeFrom = resultSet.getTime("TimeFrom");
            timeTo = resultSet.getTime("TimeTo");
            workingDays = resultSet.getString("WorkingDays");
            rating = resultSet.getFloat("Rating");
            serviceName = resultSet.getString("ServiceName");
            userName = resultSet.getString("UserName");
            sqlResult = true;
        }
        statement.close();
        connection.close();
        return sqlResult;
    }

    public boolean addService() throws SQLException, ClassNotFoundException {
        String sqlQuery = "INSERT INTO AvailableService (UserID, ServiceID, Availability, TimeFrom, TimeTo, WorkingDays, Rating) VALUES (?,?,?,?,?,?,?);";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, userId);
        statement.setString(2, serviceId);
        statement.setBoolean(3, availability);
        statement.setTime(4, timeFrom);
        statement.setTime(5, timeTo);
        statement.setString(6, workingDays);
        statement.setFloat(7, rating);
        boolean sqlResult = statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return sqlResult && new Service(serviceId).incrementServiceCount();

    }

    public boolean deleteService() throws SQLException, ClassNotFoundException {
        String sqlQuery = "DELETE FROM AvailableService WHERE UserID = ? AND ServiceId = ?;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, userId);
        statement.setString(2, serviceId);
        boolean sqlResult = statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return sqlResult && new Service(serviceId).decrementServiceCount();
    }

    public boolean updateService() throws SQLException, ClassNotFoundException {
        String sqlQuery = "UPDATE AvailableService SET Availability = ?, TimeFrom = ?, TimeTo = ?, WorkingDays = ?, Rating = ? WHERE UserID = ? AND ServiceId = ?;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setBoolean(1, availability);
        statement.setTime(2, timeFrom);
        statement.setTime(3, timeTo);
        statement.setString(4, workingDays);
        statement.setFloat(5, rating);
        statement.setString(6, userId);
        statement.setString(7, serviceId);
        boolean sqlResult = statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return sqlResult;
    }

    public boolean enableAvailability() throws SQLException, ClassNotFoundException {
        String sqlQuery = "UPDATE AvailableService SET Availability = ? WHERE UserID = ? AND ServiceID = ? ;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setBoolean(1, true);
        statement.setString(2, userId);
        statement.setString(3, serviceId);
        availability = true;
        boolean sqlResult = statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return sqlResult;
    }

    public boolean disableAvailability() throws SQLException, ClassNotFoundException {
        String sqlQuery = "UPDATE AvailableService SET Availability = ? WHERE UserID = ? AND ServiceID = ? ;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setBoolean(1, false);
        statement.setString(2, userId);
        statement.setString(3, serviceId);
        availability = false;
        boolean sqlResult = statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return sqlResult;
    }

    public void displayService() {
        System.out.println("---------------------------------------------");
        System.out.println("UserID:\t" + userId);
        System.out.println("UserName:\t" + userName);
        System.out.println("ServiceID:\t" + serviceId);
        System.out.println("ServiceName:\t" + serviceName);
        System.out.println("Availability:\t" + availability);
        System.out.println("Time From:\t" + timeFrom);
        System.out.println("Time To:\t" + timeTo);
        System.out.println("WorkingDays:\t" + workingDays);
        System.out.println("Rating:\t" + rating);
        System.out.println("---------------------------------------------");
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public boolean isAvailability() {
        return availability;
    }

    public void setAvailability(boolean availability) {
        this.availability = availability;
    }

    public Time getTimeFrom() {
        return timeFrom;
    }

    public void setTimeFrom(Time timeFrom) {
        this.timeFrom = timeFrom;
    }

    public Time getTimeTo() {
        return timeTo;
    }

    public void setTimeTo(Time timeTo) {
        this.timeTo = timeTo;
    }

    public String getWorkingDays() {
        return workingDays;
    }

    public void setWorkingDays(String workingDays) {
        this.workingDays = workingDays;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }
}
