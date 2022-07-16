<!DOCTYPE html>
<html lang="en">

<head>
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="assest/images/img-02.png" />
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assest/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assest/vendor/animate/animate.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assest/vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assest/vendor/select2/select2.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assest/css/util.css">
	<link rel="stylesheet" type="text/css" href="assest/css/main.css">
	<!--===============================================================================================-->
</head>

<body>
    <%
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String valid = request.getParameter("validform");
        out.println(firstname+" "+lastname+" "+email+" "+" "+pass+" "+valid);
        if(!valid.equalsIgnoreCase("1"))
        {
            response.sendRedirect("signup.jsp");
        }
        else
        {
            out.println(firstname+" "+lastname+" "+email+" "+" "+pass+" "+valid);
        }
    %>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="assest/images/img-02.png" alt="IMG">
				</div>

				<form class="login100-form validate-form">
					<span class="login100-form-title">
						OTP Verification
					</span>

					<div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="email" placeholder="Email">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="pass" placeholder="OTP">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Validate OTP
						</button>
					</div>

<!--					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="#">
							Username / Password?
						</a>
					</div>-->

<!--					<div class="text-center p-t-136">
						<a class="txt2" href="signup.jsp">
							Create your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>-->
				</form>
			</div>
		</div>
	</div>




	<!--===============================================================================================-->
	<script src="assest/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="assest/vendor/bootstrap/js/popper.js"></script>
	<script src="assest/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="assest/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="assest/vendor/tilt/tilt.jquery.min.js"></script>
	<script>
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
	<!--===============================================================================================-->
	<script src="assest/js/main.js"></script>

</body>

</html>