/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package srs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logic.Logiclink;
import logic.Logiclink_Service;

/**
 *
 * @author Thinal
 */
@WebServlet(name = "TicketHandler", urlPatterns = {"/TicketHandler"})
public class TicketHandler extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        PrintWriter out=response.getWriter();
        Logiclink_Service service = new Logiclink_Service();
        Logiclink proxy = service.getLogiclinkPort();
        Object name = request.getParameter("name");
        Object email = request.getParameter("email");
        Object company = request.getParameter("company");
        Object message = request.getParameter("area");
        
        int id=proxy.getCusId(name.toString(), company.toString());
        
        if(id!=0){
            proxy.getMessage(id, message.toString());
            request.getRequestDispatcher("newticket.jsp").include(request, response); 
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Successfully added');");
            out.println("location='newticket.jsp';");
            out.println("</script>"); 
        }else{
            request.getRequestDispatcher("newticket.jsp").include(request, response); 
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Customer information does not exists');");
            out.println("location='newticket.jsp';");
            out.println("</script>"); 
            
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
