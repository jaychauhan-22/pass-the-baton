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

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="assest/images/img-02.png" alt="IMG">
				</div>

                            <form class="login100-form validate-form" action="validate" method="post">
					<span class="login100-form-title">
						Member Login
					</span>
                                        

					<div class="wrap-input100 validate-input" data-validate="Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="email" placeholder="Email">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
                                            <input class="input100" type="password" name="pass" placeholder="Password" minlength="8" maxlength="16">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Login
						</button>
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="#">
							Username / Password?
						</a>
                                            <p class="txt1" style="color: red">
                                                    <br>
							<%
//                                                            String s = (String)session.getAttribute("loginfailed");
                                                            if(session.getAttribute("loginfailed")!= null)
                                                            {
                                                                out.println("Invalid Username Or Password ");
                                                            }
                                                        %>
						</p>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="signup.jsp">
							Create your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
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