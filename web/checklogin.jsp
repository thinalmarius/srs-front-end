<%-- 
    Document   : checklogin
    Created on : Aug 5, 2016, 12:24:39 PM
    Author     : Thinal
--%>


<%@page import="logic.Logiclink"%>
<%@page import="logic.Logiclink_Service"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <%
    
        Logiclink_Service service = new Logiclink_Service();
        Logiclink proxy = service.getLogiclinkPort();
        Object username = request.getParameter("txtUsername");
        Object password = request.getParameter("txtpassword");
        
        
        String mesg=proxy.checkUserPsd(username.toString(), password.toString());
        
        
        if(session.getAttribute("userSession") == null){
            if (username == null || password == null) {
                response.sendRedirect("login.jsp");     
           
            } else if ( mesg==null) {
           
                response.sendRedirect("login.jsp?msg=invalid");
            } else {
             session.setAttribute("userSession", username.toString());
             response.sendRedirect("home.jsp");
            }
        } else {
           username = session.getAttribute("userSession");
           response.sendRedirect("home.jsp");
        }
           
%>
</html>
