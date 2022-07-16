<!doctype html>
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
        <link rel="stylesheet" type="text/css" href="assest/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--====================================================================================================================-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <!--====================================================================================================================-->
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <!--====================================================================================================================-->
        <link href="https://fonts.googleapis.com/css2?family=Baloo+Bhai+2&display=swap" rel="stylesheet">
        <!--====================================================================================================================-->

        <title>Hackathon Project</title>
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
                        <div class="dropdown">
                            <button class="btn btn-outline-warning dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Login / Signup
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="org_login.jsp">Organization</a>
                                <a class="dropdown-item" href="login.jsp">User</a>
                            </div>
                        </div>
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
            <!-- Slider Started -->
            <div class="slider">
                <div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                        <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="assest/img/Artboard-01.png" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>First slide label</h5>
                                <p>Some representative placeholder content for the first slide.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="assest/img/Artboard-02.png" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Second slide label</h5>
                                <p>Some representative placeholder content for the second slide.</p>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="assest/img/Artboard-02.png" class="d-block w-100" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                                <h5>Third slide label</h5>
                                <p>Some representative placeholder content for the third slide.</p>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </button>
                </div>
            </div>
            <!-- Slider Ended -->

            <!-- Our team Started  -->
            <div class="our-team" id="our-team-id">
                <div class="title">
                    <label for="ourTeamSection">Our Team</label>
                </div>
                <div class="d-flex justify-content-center row mx-4">
                    <div class="card bg-dark col-lg-3 col-md-6 m-lg-4 my-4">
                        <img class="card-img-top" src="assest/img/developer.png" class="img-fluid" alt="Card image">
                        <div class="card-body text-center">
                            <h5 class="card-title">Pankil Doshi</h5>
                            <a href="https://www.linkedin.com/in/pankil-doshi-1705561a1" target="_blank" class="btn btn-link" style="font-size: 3vh"><i class="fa fa-linkedin-square"></i>  LinkedIn</a>
                        </div>
                    </div>
                    <div class="card bg-dark col-lg-3 col-md-6 m-lg-4 my-4">
                        <img class="card-img-top" src="assest/img/developer.png" class="img-fluid" alt="Card image">
                        <div class="card-body text-center">
                            <h5 class="card-title">Jay Chauhan</h5>
                            <a href="https://www.linkedin.com/in/jay-chauhan-b83b2620b" target="_blank" class="btn btn-link"style="font-size: 3vh"><i class="fa fa-linkedin-square"></i>  LinkedIn</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Out team Ended -->

            <!-- ContactUs Form Started -->
            <div class="container-fluid contact-us pb-5" id="contact-us-id">
                <div class="title">
                    <label for="ContactUsSection">Contact Us</label>
                </div>
                <form class="contact-form" action="contactus" method="post">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputname4">Name</label>
                            <input type="name" class="form-control" id="inputname4" placeholder="Name" name="name" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputEmail4">Email</label>
                            <input type="email" class="form-control" id="inputEmail4" placeholder="Email" name="email" required>
                        </div>
                        <div class="form-group col-md-12">
                            <label for="inputquery">Query</label>
                            <textarea class="form-control" placeholder="Enter your text" required name="description"></textarea>
                        </div>
                    </div>
                    <% if (session.getAttribute("responsesend") != null && session.getAttribute("responsend") != (" ")) {
                    %>
                    <div class="alert alert-success" role="alert">
                        Response Send Successfully..
                    </div>><%
                        }
                    %>
                    <button type="submit" class="px-4 btn btn-primary my-3">Submit response</button>

                </form>

            </div>
            <!-- ContactUs Form Ended -->

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