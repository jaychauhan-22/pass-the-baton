<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%@page import="java.time.*"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <!--====================================================================================================================-->
  <link rel="icon" type="image/png" href="assest/images/img-02.png" />
  <!--===============================================================================================-->
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <!--<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&display=swap" rel="stylesheet">-->
        <title>Certificate Generator</title>
        <style>
            * {
                font-family: 'Great Vibes', cursive;
            }
        </style>
    </head>
    <body>
        <script src="https://unpkg.com/pdf-lib/dist/pdf-lib.min.js"></script>
        <script src="https://unpkg.com/@pdf-lib/fontkit@0.0.4"></script>
        <script src="assest/js/generatecertificate.js"></script>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "");
                int cid = Integer.parseInt(request.getParameter("cid"));
                Statement st = con.createStatement();
                ResultSet rst = st.executeQuery("select * from certificates where id = "+cid+";");
                if(rst.first())
                {
                    Statement st2 = con.createStatement();
                    ResultSet rst2 = st2.executeQuery("select * from users where id = "+rst.getInt(2)+";");
                    String name="",orname="",pname="";
                    if(rst2.first())
                    {
                        name = rst2.getString(2)+" "+rst2.getString(3);
                    }
//                    
                    Statement st3 = con.createStatement();
                    ResultSet rst3 = st3.executeQuery("select * from organizations where id = "+rst.getInt(3)+";");
                    if(rst3.first())
                    {
                    orname = rst3.getString(2);
                    }
//                    
                    Statement st4 = con.createStatement();
                    ResultSet rst4 = st4.executeQuery("select * from projects where pid = "+rst.getInt(4)+";");
                    if(rst4.first())
                    {
                    pname = rst4.getString(2);
                    }
                    Timestamp s =  rst.getTimestamp(5);
                    Date dated = new Date(s.getTime());
                    %>
                    <input type="hidden" id="username" value="<%=name%>">
                    <input type="hidden" id="project" value="<%=pname%>">
                    <input type="hidden" id="organization" value="<%=orname%>">
                    <input type="hidden" id="certificate" value="<%=cid%>">
                    <input type="hidden" id="date" value="<%=dated%>">
                    <%
                }
            }
            catch(Exception e)
            {
                out.println("Exception Occurred: "+ e);
            }
        %>
        <script>
            const name = document.getElementById("username").value;
            const project = document.getElementById("project").value;
            const organization = document.getElementById("organization").value;
            const certificate = document.getElementById("certificate").value;
            const dated = document.getElementById("date").value;
            generateName(name,project,organization,certificate,dated);
//            generateName(name);
//            generateName(name);
//            generateName(name);
            </script>
    </body>

</html>
