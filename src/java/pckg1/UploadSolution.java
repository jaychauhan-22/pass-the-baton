package pckg1;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class UploadSolution extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "");
                HttpSession session = request.getSession();
                int uid = Integer.parseInt(session.getAttribute("uid").toString());
                int pid = Integer.parseInt(request.getParameter("pid").toString());
                String url = request.getParameter("url");
                PreparedStatement stmt = conn.prepareStatement("insert into solutions(uid,pid,link) values (?,?,?)");
                stmt.setInt(1,uid);
                stmt.setInt(2, pid);
                stmt.setString(3, url);
                int result = stmt.executeUpdate();
                if(result == 1)
                {
                    session.setAttribute("urlsent", "1");
                    response.sendRedirect("home.jsp");
                }
                else
                {
                    session.setAttribute("urlsent", "2");
                    response.sendRedirect("home.jsp");
                }
                response.sendRedirect("viewproject.jsp?pid="+pid+"");
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
