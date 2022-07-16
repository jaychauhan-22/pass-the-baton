package pckg1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class validate extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "");

                String email = request.getParameter("email");
                String pass = request.getParameter("pass");
                Statement st = con.createStatement();
                ResultSet rst = st.executeQuery("select * from users where email = '"+email+"' and password = '"+pass+"'");
                rst.last();
                if(rst.getRow()==1)
                {
                    if(rst.first())
                    {
                        String id = (String.valueOf(rst.getInt(1)));
                        HttpSession s = request.getSession();
                        s.setAttribute("uid", id);
                        response.sendRedirect("home.jsp");
                    }
                }
                else
                {
                    out.println("<script>alert('Incorrect Email or Password')</script>");
                    HttpSession s = request.getSession();
                    s.setAttribute("loginfailed", 1);
                    response.sendRedirect("login.jsp");
                }

            } catch (Exception e) {
                out.println("Exception Occurred " + e);
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
