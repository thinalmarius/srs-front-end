<%-- 
    Document   : viewtickets
    Created on : Aug 11, 2016, 8:40:41 PM
    Author     : Thinal
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="logic.Tickets"%>
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
        
        <title>View Ticket</title>
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
                    <li><a class="selected" href="tickets.jsp">Manage Tickets</a></li>                 
                    <% 
                        String user = (String)session.getAttribute("userSession");
                        if(user.equals("admin")){
                            out.print("<li><a href="+"users.jsp"+">Manage Users</a></li>");
                        }
                        %>
                </ul>
            </div>
            <div class="content">
                <h1>View Tickets</h1>
                
                <div class="select">
                    <li><a href="newticket.jsp">New Ticket</a></li>
                    <li><a class="selected" href="viewtickets.jsp">View Tickets</a></li>        
                </div>
                <br>
                
               <div class="view_ticket">
                        <%
                            
                            ArrayList<Tickets> ticket = new ArrayList<Tickets>();
                            Logiclink_Service service = new Logiclink_Service();
                            Logiclink proxy = service.getLogiclinkPort();
                            ticket=(ArrayList<Tickets>)proxy.viewTickets();
                            
                            //out.print("<br>");
                            out.print("<table>");
                            out.print("<tr><th>Name</th><th>Email</th><th>Problem</th><th>Severity</th><th>Date</th></tr>");
                            
                            for (Tickets t : ticket){
                                out.print("<tr><td>"
                                +t.getName()
                                +"</td><td>"
                                +t.getEmail()
                                +"</td><td>"
                                +t.getProb()
                                +"</td><td>"
                                +t.getSeverity()
                                +"</td><td>"
                                +t.getDate()
                                +"</td></tr>");
                            }
                
                            out.print("</table>");
                                %>
                </div>
                
                
            </div>
        </div>
        
        
    </body>
</html>