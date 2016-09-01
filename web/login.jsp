<%-- 
    Document   : Login
    Created on : Jul 29, 2016, 10:47:35 AM
    Author     : Thinal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javafx.scene.control.Alert"%>
<%
       if(session.getAttribute("userSession") != null){
            response.sendRedirect("home.jsp");
       } 
    %>

<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <meta name="viewprot" content="width=device-width, initial-scale: 1.0, user-scalabe=0" />
        
    </head>
    <body>
        <div id="header">
            <div class="logo"><a href="home.jsp"><span>SRS</span></a></div>
        </div>
        <div id="login">
            <div class="log">
            <h1>Login</h1>
            <form action="LoginServlet" method="post">
            <br>Username : </br>
            <input type="text" name="txtUsername"></input>
            <br>Password : <br>
            <input type="password" name="txtpassword"></input></br>
            <br>
            <div class="log_button">
            <input type="submit"  value="Login"></input></form></div>
            </div>
            <div class="log_error">
            <p>
            <%
            Object msg = request.getParameter("msg");
            if (msg != null && msg.equals("invalid")) {

                out.print("Invalid username or password");
            }
            %>
            </p>
            </div>
        </div>
    </body>
</html>

