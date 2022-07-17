<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="org_logincheck.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Project</title>
        <link rel="icon" type="image/png" href="assest/images/img-02.png" />
        <!--====================================================================================================================-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <!--====================================================================================================================-->
        <link rel="stylesheet" href="assest/style/style.css">
        <!--====================================================================================================================-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <!--====================================================================================================================-->
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <!--====================================================================================================================-->
        <link href="https://fonts.googleapis.com/css2?family=Baloo+Bhai+2&display=swap" rel="stylesheet">
        <!--====================================================================================================================-->
        <script src="https://kit.fontawesome.com/d72e2bd739.js" crossorigin="anonymous"></script>
        <title>Certificate Generator</title>
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
                            <a class="nav-link" href="org_home.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <!-- <li class="nav-item my-2 my-lg-0">
                          
                        </li> -->
                    </ul>

                    <span>
                        <a href="org_profile.jsp"><button type="button" class="btn btn-outline-warning"><i class='fas fa-user-alt'></i> Organization Profile</button></a>
                    </span>
                    <!-- <form class="form-inline my-2 my-lg-0">
                      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                    </form> -->
                </div>
            </nav>
        </header>
        <!-- Header Ended -->

        <%            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "");

                String pid = request.getParameter("pid");
                Statement stmt = con.createStatement();
                ResultSet res = stmt.executeQuery("Select * from projects where pid = " + pid + ";");

                if (res.first()) {
                    String projectId = res.getString(1);
                    String projectTitle = res.getString(2);
                    String projectDescription = res.getString(3);
                    String preferences = res.getString(4);
                    String statusProject = res.getString(6);
        %>
        <div class="container my-4 mx-auto">
            <div class="bg-white card shadow-lg p-4 p-lg-4">
                <!-- header -->            
                <div class="d-flex justify-content-between">
                    <h1 class="font-monospace"><%= projectTitle%></h1>
                    <div class="float-right d-flex justify-content-center align-items-center">
                        <button type="button" class="btn btn-warning mx-2" data-toggle="modal" data-target="#staticBackdrop" title="Edit Project">
                            <i class="fa fa-pencil"></i>
                        </button>
                        <form action="DeleteProject" method="post">

                            <input type="hidden" name="pid" value="<%= projectId%>">
                            <button class="btn btn-danger" title="Delete Project" type="submit"><i class="fa fa-trash"></i></button>
                        </form>
                    </div>
                </div>
                <hr>
                <!-- body -->
                <div>
                    <h4>Project Description</h4>
                    <p>
                        <%= projectDescription%>
                    </p>
                </div>
                <div>
                    <h4>Preferences</h4>
                    <p class="text-muted">
                        <%= preferences%>
                    </p>
                </div>



                <div>
                    <%
                        Statement stm1 = con.createStatement();
                        ResultSet rm1 = stm1.executeQuery("Select * from solutions where sid = (select sid from projects where pid = " + pid + " and status = 'completed' );");
                        int iscomplete = 0;
                        if (statusProject.equals("completed")) {
                    %>
                    <h4>Completed Solutions:</h4>
                    <%
                        while (rm1.next()) {
                            iscomplete = 1;
                            Statement stm3 = con.createStatement();
                            int userId = rm1.getInt(2);
                            ResultSet rm3 = stm3.executeQuery("Select * from users where id = " + rm1.getInt(2) + ";");
                            if (rm3.next()) {
                    %>
                    <div class="p-2 p-lg-2">
                        <div class="card m-1">
                            <div class="card-body">
                                <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center">
                                    <div>
                                        <h6><%= rm3.getString(2)%> <%= rm3.getString(3)%></h6>
                                        <p class="text-muted"><%= rm3.getString(6)%> <br>Contact at: <%= rm3.getString(4)%></p>
                                    </div>
                                    <div class="d-flex flex-row">
                                        <a href="<%= rm1.getString(4)%>" target="_blank" class="btn btn-primary m-1">View Report</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}
                            }
                        }%>
                </div>





                <div>
                    <%
                        if (iscomplete == 0 && statusProject.equals("under development")) {
                            Statement st2 = con.createStatement();
                            ResultSet r2 = st2.executeQuery("Select * from solutions where sid = (select sid from projects where pid = " + pid + " and status = 'under development' );");


                    %>
                    <h4>Ongoing Solutions:</h4>
                    <%                            while (r2.next()) {
                            Statement st3 = con.createStatement();
                            int userId = r2.getInt(2);
                            ResultSet r3 = st3.executeQuery("Select * from users where id = " + r2.getInt(2) + ";");
                            if (r3.next()) {
                    %>
                    <div class="p-2 p-lg-2">
                        <div class="card m-1">
                            <div class="card-body">
                                <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center">
                                    <div>
                                        <h6><%= r3.getString(2)%> <%= r3.getString(3)%></h6>
                                        <p class="text-muted"><%= r3.getString(6)%> <br>Contact at: <%= r3.getString(4)%></p>
                                    </div>
                                    <div class="d-flex flex-row">
                                        <a href="<%= r2.getString(4)%>" target="_blank" class="btn btn-primary m-1">View Report</a>
                                        <form action="IssueCertificate" method="post">
                                            <input type="hidden" name="pid" value="<%= projectId%>">
                                            <input type="hidden" name="uid" value="<%= userId%>">
                                            <button class="btn btn-success m-1" type="submit">Generate Certificate</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                                }
                            }
                        }%>
                </div>




                <!-- Report Submissions -->
                <div>
                    <%
                        if (!statusProject.equals("completed")) {
                    %>
                    <h4>Proposed Solutions:</h4>
                    <%
                        Statement stmt2 = con.createStatement();
                        ResultSet res2 = stmt2.executeQuery("Select * from solutions where pid = (select pid from projects where pid = " + pid + " and status != 'completed' ) and sid != (select sid from projects where pid = " + pid + ")");
                        while (res2.next()) {
                            String sid = res2.getString(1);
                            Statement stmt3 = con.createStatement();
                            ResultSet res3 = stmt3.executeQuery("Select * from users where id = " + res2.getInt(2) + ";");
                            if (res3.next()) {
                    %>
                    <div class="p-2 p-lg-2">
                        <div class="card m-1">
                            <div class="card-body">
                                <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center">
                                    <div>
                                        <h6><%= res3.getString(2)%> <%= res3.getString(3)%></h6>
                                        <p class="text-muted"><%= res3.getString(6)%> <br>Contact at: <%= res3.getString(4)%></p>
                                    </div>
                                    <div class="d-flex flex-row">
                                        <a href="<%= res2.getString(4)%>" target="_blank" class="btn btn-primary m-1">View Report</a>
                                        <form action="ApproveProject" method="post">
                                            <input type="hidden" name="sid" value="<%= sid%>">
                                            <input type="hidden" name="pid" value="<%= projectId%>">
                                            <%
                                                if (statusProject.equals("posted")) {%>
                                            <button class="btn btn-success m-1" type="submit">Approve</button>
                                            <%}

                                            %>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}
                            }
                        }%>
                </div>

            </div>
        </div>

        <!-- Update Project Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Update Project</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="UpdateProject" method="post">
                        <div class="modal-body">

                            <div class="mb-3">
                                <label for="staticEmail" class="col-form-label">Project Title</label>
                                <input type="text" class="form-control" name="title" value="<%= projectTitle%>">
                            </div>
                            <div class="mb-3">
                                <label for="inputPassword" class="col-form-label">Description</label>
                                <textarea class="form-control" name="description" rows="3"><%= projectDescription%></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="staticEmail" class="col-form-label">
                                    Preferences
                                    <i class="fa-solid fa-circle-info" title="Preferred Technologies and Practices"></i>
                                </label>
                                <input type="text" class="form-control" name="preferences" value="<%= preferences%>">
                            </div>
                            <input type="hidden" name="pid" value="<%= projectId%>">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <input type="submit" value="Update" class="btn btn-primary">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- End of Update Project Modal -->
        <%        }
            } catch (Exception e) {
                out.println(e);
            }
        %>

        <!-- jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
    </body>
</html>