<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*" %>
<%@include file="logincheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Project</title>

        <!-- Bootstrap CDN -->
        <!--====================================================================================================================-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <!--====================================================================================================================-->
        <!--====================================================================================================================-->
        <link rel="icon" type="image/png" href="assest/images/img-02.png" />
        <!--===============================================================================================-->
        <link rel="stylesheet" href="assest/style/style.css">
        <!--====================================================================================================================-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <!--====================================================================================================================-->
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <!--====================================================================================================================-->
        <link href="https://fonts.googleapis.com/css2?family=Baloo+Bhai+2&display=swap" rel="stylesheet">
        <!--====================================================================================================================-->
    </head>
    <body>
        <!-- Header Started -->
        <header>
            <nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="#">
                    <img src="assest/images/img-02.png" width="30" height="30" class="d-inline-block align-top"
                         alt="">
                    PASS-THE-BATON
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <!-- <li class="nav-item my-2 my-lg-0">
                          
                        </li> -->
                    </ul>

                    <span>
                        <a href="userprofile.jsp"><button type="button" class="btn btn-outline-warning"><i class='fas fa-user-alt'></i> User Profile</button></a>
                    </span>
                    <!-- <form class="form-inline my-2 my-lg-0">
                      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form> -->
                </div>
            </nav>
        </header>
        <!-- Header Ended -->

        <!--Main Started-->
        <%            String fname, lname, email, password, college;
            int passing_year;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "");
                String pid = request.getParameter("p_id");
                String orgid = request.getParameter("org_id");
                Statement st = con.createStatement();
                ResultSet rst = st.executeQuery("select * from projects where pid = " + pid + " and oid = " + orgid + ";");
                Statement st2 = con.createStatement();
                ResultSet rst2 = st2.executeQuery("select * from organizations where id = " + orgid + ";");
                if (rst.first() && rst2.first()) {
                    String title = rst.getString(2);
                    String description = rst.getString(3);
                    String preference = rst.getString(4);
                    int uid = Integer.parseInt((String) session.getAttribute("uid"));
                    String orgname = rst2.getString(2);
                    String orgemail = rst2.getString(3);
                    String orgdesc = rst2.getString(4);
        %>

        <div class="container my-4 mx-auto">
            <div class="row">
                <div class="bg-white col-md-8 card shadow-lg p-4 p-lg-4">
                    <!-- header -->
                    <div class="d-flex justify-content-between">
                        <h1><%= title%></h1>
                    </div>
                    <hr>
                    <!-- body -->
                    <div>
                        <h4>Project Description</h4>
                        <p><%= description%></p>
                    </div>
                    <div>
                        <h4>Preferences</h4>
                        <p class="text-muted"><%= preference%></p>
                    </div>
                    <hr>
                    <!-- Organization Details -->
                    <div>
                        <h3 class="font-monospace"><%= orgname%></h3>
                        <h6>About us</h6>
                        <p><%= orgdesc%></p>
                    </div>
                    <!-- Submit report -->
                    <%
                        Statement st_tem = con.createStatement();
                        ResultSet r_tem = st_tem.executeQuery("select * from solutions where pid = " + pid + " and uid = " + uid + ";");
                        if (r_tem.next()) {
                    %>
                    <div>
                        <div class="flex-column flex-md-row justify-content-between align-items-center my-2">
                            <div>
                                <div class="alert alert-success" role="alert">
                                    Your Response Successfully Submitted.
                                </div>
                            </div>
                        </div>
                    </div>
                    <%} else {%>

                    <div>
                        <div class="flex-column flex-md-row justify-content-between align-items-center my-2">
                            <div>
                                <h5 class="">Submit Your Project Details</h5>
                            </div>
                            <form action="UploadSolution" class="col-lg-6" method="post">
                                <div class="row">
                                    <input type="hidden" value="<%= pid%>" name="pid" >
                                    <div class="form-group d-flex">
                                        <input type="url" name="url" class="form-control" id="exampleInputEmail1" placeholder="Enter Drive Folder URL">
                                        <input type="hidden" name="pid" value="<%= pid%>">
                                        <button type="submit" class="btn btn-primary mx-1">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <%}

                    %>
                    <div class="mt-2">
                        <h6>How To Submit ?</h6>
                        <ul>

                            <li>Prepare a detailed report of your solution and include necessary contact details.</li>
                            <li>Create a drive folder with your email.</li>
                            <li>Make sure, your created drive folder visibility must be public.</li>
                            <li>Submit public URL of your drive folder.</li>

                        </ul>
                    </div>
                </div>

                <div class="col-md-4" >
                    <div class="p-3 py-5">
                        <div class="d-flex justify-content-between align-items-center experience h2"><span>Recent Projects: </span></div>
                        <div class="col-md-12"><label class="labels" style="font-size: 13pt;">Other Projects by the Organization:</label></div>
                        <%                            Statement stmt3 = con.createStatement();
                            ResultSet rst3 = stmt3.executeQuery("select * from projects where oid = " + orgid + ";");
                            while (rst3.next()) {
                        %>
                        <form action="viewprojectdetails.jsp" method="post">
                            <input type="hidden" name="p_id" value="<%= rst3.getInt(1)%>">
                            <input type="hidden" name="org_id" value="<%= rst3.getInt(5)%>">
                            <input type="submit" class="btn btn-link mx-2" value="<%= rst3.getString(2)%>">
                        </form>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
        <%
                }
            } catch (Exception e) {
                out.println("Exception Occurred: " + e);
            }

        %>


        <!--Main Ended-->
        <!-- Footer -->
        <footer>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="center">
                    <ul>
                        <li>Copyright &#169; Titlename</li>
                        <li>Hello</li>
                        <li></li>
                    </ul>
                </div>
            </nav>
        </footer>
        <!-- Footer Ended -->
        <!-- Bootstrap Javascript -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
    </body>
</html>