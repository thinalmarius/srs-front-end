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
    <body class='login_form'>
        <div id="header">
            <div class="logo"><a href="home.jsp"><span>SRS</span></a></div>
        </div>
        <div id="login">
            <div id="log">
            <h1>Login</h1>
            <form action="LoginServlet" method="post">
            
            <input type="text" name="txtUsername" placeholder="Username.."></input>
            
            <input type="password" name="txtpassword" placeholder="Password.."></input></div>
            
            
                <input type="submit" class="btn" value="Login"></input></form><br>
            
            <a class="forgot_link" href="#">Forgot Password?</a>
            
        </div>
    </body>
</html>

