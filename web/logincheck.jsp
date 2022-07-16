
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String s = (String)session.getAttribute("uid");
            out.println(s);
            if(s == null)
                response.sendRedirect("index.jsp");
            
        %>
    </body>
</html>
