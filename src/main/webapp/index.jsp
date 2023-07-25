<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>registrationForm</title>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
</head>
<body
	style="background: url(images/stones-167089_1280.jpg); background-size: cover; background-attachment: fixed;">
	<div class="container">
		<div class="row">
			<div class="col m6 offset-m3">
				<div class="card">
					<div class="card-content">

						<h3 style="margin-top: 10px; text-decoration: underline 2px"
							class="center-align">Register Here</h3>
						<h5 id="msg" class="center-align"></h5>

						<div class="form center-align">
							<!-- //creating form -->
							<form id="regForm" action="Register" method="post">
								<input type="text" name="user_name" placeholder="Enter username" />
								<input type="password" name="user_password"
									placeholder="Enter user password" /> <input type="email"
									name="user_email" placeholder="Enter user email id" />
								<div class="file-field input-field">
									<div class="btn grey">
										<span>Image</span> <input type="file"> <input
											name="image" type="file" />
									</div>
									<div class="file-path-wrapper">
										<input class="file-path validate" type="text">
									</div>
								</div>
								<button type="submit" class="btn green">Submit</button>
							</form>
						</div>
						<div class="loader center-align"
							style="margin-top: 10px; display: none;">
							<div class="preloader-wrapper medium active">
								<div class="spinner-layer spinner-blue">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>

								<div class="spinner-layer spinner-red">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>

								<div class="spinner-layer spinner-yellow">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>

								<div class="spinner-layer spinner-green">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>
							</div>
							<h6>Please Wait....</h6>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.7.0.min.js"
		integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
		crossorigin="anonymous"></script>

	<!-- Compiled and minified JavaScript for Materialize CSS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

	<!-- Initialize Materialize components -->
	<script>
		M.AutoInit();
		console.log("page is ready.....")

		$("#regForm").on('submit', function(event) {
			event.preventDefault();

			//var formData = $(this).serialize();
			let formData = new FormData(this);
			console.log(formData);

			$(".loader").show();
			$(".form").hide();

			$.ajax({
				url : "Register",
				data : formData,
				type : 'POST',
				success : function(data, textStatus, jqXHR) {
					console.log(data); // Use the 'data' parameter here
					console.log("Data Added Successfully!!");
					$(".loader").hide();
					$(".form").show();
					if (data.trim() === 'success') {
						$('#msg').html("Successfully Registered !!")
						$('#msg').addClass('green-text')
					} else
						$('msg').html("Something went wrong on server!")
					$('#msg').addClass('red-text')
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(errorThrown); // Use 'errorThrown' parameter here
					console.log("Error occurred during data submission!!");
					$(".loader").hide();
					$(".form").show();
					$('msg').html("Something went wrong on server!")
					$('#msg').addClass('red-text')
				},
				processData : false,
				contentType : false
			});
		});
	</script>

</body>
</html>
