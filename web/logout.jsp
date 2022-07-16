<%-- 
    Document   : logout
    Created on : 13 Jul, 2022, 5:40:32 PM
    Author     : BADAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
