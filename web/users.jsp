<%-- 
    Document   : users
    Created on : Aug 8, 2016, 3:02:10 PM
    Author     : Thinal
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="logic.Logiclink"%> 
<%@page import="logic.Logiclink_Service"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if(session.getAttribute("userSession") == null){
            response.sendRedirect("login.jsp");
            return;
       } %>

<html>
    <head>
        
        <title>Manage Users</title>
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <meta name="viewprot" content="width=device-width, initial-scale: 1.0, user-scalabe=0" />
    </head>
    <div id="header">
        <a class="logout" href="Logout"><span>Logout</span></a>
            <div class="logo"><a href="home.jsp">SRS</a></div>
        </div>
        <a class="moblie">MENU</a>
        <div id="container">
            
            <div class="sidebar">
                <ul id="nav">
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="customers.jsp">Customers</a></li>
                    <li><a href="tickets.jsp">Tickets</a></li>                 
                    <li><a class="selected" href="users.jsp">Users</a></li>
                </ul>
            </div>
            <div class="content">
                <h1>Manage Users</h1>
                <div class="select">
                    <li><a href="new_user.jsp">Register User</a></li>
                    <li><a href="view_users.jsp">View Users</a></li>        
                </div>
                <p></p>
                
            </div>
        </div>
        
        
    </body>
</html>