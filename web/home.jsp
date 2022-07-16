<!doctype html>
<%@include file="logincheck.jsp"%>
<%@page import="java.sql.*"%>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
            <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="#">
                    <img src="assest/images/img-02.png" width="30" height="30" class="d-inline-block align-top"
                         alt="">
                    NameofWebsite
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="#carouselExampleCaptions">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#our-team-id">Our Team</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#contact-us-id">Contact Us</a>
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


        <!-- Main Content -->
        <main>
            
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "");
                Statement st = con.createStatement();
                ResultSet rst = st.executeQuery("select * from projects");
                while(rst.next())
                {
                    int pid = rst.getInt(1);
                    String title = rst.getString(2);
                    String description = rst.getString(3);
                    int oid = rst.getInt(5);
                    Statement st2 = con.createStatement();
                    ResultSet rst2 = st2.executeQuery("select * from organizations where id = "+oid+";");
                    if(rst2.first())
                    {
                        String oname = rst2.getString(2);
            %>
            <form action="viewprojectdetails.jsp" method="post">
            <div class="card mx-5 my-3">
                <h5 class="card-header"><%= oname %></h5>
                <div class="card-body">
                    <h5 class="card-title"><%= title %></h5>
                    <p class="card-text"><%= description %></p>
                    <input type="hidden" name="p_id" value="<%= pid %>">
                    <input type="hidden" name="org_id" value="<%= oid %>">
                    <input type="submit" class="btn btn-primary" value="Get Details">
                </div>
                    <div class="card-footer text-muted">
                        2 days ago
                    </div>
            </div>
                    
            </form>
            <%
                    }
                }
            %>
        </main>
        <!-- Main Ended -->



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

        <!-- jQuery and Bootstrap Bundle (includes Popper) -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>

    </body>

</html>