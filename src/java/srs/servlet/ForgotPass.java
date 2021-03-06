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
@WebServlet(name = "ForgotPass", urlPatterns = {"/Forgot"})
public class ForgotPass extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        Logiclink_Service service = new Logiclink_Service();
        Logiclink proxy = service.getLogiclinkPort();
        Object name = request.getParameter("username");
        Object email = request.getParameter("email");
        
        int id=proxy.getUserId(name.toString(), email.toString());
         if(id!=0){
            String pass=proxy.getPassword(name.toString());
            proxy.sendPassword(email.toString(), pass);
            request.getRequestDispatcher("login.jsp").include(request, response); 
            out.println("<script type=\"text/javascript\">");
            out.println("alert('You will receive a mail');");
            out.println("location='login.jsp';");
            out.println("</script>"); 
        }else{
            request.getRequestDispatcher("login.jsp").include(request, response); 
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Invalid Username or Email');");
            out.println("location='login.jsp';");
            out.println("</script>"); 
            
        }
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
        processRequest(request, response);
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
