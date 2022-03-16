/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Bean.AvailableService;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Time;
import java.util.Random;
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
public class ServiceUpdate extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServiceUpdate</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServiceUpdate at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String serviceOperation = request.getParameter("service-operation");
        String userId = request.getParameter("user-id");
        String serviceId = request.getParameter("service-id");
        String serviceTimeFrom = request.getParameter("service-time-from");
        String serviceTimeTo = request.getParameter("service-time-to");
        String serviceAvailability = request.getParameter("service-availability");
        String workingDays = "";
        for (int i = 1; i <= 7; i++) {
            workingDays += request.getParameter("day-of-week-" + i) != null ? "1" : "0";
        }

        AvailableService availableService;
        if (serviceOperation.equals("delete") || serviceOperation.equals("availabilty") ) {
            availableService = new AvailableService();
            availableService.setUserId(userId);
            availableService.setServiceId(serviceId);
        } else {
            availableService = new AvailableService(userId, serviceId, serviceAvailability != null, Time.valueOf(serviceTimeFrom + ":00"), Time.valueOf(serviceTimeTo + ":00"), workingDays, new Random().nextInt(6));
        }

        try {
            switch (serviceOperation) {
                case "add":
                    if (availableService.addService()) {
                        response.sendRedirect(request.getContextPath() + "/v1.0.0/social/profile.jsp");
                    } else {
                        request.getRequestDispatcher(request.getContextPath() + "/v1.0.0/service-upate.jsp").include(request, response);
                    }
                    break;
                case "modify":
                    if (availableService.updateService()) {
                        response.sendRedirect(request.getContextPath() + "/v1.0.0/social/profile.jsp");
                    } else {
                        request.getRequestDispatcher(request.getContextPath() + "/v1.0.0/service-upate.jsp").include(request, response);
                    }
                    break;
                case "delete":
                    if (availableService.deleteService()) {
                        response.sendRedirect(request.getContextPath() + "/v1.0.0/social/profile.jsp");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/v1.0.0/social/profile.jsp");
                    }
                    break;
                case "availabilty":
                    availableService = AvailableService.getService(userId, serviceId);
                    availableService.setAvailability(!availableService.isAvailability());
                    if (availableService.updateService()) {
                        response.sendRedirect(request.getContextPath() + "/v1.0.0/social/profile.jsp");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/v1.0.0/social/profile.jsp");
                    }
                    break;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ServiceUpdate.class.getName()).log(Level.SEVERE, null, ex);
            request.getRequestDispatcher(request.getContextPath() + "/v1.0.0/service-upate.jsp").include(request, response);
        }
    }
}
