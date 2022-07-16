package pckg1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PostProject extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "");
                
                HttpSession session = request.getSession();
                int oid = Integer.parseInt(session.getAttribute("oid").toString());
                
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                String preferences = request.getParameter("preferences");
                
                PreparedStatement stmt = conn.prepareStatement("insert into projects (title, description, preferences, oid) values(?, ?, ?, ?)");
                stmt.setString(1, title);
                stmt.setString(2, description);
                stmt.setString(3, preferences);
                stmt.setInt(4, oid);
                
                int result = stmt.executeUpdate();
                if(result == 1)
                    out.println("Project Posted");
                else
                    out.println("Error: Project can't be posted");
                
                response.sendRedirect("org_home.jsp");
            } catch(Exception e){
                out.println(e);
            }            
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
