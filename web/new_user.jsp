<%-- 
    Document   : new_user
    Created on : Sep 11, 2016, 7:35:27 PM
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
                <h1>Register User</h1>
                <div class="select">
                    <li><a class="selected" href="new_user.jsp">Register User</a></li>
                    <li><a href="view_users.jsp">View Users</a></li>        
                </div>
                <br>
                
                <div class="reg">
                    <p><strong>Insert Details</strong></p><br>
                    <form name="user" action="UserHandler" method="post" onsubmit="return validateForm();">
                        <div class="row"><label>Name:</label><input type="text" name="name" required="true" placeholder="Name" maxlength="50"><br><br></div>
                    <div class="row"><label>Username:</label><input type="text" name="username" required="true" placeholder="Username" maxlength="32"><br><br></div>
                    <div class="row"><label>Password:</label><input type="password" name="password" required="true" placeholder="Password" maxlength="50"><br><br></div>
                    <div class="row"><label>Email:</label><input type="text" name="email" required="true" placeholder="Email" maxlength="50"><br><br></div>
                    <div class="save_button"><input type="submit" value="Save"></input></div>
                </form>
                <script>
                function validateForm() {
                    var x = document.forms["user"]["email"].value;
                    var atpos = x.indexOf("@");
                    var dotpos = x.lastIndexOf(".");
                    if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length) {
                        alert("Invalid e-mail address");
                        return false;
                    }
                }
                </script>     
                </div>
                
            </div>
        </div>
        
        
    </body>
</html>