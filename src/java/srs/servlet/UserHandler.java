/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package srs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logic.Logiclink;
import logic.Logiclink_Service;
import logic.Users;

/**
 *
 * @author Thinal
 */
@WebServlet(name = "UserHandler", urlPatterns = {"/UserHandler"})
public class UserHandler extends HttpServlet {

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
        PrintWriter out=response.getWriter();
        Logiclink_Service service = new Logiclink_Service();
        Logiclink proxy = service.getLogiclinkPort();
        Object name = request.getParameter("name");
        Object username = request.getParameter("username").toLowerCase();
        Object email = request.getParameter("email");
        Object password = request.getParameter("password");
        List<Users> user = proxy.viewUsers();
        String userName=null, emailId=null;
        for(Users users : user){
            userName=users.getUsername();
            emailId=users.getEmail();
            if(userName.equals(username)||emailId.equals(email)){
                break;
            }
            
        }
        if(userName.equals(username)||emailId.equals(email)){
            request.getRequestDispatcher("new_user.jsp").include(request, response); 
            out.println("<script type=\"text/javascript\">");
            out.println("alert('User already registered');");
            out.println("location='new_user.jsp';");
            out.println("</script>"); 
            out.close();
        }else{
            proxy.addUser(name.toString(), username.toString(), email.toString(), password.toString());
            request.getRequestDispatcher("new_user.jsp").include(request, response); 
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Registration Successful');");
            out.println("location='new_user.jsp';");
            out.println("</script>"); 
            out.close();
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
