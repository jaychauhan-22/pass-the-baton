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
public class UpdateProfile extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try{
                HttpSession s = request.getSession();
                String uid = (String)s.getAttribute("uid");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "");
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String btn_type = request.getParameter("submitbutton");
                out.println(btn_type);
                String clg = request.getParameter("clg");
                int pass_year = Integer.parseInt(request.getParameter("pass_year"));
                if(btn_type.equals("update"))
                {
                    PreparedStatement pst = con.prepareStatement("update users set firstname = ?, lastname = ?, email = ?, password = ?, college = ?, passing_year = ? where id = ?");
                    pst.setString(1, fname);
                    pst.setString(2, lname);
                    pst.setString(3, email);
                    pst.setString(4, password);
                    pst.setString(5, clg);
                    pst.setInt(6, pass_year);
                    pst.setString(7, uid);
                    int result = pst.executeUpdate();
                    if(result==1)
                        response.sendRedirect("userprofile.jsp");
                    else
                        out.println("<script>alert('Error Occurred.. Please Try Again')</script>");
                }
                else if(btn_type.equals("delete"))
                {
                    PreparedStatement pst = con.prepareStatement("delete from users where id = ?");
                    pst.setString(1, uid);
                    int result = pst.executeUpdate();
                    if(result==1)
                        response.sendRedirect("logout.jsp");
                    else
                        out.println("<script>alert('Error Occurred.. Please Try Again')</script>");
                }
            }
            catch(Exception e)
            {
                out.println("Exception Occurred: "+e);
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
