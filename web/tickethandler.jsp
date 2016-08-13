<%-- 
    Document   : tickethandler
    Created on : Aug 10, 2016, 10:20:21 PM
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
        
        Object name = request.getParameter("name");
        Object email = request.getParameter("email");
        Object company = request.getParameter("company");
        Object message = request.getParameter("area");
        
        int id=proxy.getCusId(name.toString(), company.toString());
        
        if(id!=0){
            proxy.getMessage(id, message.toString());
            response.sendRedirect("newticket.jsp");
        }else{
            response.sendRedirect("newticket.jsp?msg=error");
        }       
        
        
        
        

        %>
    
</html>
