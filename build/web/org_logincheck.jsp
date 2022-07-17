
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="assest/images/img-02.png" />
    </head>
    <body>
        <%
            String s = (String)session.getAttribute("oid");
            if(s == null)
                response.sendRedirect("index.jsp");
            
        %>
    </body>
</html>
