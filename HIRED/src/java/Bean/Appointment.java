/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import Utility.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;

public class Appointment {
    
    public static final String ACCEPT = "Accept";
    public static final String REJECT = "Reject";
    public static final String PENDING = "Pending";

    private String serviceProviderId;
    private String serviceProviderName;
    private String serviceReceiverId;
    private String serviceReceiverName;
    private String serviceId;
    private String serviceName;
    private Time time;
    private Date date;
    private String status;
    private String comment;

    public Appointment() {
    }

    public Appointment(String serviceProviderId, String serviceReceiverId, String serviceId, Time time, Date date, String comment) {
        this.serviceProviderId = serviceProviderId;
        this.serviceReceiverId = serviceReceiverId;
        this.serviceId = serviceId;
        this.time = time;
        this.date = date;
        this.comment = comment;
    }

    public static ArrayList<Appointment> getAllAppointment() throws SQLException, ClassNotFoundException {
        String sqlQuery = "SELECT" +
                " A1.*, U1.UserName AS ProviderName, U2.UserName AS ReceiverName, S1.ServiceName AS ServiceName " +
                "FROM Appointment A1 " +
                "INNER JOIN User U1 ON U1.EmailID = A1.ServiceProviderID " +
                "INNER JOIN User U2 ON U2.EmailID = A1.ServiceReceiverID " +
                "INNER JOIN Service S1 ON S1.ServiceID = A1.ServiceID";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        ResultSet resultSet = statement.executeQuery();
        ArrayList<Appointment> appointments = new ArrayList<>();
        while (resultSet.next()) {
            Appointment appointment = new Appointment();
            appointment.setServiceProviderId(resultSet.getString("ServiceProviderID"));
            appointment.setServiceProviderName(resultSet.getString("ProviderName"));
            appointment.setServiceReceiverId(resultSet.getString("ServiceReceiverID"));
            appointment.setServiceReceiverName(resultSet.getString("ReceiverName"));
            appointment.setServiceId(resultSet.getString("ServiceID"));
            appointment.setServiceName(resultSet.getString("ServiceName"));
            appointment.setTime(resultSet.getTime("Time"));
            appointment.setDate(resultSet.getDate("Date"));
            appointment.setStatus(resultSet.getString("Status"));
            appointment.setComment(resultSet.getString("Comment"));
            appointments.add(appointment);
        }
        statement.close();
        connection.close();
        return appointments;
    }

    public static ArrayList<Appointment> getAppointmentByProvider(String providerId) throws SQLException, ClassNotFoundException {
        String sqlQuery = "SELECT" +
                " A1.*, U1.UserName AS ProviderName, U2.UserName AS ReceiverName, S1.ServiceName AS ServiceName " +
                "FROM Appointment A1 " +
                "INNER JOIN User U1 ON U1.EmailID = A1.ServiceProviderID " +
                "INNER JOIN User U2 ON U2.EmailID = A1.ServiceReceiverID " +
                "INNER JOIN Service S1 ON S1.ServiceID = A1.ServiceID "+
                "WHERE A1.ServiceProviderID = ?;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, providerId);
        ResultSet resultSet = statement.executeQuery();
        ArrayList<Appointment> appointments = new ArrayList<>();
        while (resultSet.next()) {
            Appointment appointment = new Appointment();
            appointment.setServiceProviderId(resultSet.getString("ServiceProviderID"));
            appointment.setServiceProviderName(resultSet.getString("ProviderName"));
            appointment.setServiceReceiverId(resultSet.getString("ServiceReceiverID"));
            appointment.setServiceReceiverName(resultSet.getString("ReceiverName"));
            appointment.setServiceId(resultSet.getString("ServiceID"));
            appointment.setServiceName(resultSet.getString("ServiceName"));
            appointment.setTime(resultSet.getTime("Time"));
            appointment.setDate(resultSet.getDate("Date"));
            appointment.setStatus(resultSet.getString("Status"));
            appointment.setComment(resultSet.getString("Comment"));
            appointments.add(appointment);
        }
        statement.close();
        connection.close();
        return appointments;
    }

    public static ArrayList<Appointment> getAppointmentByReceiver(String receiverId) throws SQLException, ClassNotFoundException {
        String sqlQuery = "SELECT" +
                " A1.*, U1.UserName AS ProviderName, U2.UserName AS ReceiverName, S1.ServiceName AS ServiceName " +
                "FROM Appointment A1 " +
                "INNER JOIN User U1 ON U1.EmailID = A1.ServiceProviderID " +
                "INNER JOIN User U2 ON U2.EmailID = A1.ServiceReceiverID " +
                "INNER JOIN Service S1 ON S1.ServiceID = A1.ServiceID "+
                "WHERE A1.ServiceReceiverID = ? ;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, receiverId);
        ResultSet resultSet = statement.executeQuery();
        ArrayList<Appointment> appointments = new ArrayList<>();
        while (resultSet.next()) {
            Appointment appointment = new Appointment();
            appointment.setServiceProviderId(resultSet.getString("ServiceProviderID"));
            appointment.setServiceProviderName(resultSet.getString("ProviderName"));
            appointment.setServiceReceiverId(resultSet.getString("ServiceReceiverID"));
            appointment.setServiceReceiverName(resultSet.getString("ReceiverName"));
            appointment.setServiceId(resultSet.getString("ServiceID"));
            appointment.setServiceName(resultSet.getString("ServiceName"));
            appointment.setTime(resultSet.getTime("Time"));
            appointment.setDate(resultSet.getDate("Date"));
            appointment.setStatus(resultSet.getString("Status"));
            appointment.setComment(resultSet.getString("Comment"));
            appointments.add(appointment);
        }
        statement.close();
        connection.close();
        return appointments;
    }

    public static Appointment getAppointmentById(String providerId,String receiverId,String serviceId) throws SQLException, ClassNotFoundException {
        String sqlQuery = "SELECT" +
                " A1.*, U1.UserName AS ProviderName, U2.UserName AS ReceiverName, S1.ServiceName AS ServiceName " +
                "FROM Appointment A1 " +
                "INNER JOIN User U1 ON U1.EmailID = A1.ServiceProviderID " +
                "INNER JOIN User U2 ON U2.EmailID = A1.ServiceReceiverID " +
                "INNER JOIN Service S1 ON S1.ServiceID = A1.ServiceID " +
                "WHERE A1.ServiceProviderID = ? AND A1.ServiceReceiverID = ? AND A1.ServiceID = ? ";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, providerId);
        statement.setString(2, receiverId);
        statement.setString(3, serviceId);
        ResultSet resultSet = statement.executeQuery();
        Appointment appointment = null;
        if (resultSet.next()) {
            appointment = new Appointment();
            appointment.setServiceProviderId(resultSet.getString("ServiceProviderID"));
            appointment.setServiceProviderName(resultSet.getString("ProviderName"));
            appointment.setServiceReceiverId(resultSet.getString("ServiceReceiverID"));
            appointment.setServiceReceiverName(resultSet.getString("ReceiverName"));
            appointment.setServiceId(resultSet.getString("ServiceID"));
            appointment.setServiceName(resultSet.getString("ServiceName"));
            appointment.setTime(resultSet.getTime("Time"));
            appointment.setDate(resultSet.getDate("Date"));
            appointment.setStatus(resultSet.getString("Status"));
            appointment.setComment(resultSet.getString("Comment"));
        }
        statement.close();
        connection.close();
        return appointment;
    }

    public boolean addAppointment() throws SQLException, ClassNotFoundException {
        String sqlQuery = "INSERT INTO Appointment (ServiceProviderID, ServiceReceiverID, ServiceID, Time, Date, Comment) VALUES (?,?,?,?,?,?);";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, serviceProviderId);
        statement.setString(2, serviceReceiverId);
        statement.setString(3, serviceId);
        statement.setTime(4, time);
        statement.setDate(5, date);
        statement.setString(6, comment);
        boolean sqlResult = statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return sqlResult;
    }

    public boolean updateAppointment() throws SQLException, ClassNotFoundException {
        String sqlQuery = "UPDATE Appointment SET Time = ?, Date = ?, Comment = ? WHERE ServiceProviderID = ? AND ServiceReceiverID = ? AND ServiceID = ? ;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setTime(1,time);
        statement.setDate(2, date);
        statement.setString(3, comment);
        statement.setString(4, serviceProviderId);
        statement.setString(5, serviceReceiverId);
        statement.setString(6,serviceId);
        boolean sqlResult = statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return sqlResult;
    }

    public boolean deleteAppointment() throws SQLException, ClassNotFoundException {
        String sqlQuery = "DELETE FROM Appointment WHERE ServiceProviderID = ? AND ServiceReceiverID = ? AND ServiceId = ?;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, serviceProviderId);
        statement.setString(2, serviceReceiverId);
        statement.setString(3, serviceId);
        boolean sqlResult = statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return sqlResult;
    }
    
    public boolean respondToAppointment(String respond) throws SQLException, ClassNotFoundException {
        String sqlQuery = "UPDATE Appointment SET Status = ? WHERE ServiceProviderID = ? AND ServiceReceiverID = ? AND ServiceID = ? ;";
        Connection connection = DatabaseConnection.initializeDatabase();
        PreparedStatement statement = connection.prepareStatement(sqlQuery);
        statement.setString(1, respond);
        statement.setString(2, serviceProviderId);
        statement.setString(3, serviceReceiverId);
        statement.setString(4,serviceId);
        boolean sqlResult = statement.executeUpdate() > 0;
        statement.close();
        connection.close();
        return sqlResult;
    }

    public void displayAppointment(){
        System.out.println("---------------------------------------------");
        System.out.println("ServiceProviderID:\t" + serviceProviderId);
        System.out.println("ServiceProviderName:\t" + serviceProviderName);
        System.out.println("ServiceReceiverID:\t" + serviceReceiverId);
        System.out.println("ServiceReceiverName:\t" + serviceReceiverName);
        System.out.println("ServiceID:\t" + serviceId);
        System.out.println("ServiceName:\t" + serviceName);
        System.out.println("Time:\t" + time);
        System.out.println("Date:\t" + date);
        System.out.println("Status:\t" + status);
        System.out.println("Comment:\t" + comment);
        System.out.println("---------------------------------------------");
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getServiceProviderId() {
        return serviceProviderId;
    }

    public void setServiceProviderId(String serviceProviderId) {
        this.serviceProviderId = serviceProviderId;
    }

    public String getServiceProviderName() {
        return serviceProviderName;
    }

    public void setServiceProviderName(String serviceProviderName) {
        this.serviceProviderName = serviceProviderName;
    }

    public String getServiceReceiverId() {
        return serviceReceiverId;
    }

    public void setServiceReceiverId(String serviceReceiverId) {
        this.serviceReceiverId = serviceReceiverId;
    }

    public String getServiceReceiverName() {
        return serviceReceiverName;
    }

    public void setServiceReceiverName(String serviceReceiverName) {
        this.serviceReceiverName = serviceReceiverName;
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

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
