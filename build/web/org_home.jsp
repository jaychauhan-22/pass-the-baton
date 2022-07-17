<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*" %>
<%@include file="footer.jsp"%>
<%@include file="org_logincheck.jsp"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Organization Home</title>
        <!-- Bootstrap CSS -->
        <!--====================================================================================================================-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
              integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
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
        <script src="https://kit.fontawesome.com/d72e2bd739.js" crossorigin="anonymous"></script>
        <title>Home Page</title>
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
                            <a class="nav-link" href="org_home.jsp">Home</a>
                        </li>
                        <!-- <li class="nav-item my-2 my-lg-0">
                          
                        </li> -->
                    </ul>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-warning mx-2" data-toggle="modal" data-target="#staticBackdrop">
                        <i class="fa fa-plus"></i> Post Project
                    </button>
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

        <div class="container">
            <!-- Ongoing Projects -->
            <div class="mt-2">
                <h1>Ongoing Projects</h1>
                <div class="project-cards d-flex flex-column flex-md-row overflow-auto">
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "");

                            int oid = Integer.parseInt(session.getAttribute("oid").toString());
                            Statement stmt = con.createStatement();
                            ResultSet res = stmt.executeQuery("Select * from projects where oid = " + oid + " and not status= 'completed';");

                            while (res.next()) {
                                String projectId = res.getString(1);
                                String projectTitle = res.getString(2);
                                String projectDescription = res.getString(3);
                                Timestamp datetime = res.getTimestamp(7);
                                Date dated = new Date(datetime.getTime());
                                
                    %>
                    <div class="card m-2" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title"><%= projectTitle%></h5>
                            <h6 class="card-subtitle mb-2 text-muted">Issued on: <%= dated%> </h6>
                            <p class="card-text">
                                <%= projectDescription.substring(0,(projectDescription.length() > 90 ? 90 : projectDescription.length())) %>
                            </p>
                        </div>

                        <div class="card-footer text-muted">
                            <a href="viewproject.jsp?pid=<%= projectId%>" class="card-link">View Project</a>
                        </div>
                    </div>    
                    <%        }
                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>				
                </div>
            </div>
            <!-- End of Ongoing Projects -->
            <!-- Past Projects -->
            <div class="mt-2">
                <h1>Past Projects</h1>
                <div class="project-cards d-flex flex-column flex-md-row overflow-auto">
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "");

                            int oid = Integer.parseInt(session.getAttribute("oid").toString());
                            Statement stmt = con.createStatement();
                            ResultSet res = stmt.executeQuery("Select * from projects where oid = " + oid + " and status= 'completed';");

                            while (res.next()) {
                                String projectId = res.getString(1);
                                String projectTitle = res.getString(2);
                                String projectDescription = res.getString(3);
                                Timestamp datetime = res.getTimestamp(7);
                                Date dated = new Date(datetime.getTime());
                                
                    %>
                    <div class="card m-2" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title"><%= projectTitle%></h5>
                            <h6 class="card-subtitle mb-2 text-muted">Issued on: <%= dated%> </h6>
                            <p class="card-text">
                                <%= projectDescription.substring(0,(projectDescription.length() > 90 ? 90 : projectDescription.length())) %>
                            </p>
                        </div>

                        <div class="card-footer text-muted">
                            <a href="viewproject.jsp?pid=<%= projectId%>" class="card-link">View Project</a>
                        </div>
                    </div>    
                    <%        }
                        } catch (Exception e) {
                            out.println(e);
                        }
                    %>				
                </div>
            </div>
            <!-- End of Past Projects -->
        </div>

        <!-- Post Project Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="PostProject" method="post">
                        <div class="modal-body">

                            <div class="mb-3">
                                <label for="staticEmail" class="col-form-label">Project Title</label>
                                <input type="text" class="form-control" name="title">
                            </div>
                            <div class="mb-3">
                                <label for="inputPassword" class="col-form-label">Description</label>
                                <textarea class="form-control" name="description" rows="5"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="staticEmail" class="col-form-label">
                                    Preferences
                                    <i class="fa fa-info-circle" title="Preferences"></i>
                                </label>
                                <input type="text" class="form-control" name="preferences">
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <input type="submit" value="Post" class="btn btn-primary">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- End of Post Project Modal -->
        <!-- jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
    </body>
</html>
