package Servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author abhis
 */
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String emailID = request.getParameter("login_emailid");
        String password = request.getParameter("login_password");
        String userType = request.getParameter("login_usertype");
        try {
            //String destPage = request.getContextPath()+ "/v1.0.0/authentication/basic/login.jsp";
            String message = User.validateUser(emailID, password, userType);
            Cookie messageCookie = new Cookie("message", message);
            messageCookie.setMaxAge(5);
            response.addCookie(messageCookie);
            if(message.equals("login_success")){
                HttpSession session = request.getSession();
                session.setAttribute("loginUser", emailID);
                Cookie loginUser = new Cookie("loginUser", emailID);
                session.setMaxInactiveInterval(30*60);
                loginUser.setMaxAge(30*60);
                response.addCookie(loginUser);
                response.sendRedirect(request.getContextPath()+ "/v1.0.0/home.jsp");
            }
            else{
                response.sendRedirect(request.getContextPath()+ "/v1.0.0/authentication/basic/login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            Cookie message = new Cookie("message", "login_error");
            message.setMaxAge(5);
            response.addCookie(message);
            response.sendRedirect(request.getContextPath()+ "/v1.0.0/authentication/basic/login.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
