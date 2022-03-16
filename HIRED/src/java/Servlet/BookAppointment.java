/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Bean.Appointment;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author abhis
 */
public class BookAppointment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String appointmentOperation = request.getParameter("appointment-operation");
        String serviceReceiverId = request.getParameter("receiver-id");
        String serviceId = request.getParameter("service-id");
        String serviceName = request.getParameter("service-name");
        String serviceProviderId = request.getParameter("service-provider-id");
        String serviceProviderName = request.getParameter("provider-name");
        String serviceTime = request.getParameter("service-time");
        String serviceDate = request.getParameter("service-date");
        String appointmentRespond = request.getParameter("appointment-respond");
        String comment = request.getParameter("service-comment");
        comment = comment != null ? comment : "";
        Appointment appointment;
        if (appointmentOperation.equals("add") || appointmentOperation.equals("modify")) {
            appointment = new Appointment(serviceProviderId, serviceReceiverId, serviceId, Time.valueOf(serviceTime + ":00"), Date.valueOf(serviceDate), comment);
        } else {
            appointment = new Appointment();
            appointment.setServiceProviderId(serviceProviderId);
            appointment.setServiceReceiverId(serviceReceiverId);
            appointment.setServiceId(serviceId);
        }
        try {
            switch (appointmentOperation) {
                case "add":
                    if (appointment.addAppointment()) {
                        response.sendRedirect(request.getContextPath() + "/v1.0.0/home.jsp");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/v1.0.0/appointment-book.jsp");
                    }
                    break;
                case "modify":
                    if (appointment.updateAppointment()) {
                        response.sendRedirect(request.getContextPath() + "/v1.0.0/home.jsp");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/v1.0.0/appointment-book.jsp");
                    }
                    break;
                case "delete":
                    if (appointment.deleteAppointment()) {
                        response.sendRedirect(request.getContextPath() + "/v1.0.0/appointment.jsp");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/v1.0.0/appointment.jsp");
                    }
                    break;
                case "respond":
                    if (appointment.respondToAppointment(appointmentRespond)) {
                        response.sendRedirect(request.getContextPath() + "/v1.0.0/appointment.jsp");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/v1.0.0/appointment.jsp");
                    }
                    break;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(BookAppointment.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect(request.getContextPath() + "/v1.0.0/home.jsp");
        }

    }

}
