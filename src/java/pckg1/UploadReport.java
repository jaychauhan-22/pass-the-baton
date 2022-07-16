package pckg1;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class UploadReport extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int pid = Integer.parseInt(request.getParameter("pid"));
            Part filePart = request.getPart("report");
            
            final PrintWriter writer = response.getWriter();
            InputStream pdfBytes = null;
            try{
                if (!filePart.getContentType().equals("application/pdf")){
                    writer.println("<br/> Invalid File");
                    return;
                }
                else if (filePart.getSize()>1048576 ) { //2mb
                    writer.println("<br/> File size too big");
                    return;
                }
               
                pdfBytes = filePart.getInputStream();
                final byte[] bytes = new byte[pdfBytes.available()];
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/hackathon", "root", "");
                
                PreparedStatement stmt = conn.prepareStatement("INSERT INTO reports (report, pid) VALUES(?,?)");
                stmt.setBytes(1, bytes);
                stmt.setInt(2, pid);
                int res = stmt.executeUpdate();
                
                if(res >= 1){
                    writer.println("Report Uploaded");
//                    response.sendRedirect("org_home.jsp");
                }
                else{
                    writer.println("Error: Couldn't upload the file");
                }
                    
            } catch(Exception e){
                System.out.println(e);
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
