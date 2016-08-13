<%-- 
    Document   : newticket
    Created on : Aug 10, 2016, 4:02:44 PM
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
        
        <title>New Ticket</title>
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
                <h1>New Ticket</h1>
                
                <div class="select">
                    <li><a class="selected" href="newticket.jsp">New Ticket</a></li>
                    <li><a href="viewtickets.jsp">View Tickets</a></li>        
                </div>
                <br>
                
                <div class="reg">
                    <p><strong>Insert Details</strong></p><br>
                    <form action="tickethandler.jsp" method="post" onsubmit="save()">
                    <div class="row"><label>Name:</label><input type="text" name="name" required="true" placeholder="Name" maxlength="32"><br><br></div>
                    <div class="row"><label>Email:</label><input type="text" name="email" required="true" placeholder="Email" maxlength="50"><br><br></div>
                    <div class="row"><label>Company:</label><input type="text" name="company" required="true" placeholder="Company"><br><br></div>
                    <div class="row"><label>Problem Area:</label><textarea name="area" required="true" placeholder="Problem Area"></textarea><br><br></div>
                    <div class="ticket_save_button"><input type="submit" value="Save"></input></div>
                </form>
                    <%
                    Object msg = request.getParameter("msg");
                    if (msg != null && msg.equals("error")) {

                        out.print("Customer information does not exists.");
                    }
                %>
                </div>
                
                
            </div>
        </div>
        
        
    </body>
</html>