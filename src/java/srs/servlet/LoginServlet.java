/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package srs.servlet;
import logic.Logiclink;
import logic.Logiclink_Service;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thinal
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
        Logiclink_Service service = new Logiclink_Service();
        Logiclink proxy = service.getLogiclinkPort();
        Object username = request.getParameter("txtUsername");
        Object password = request.getParameter("txtpassword");
        
        
        String mesg=proxy.checkUserPsd(username.toString(), password.toString());
        HttpSession session=request.getSession();
        PrintWriter out=response.getWriter(); 
        if(session.getAttribute("userSession") == null){
            if (username.equals(null) || password.equals(null)) {
                //response.sendRedirect("login.jsp"); 
                request.getRequestDispatcher("login.jsp").include(request, response);  
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Please enter valid username and password!');");
                out.println("location='login.jsp';");
                out.println("</script>");
                out.close();
           
            } else if ( mesg==null) {
           
                request.getRequestDispatcher("login.jsp").include(request, response);  
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Invalid Credentials');");
                out.println("location='login.jsp';");
                out.println("</script>");
                out.close();
                //return;
            } else {
             session.setAttribute("userSession", username.toString());
             response.sendRedirect("home.jsp");
             //return;
            }
        } else {
           username = session.getAttribute("userSession");
           response.sendRedirect("home.jsp");
           //return;
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
