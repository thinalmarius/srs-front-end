<%-- 
    Document   : viewcustomers
    Created on : Sep 11, 2016, 8:53:32 PM
    Author     : Thinal
--%>

<%@page import="logic.Customers"%>
<%@page import="java.util.ArrayList"%>
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
                <h1>View Customers</h1>
                
                <div class="select">
                    <li><a href="newcustomer.jsp">Register Customer</a></li>
                    <li><a class="selected" href="viewcustomers.jsp">View Customers</a></li>        
                </div>
                <br>
                <div class="view_customers">
                    <%
                            
                            
                            Logiclink_Service service = new Logiclink_Service();
                            Logiclink proxy = service.getLogiclinkPort();
                            ArrayList<Customers> customer = new ArrayList<Customers>();
                            customer =(ArrayList<Customers>) proxy.viewCustomers();
                                                        
                            
                            out.print("<table>");
                            out.print("<tr><th>Name</th><th>Email</th><th>Company</th></tr>");
                            
                            for (Customers c : customer){
                                out.print("<tr><td>"
                                +c.getName()
                                +"</td><td>"
                                +c.getEmail()
                                +"</td><td>"
                                +c.getCompany()
                                +"</td><td>"
                                +"<a href="+"deleteCus?id="+c.getId()+">Delete</a></td></tr>");
                            }
                
                            out.print("</table>");
                                %>
                </div>
                
                
            </div>
        </div>
        
        
    </body>
</html>