<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*" %>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Organization Home</title>
		<!-- Bootstrap CDN -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
		<!-- Font Awesome CDN -->
                <!--====================================================================================================================-->
  <link rel="icon" type="image/png" href="assest/images/img-02.png" />
  <!--===============================================================================================-->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	<body>
		<!-- Navbar -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid px-lg-5">
				<a class="navbar-brand" href="#">Website</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
					<div class="d-flex flex-column flex-lg-row align-items-start">
                                                <span>
                        <a href="generatecertificate.jsp"><button type="button" class="btn btn-warning mr-2"><i class='fas fa-plus'></i> Issue Certificate </button></a>
                                                </span>
						<!-- Button trigger modal -->
						<button type="button" class="btn bg-transparent text-white mx-1" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
							<i class="fa fa-plus"></i> Post Project
						</button>
						
						<!-- Profile Button -->
						<button type="button" class="btn bg-transparent text-white border-0 mx-1">
							<i class="fa fa-user"></i> Profile
						</button>
						
					</div>
				</div>
			</div>
		  </nav>
		<!-- End of Navbar -->

		<div class="container">
			<!-- Ongoing Projects -->
			<div class="mt-2">
				<h1>Ongoing Projects</h1>
                                <div class="project-cards d-flex flex-column flex-md-row overflow-auto">
                                <%
                                    try{
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "");
                                        
                                        int oid = Integer.parseInt(session.getAttribute("oid").toString());
                                        Statement stmt = con.createStatement();
                                        ResultSet res = stmt.executeQuery("Select * from projects where oid = "+oid+";");
                                        
                                        while(res.next()){
                                            String projectId = res.getString(1);
                                            String projectTitle = res.getString(2);
                                            String projectDescription = res.getString(3);
                                %>
                                            <div class="card m-2" style="width: 18rem;">
                                                <div class="card-body">
                                                        <h5 class="card-title"><%= projectTitle %></h5>
                                                        <h6 class="card-subtitle mb-2 text-muted">Issued On: 20/07/2022</h6>
                                                        <p class="card-text">
                                                            <%= projectDescription %>
                                                        </p>
                                                        <a href="viewproject.jsp?pid=<%= projectId %>" class="card-link">View Project</a>
                                                </div>
                                            </div>    
                                <%        }
                                    }catch(Exception e){
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
					<div class="card m-2" style="width: 18rem;">
						<div class="card-body">
							<h5 class="card-title">Project title</h5>
							<h6 class="card-subtitle mb-2 text-muted">Issued On: 20/07/2022</h6>
							<h6 class="card-subtitle mb-2 text-muted">Completed On: 30/07/2022</h6>
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							<a href="#" class="card-link">View Project</a>
						</div>
					</div>
					<div class="card m-2" style="width: 18rem;">
						<div class="card-body">
							<h5 class="card-title">Project title</h5>
							<h6 class="card-subtitle mb-2 text-muted">Issued On: 20/07/2022</h6>
							<h6 class="card-subtitle mb-2 text-muted">Completed On: 30/07/2022</h6>
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							<a href="#" class="card-link">View Project</a>
						</div>
					</div>
					<div class="card m-2" style="width: 18rem;">
						<div class="card-body">
							<h5 class="card-title">Project title</h5>
							<h6 class="card-subtitle mb-2 text-muted">Issued On: 20/07/2022</h6>
							<h6 class="card-subtitle mb-2 text-muted">Completed On: 30/07/2022</h6>
							<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
							<a href="#" class="card-link">View Project</a>
						</div>
					</div>
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
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
				<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				<input type="submit" value="Post" class="btn btn-primary">
				</div>
                            </form>
			</div>
			</div>
		</div>
		<!-- End of Post Project Modal -->

		<!-- Bootstrap Javascript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	</body>
</html>
