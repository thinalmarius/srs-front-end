<%-- 
    Document   : logout
    Created on : Aug 7, 2016, 2:46:11 PM
    Author     : Thinal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%
        session.setAttribute("userSession",null);
        if(session.getAttribute("userSession") == null){
            response.sendRedirect("login.jsp");
       } 
        //response.sendRedirect("LoginForm.jsp");
        %>
</html>