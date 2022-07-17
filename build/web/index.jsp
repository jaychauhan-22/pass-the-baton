<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!-- Bootstrap CSS -->
    <!--====================================================================================================================-->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
      integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
      crossorigin="anonymous"
    />
    <!--====================================================================================================================-->
    <link rel="icon" type="image/png" href="assest/images/img-02.png" />
    <!--===============================================================================================-->
    <link rel="stylesheet" href="assest/style/style.css" />
    <!--====================================================================================================================-->
    <link
      rel="stylesheet"
      type="text/css"
      href="assest/fonts/font-awesome-4.7.0/css/font-awesome.min.css"
    />
    <!--====================================================================================================================-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <!--====================================================================================================================-->
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <!--====================================================================================================================-->
    <link
      href="https://fonts.googleapis.com/css2?family=Baloo+Bhai+2&display=swap"
      rel="stylesheet"
    />
    <!--====================================================================================================================-->

    <title>Hackathon Project</title>
    <style>
      /*Info card*/
      #Workflow {
        padding: 40px 0px 80px;
        background-image: linear-gradient(#333, #121212);
        color: #333;
      }
      #Workflow .work-process::after {
        content: "";
        position: absolute;
        background: rgba(209, 211, 124, 0.22);
        left: 0px;
        top: 0px;
        width: 0px;
        height: 100%;
        transition: all 0.3s;
        z-index: -1;
      }
      #Workflow .work-process:hover::after {
        background: rgba(209, 211, 124, 0.22);
        width: 100%;
        height: 100%;
        z-index: -1;
        border-radius: 10px;
      }
      #Workflow .work-process {
        background-color: #333;
        padding: 40px 15px;
        position: relative;
        z-index: 1;
        transition: 0.5s;
        margin-bottom: 30px;
        border-bottom: 3px solid #ccc31a;
        text-align: center;
      }
      #Workflow .work-process i {
        margin: 0 auto;
        display: table;
        color: #ffffff;
        background-color: rgb(255, 205, 0);
        width: 70px;
        height: 70px;
        border-radius: 8px;
        font-size: 40px;
        text-align: center;
        line-height: 70px;
      }
      #Workflow .work-process h3 {
        margin: 15px 0px;
      }
      #Workflow .work-process h3 a {
        font-size: 20px;
        color: rgb(249, 213, 67);
      }
      #Workflow .work-process p {
        color: rgba(255, 216, 61, 0.738);
      }
    </style>
  </head>

  <body>
    <!-- Header Started -->
    <header>
      <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="index.jsp">
          <img
            src="assest/images/img-02.png"
            width="30"
            height="30"
            class="d-inline-block align-top"
            alt=""
          />
          Pass-The-Baton
        </a>
        <button
          class="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp"
                >Home <span class="sr-only">(current)</span></a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="ourteam.jsp">Our Team</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="contact.jsp">Contact Us</a>
            </li>
          </ul>
          <span>
            <div class="dropdown">
              <button
                class="btn btn-outline-warning dropdown-toggle"
                type="button"
                id="dropdownMenuButton"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                Login / Signup
              </button>
              <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="org_login.jsp">Organization</a>
                <a class="dropdown-item" href="login.jsp">User</a>
              </div>
            </div>
          </span>
        </div>
      </nav>
    </header>
    <!-- Header Ended -->

    <!-- Main Content -->
    <main>
      <!-- Slider Started -->
      <div class="slider">
        <div
          id="carouselExampleCaptions"
          class="carousel slide carousel-fade"
          data-ride="carousel"
        >
          <ol class="carousel-indicators">
            <li
              data-target="#carouselExampleCaptions"
              data-slide-to="0"
              class="active"
            ></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="assest/img/1.png" class="d-block w-100" alt="..." />
            </div>
            <div class="carousel-item">
              <img src="assest/img/2.png" class="d-block w-100" alt="..." />
            </div>
            <div class="carousel-item">
              <img src="assest/img/3.png" class="d-block w-100" alt="..." />
            </div>
            <div class="carousel-item">
              <img src="assest/img/4.png" class="d-block w-100" alt="..." />
            </div>
          </div>
          <button
            class="carousel-control-prev"
            type="button"
            data-target="#carouselExampleCaptions"
            data-slide="prev"
          >
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </button>
          <button
            class="carousel-control-next"
            type="button"
            data-target="#carouselExampleCaptions"
            data-slide="next"
          >
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </button>
        </div>
      </div>
      <!-- Slider Ended -->

      <!--info cards-->
      <section id="Workflow">
        <div class="container">
          <div class="row">
            <div class="col-md-8 offset-md-2">
              <div class="section-title">
                <h1 class="text-center text-white">How It Works?</h1>
              </div>
              <hr class="border-white mb-4 mt-4" />
            </div>
          </div>
          <div class="row">
            <div class="col-md-4">
              <div class="work-process">
                <i class="fa fa-building-o"></i>
                <h3><a href="#">Organizations</a></h3>
                <p>
                  Organizations & NGO's who are looking for solutions to their
                  problems.
                </p>
                <br />
                <br />
              </div>
            </div>
            <div class="col-md-4">
              <div class="work-process">
                <i class="fa fa-users"></i>
                <h3><a href="#">Students</a></h3>
                <p>
                  Students who are looking for project ideas and lean towards
                  the project based learning.
                </p>
                <br />
                <br />
              </div>
            </div>
            <div class="col-md-4">
              <div class="work-process">
                <i class="fa fa-puzzle-piece"></i>
                <h3><a href="#">Pass-The-Baton</a></h3>
                <p>
                  Providing platform where organization can bring their problems
                  to get the solution & students get the chance to put their
                  skills & knowledge in action.
                </p>
              </div>
            </div>
          </div>

          <div class="row d-flex justify-content-around mx-lg-4">
            <div class="col-md-4">
              <div class="work-process">
                <i class="fa fa-check-square-o"></i>
                <h3><a href="#">Organizations Perks</a></h3>
                <p>Innovative solutions from emerging minds.</p>
                <br />
              </div>
            </div>
            <div class="col-md-4">
              <div class="work-process">
                <i class="fa fa-star"></i>
                <h3><a href="#">Student Perks</a></h3>
                <p>
                  Certificate of project completion authorized by respective
                  Organization & Pas-The-Baton.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!--info cards ended-->
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
    <script
      src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
