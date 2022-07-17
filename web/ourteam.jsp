<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@include
file="footer.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Our Team</title>
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

    <!-- Profile cards -->
    <div class="wrapper-profile d-flex flex-column pt-4">
      <div>
        <h2 class="text-center text-white pt-5">Our Team</h2>
      </div>
      <div class="d-flex justify-content-center align-items-center">
        <div class="card-container">
          <img
            class="round"
            src="assest/profiles/pankil-profile.jpg"
            alt="user"
          />
          <h3>Pankil Doshi</h3>
          <h6>Godhra, Gujarat</h6>
          <p>
            Undergrad Computer Science Student <br />
            At Dharmsinh Desai University
          </p>
          <div class="social">
            <h6 class="text-center">Social</h6>
            <ul class="d-flex justify-content-center">
              <li class="rounded-circle">
                <a
                  href="https://www.instagram.com/pankil_doshi/"
                  target="_blank"
                >
                  <i class="fa fa-instagram m-2"></i>
                </a>
              </li>
              <li class="rounded-circle">
                <a
                  href="https://www.linkedin.com/in/pankil-doshi-1705561a1"
                  target="_blank"
                >
                  <i class="fa fa-linkedin m-2"></i>
                </a>
              </li>
              <li class="rounded-circle">
                <a href="https://github.com/pankildoshi" target="_blank">
                  <i class="fa fa-github m-2"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="card-container">
          <img class="round" src="assest/profiles/jay-profile.jpg" alt="user" />
          <h3>Jay Chauhan</h3>
          <h6>Porbandar, Gujarat</h6>
          <p>
            Undergrad Computer Science Student <br />
            At Dharmsinh Desai University
          </p>
          <div class="social">
            <h6 class="text-center">Social</h6>
            <ul class="d-flex justify-content-center">
              <li class="rounded-circle">
                <a href="https://www.instagram.com/jay42.22/" target="_blank">
                  <i class="fa fa-instagram m-2"></i>
                </a>
              </li>
              <li class="rounded-circle">
                <a
                  href="https://www.linkedin.com/in/jay-chauhan-b83b2620b"
                  target="_blank"
                >
                  <i class="fa fa-linkedin m-2"></i>
                </a>
              </li>
              <li class="rounded-circle">
                <a href="https://github.com/JayChauhan189" target="_blank">
                  <i class="fa fa-github m-2"></i>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- Profile cards Ended -->

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
