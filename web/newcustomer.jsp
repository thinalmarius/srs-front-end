<%-- 
    Document   : newcustomer
    Created on : Aug 19, 2016, 10:06:16 PM
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
                <h1>New Customer</h1>
                
                <div class="select">
                    <li><a class="selected" href="newcustomer.jsp">Register Customer</a></li>
                    <li><a href="viewcustomers.jsp">View Customers</a></li>        
                </div>
                <br>
                
                <div class="reg">
                    <p><strong>Insert Details</strong></p><br>
                    <form action="RegCustomer" method="post">
                    <div class="row"><label>Name:</label><input type="text" name="name" required="true" placeholder="Name" maxlength="32"><br><br></div>
                    <div class="row"><label>Email:</label><input type="text" name="email" required="true" placeholder="Email" maxlength="50"><br><br></div>
                    <div class="row"><label>Company:</label><input type="text" name="company" required="true" placeholder="Company"><br><br></div>
                    <div class="save_button"><input type="submit" value="Save"></input></div>
                </form>
                    
                <p></p>
                
                
            </div>
        </div>
        
        
    </body>
</html>