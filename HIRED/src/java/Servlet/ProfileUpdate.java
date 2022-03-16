package Servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Bean.IProfile;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
@WebServlet(urlPatterns = {"/ProfileUpdate"})
public class ProfileUpdate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String profileOperation="";
        try {
            profileOperation = request.getParameter("profile-operation");
            IProfile userProfile = new IProfile(request);
            String message = "";
            Cookie messageCookie;
            switch (profileOperation) {
                case "add":
                    message = userProfile.addProfile();
                    messageCookie = new Cookie("message", message);
                    messageCookie.setMaxAge(5);
                    response.addCookie(messageCookie);
                    if (message.equals("profile_success")) {
                        response.sendRedirect(request.getContextPath() + "/v1.0.0/home.jsp");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/v1.0.0/authentication/profilesetup.jsp?operation=add");
//                        request.getRequestDispatcher(request.getContextPath() + "/v1.0.0/authentication/profilesetup.jsp").include(request, response);
                    }
                    break;
                case "modify":
                    message = userProfile.updateProfile();
                    messageCookie = new Cookie("message", message);
                    messageCookie.setMaxAge(5);
                    response.addCookie(messageCookie);
                    if (message.equals("profile_success")) {
                        response.sendRedirect(request.getContextPath() + "/v1.0.0/home.jsp");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/v1.0.0/authentication/profilesetup.jsp?operation=modify");
//                        request.getRequestDispatcher(request.getContextPath() + "/v1.0.0/authentication/profilesetup.jsp").include(request, response);
                    }
                    break;
            }

        } catch (Exception e) {
            Cookie messageCookie = new Cookie("message", "profile_error");
            messageCookie.setMaxAge(5);
            response.addCookie(messageCookie);
            response.sendRedirect(request.getContextPath() + "/v1.0.0/authentication/profilesetup.jsp?operation="+profileOperation);
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
