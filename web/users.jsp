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
       } %>

<html>
    <head>
        
        <title>Manage Users</title>
        <link rel="stylesheet" type="text/css" href="styles.css" />
        <meta name="viewprot" content="width=device-width, initial-scale: 1.0, user-scalabe=0" />
    </head>
    <div id="header">
        <a class="logout" href="logout.jsp"><span>Logout</span></a>
            <div class="logo"><a href="home.jsp">SRS</a></div>
        </div>
        <a class="moblie">MENU</a>
        <div id="container">
            
            <div class="sidebar">
                <ul id="nav">
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="customers.jsp">Customers</a></li>
                    <li><a href="tickets.jsp">Manage Tickets</a></li>                 
                    <li><a class="selected" href="users.jsp">Manage Users</a></li>
                </ul>
            </div>
            <div class="content">
                <h1>Manage Users</h1>
                <p></p>
                <div id="box">
                    <div class="box-top">Welcome <%out.print(session.getAttribute("userSession"));%></div>
                    <div class="box-panel"><a><%DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                                        Calendar cal = Calendar.getInstance();
                                        out.print(dateFormat.format(cal.getTime())); //2014/08/06 16:00:22%></a></div>
                </div>
            </div>
        </div>
        
        
    </body>
</html>