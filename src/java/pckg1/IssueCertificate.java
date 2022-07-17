
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

public class IssueCertificate extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "");
                
                HttpSession session = request.getSession();
//                int org_id = Integer.parseInt((String)session.getAttribute("oid"));
                int org_id=1;
                int pid = Integer.parseInt(request.getParameter("pid"));
                int uid = Integer.parseInt(request.getParameter("uid"));
                out.println(org_id);
                out.println(uid);
                out.println(pid);
                
                
                PreparedStatement stmt = conn.prepareStatement("insert into certificates(userid,organizationid,projectid) values(?,?,?)");
                stmt.setInt(1, uid);
                stmt.setInt(2, org_id);
                stmt.setInt(3, pid);
                PreparedStatement stmt2 = conn.prepareStatement("update projects set status = 'completed' where pid = ?");
                stmt2.setInt(1, pid);
                int result = stmt.executeUpdate();
                int result2 = stmt2.executeUpdate();
                if(result == 1 && result2==1)
                    out.println("Project Updated");
                else
                    out.println("Error: Project can't be updated");
                
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
