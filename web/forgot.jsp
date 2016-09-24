<%-- 
    Document   : forgot
    Created on : Sep 15, 2016, 4:01:35 PM
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
        <title>Reset Password</title>
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <meta name="viewprot" content="width=device-width, initial-scale: 1.0, user-scalabe=0" />
        
    </head>
    <body>
        <div id="header">
            <div class="logo"><a href="home.jsp"><span>SRS</span></a></div>
        </div>
        <div id="forgot">
            <div id="fog">
                <h1>Please enter Username and Email</h1><br>
            <form action="Forgot" method="post">
            
            <input type="text" name="username" placeholder="Username.."></input>
            
            <input type="text" name="email" placeholder="Email.."></input></div>
            
            
            <input type="submit" class="btn" value="Reset"></input></form><br>
            
                       
        </div>
    </body>
</html>

