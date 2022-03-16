<%-- 
    Document   : home.jsp
    Created on : 22 Mar, 2021, 11:58:23 AM
    Author     : abhis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if(session.getAttribute("loginUser") == null){
                    out.print("Please login first");
            }
            else{
                out.print("Welcome "+session.getAttribute("loginUser"));
            }
            
            /*session=request.getSession(false);  
            if(session!=null){ 
            String name=(String)session.getAttribute("loginUser");  

            out.print("Hello, "+name+" Welcome to Profile");  
            }  
            else{  
                out.print("Please login first");  
                //response.sendRedirect(request.getContextPath()+"/v1.0.0/authentication/basic/login.jsp");
            }  */
        %>
        <a href="Logout" >Logout</a>
    </body>
</html>
