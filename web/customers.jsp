<%-- 
    Document   : customers
    Created on : Aug 19, 2016, 9:54:31 PM
    Author     : Thinal
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="logic.Logiclink"%> 
<%@page import="logic.Logiclink_Service"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if(session.getAttribute("userSession")==null){
            response.sendRedirect("login.jsp");
            return;
       } %>

<html>
    <head>
        
        <title>Manage Customers</title>
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
                    <li><a class="selected" href="customers.jsp">Customers</a></li>
                    <li><a href="tickets.jsp">Tickets</a></li>                 
                    <% 
                        String user = (String)session.getAttribute("userSession");
                        if(user.equals("admin")){
                            out.print("<li><a href="+"users.jsp"+">Users</a></li>");
                        }
                        %>
                </ul>
            </div>
            <div class="content">
                <h1>Manage Customers</h1>
                
                <div class="select">
                    <li><a href="newcustomer.jsp">Register Customer</a></li>
                    <li><a href="viewcustomers.jsp">View Customers</a></li>        
                </div>
                <p></p>
                
                
            </div>
        </div>
        
        
    </body>
</html>