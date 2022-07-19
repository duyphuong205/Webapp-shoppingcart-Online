<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<style>
.table-account {
	border: 1px solid #DCDCDC;
	border-radius: 5px;
}

.form-control {
	border-radius: 15px;
}

.card-admin {
	margin-bottom: 50px;
	margin-top: 20px;
	box-shadow: 8px 8px 12px gray;
}

.card-admin .btnAccout {
	color: white;
}

.title h2 {
	padding: 7px;
	margin-left: 200px;
	margin-right: 200px;
	border-radius: 50px;
	background-color: #20B2AA;
	color: white
}
</style>
<script type="text/javascript">
     function chooseFile(fileInput){
    	 if(fileInput.files && fileInput.files[0]){
    		 var reader = new FileReader();
    		 reader.onload = function(event){
    			 $('#image').attr('src',event.target.result);
    		 }
    		 reader.readAsDataURL(fileInput.files[0]);
    	 }
     }
</script>
<title>Insert title here</title>
</head>
<body>

	<div class="container mb-4">
		<section class="row ">
			<div class="col-md-8 mx-auto">
				<div class="card card-admin">
					<div class="card-header bg-white ">
						<a href="/admin/account" class="btn btn-info btnAccout">Account
							List</a>
					</div>
					<div class="mt-2  text-center title">
						<h2>Account Information</h2>
					</div>
					<form:form action="/admin/account/add" method="post"
						enctype="multipart/form-data" modelAttribute="accountDTO">
						<div class="card-body font-weight-bold">
							<div class="row">
								<div class="form-group col-md-6">
									<label for="">Username</label>
									<form:input type="text" class="form-control"
										placeholder="Enter Username" path="username" />
									<form:errors path="username" class="text-danger" />
								</div>
								<div class="form-group col-md-6">
									<label for="">Password</label>
									<form:input type="password" class="form-control"
										placeholder="Enter Password" path="password" />
									<form:errors path="password" class="text-danger" />
								</div>
								<div class="form-group col-md-12">
									<label for="">Fullname</label>
									<form:input type="text" class="form-control"
										placeholder="Enter Fullname" path="fullname" />
									<form:errors path="fullname" class="text-danger" />
								</div>
								<div class="form-group col-md-12">
									<label for="">Email Address</label>
									<form:input type="email" class="form-control"
										placeholder="Enter Email" path="email" />
									<form:errors path="email" class="text-danger" />
								</div>
								<div class="form-group col-md-12">
									<label for="">Activated:</label> <br />
									<div class="form-check-inline">
										<label class="form-check-label"> <form:radiobuttons
												class="form-check-input ml-2" path="activated"
												items="${activated}" />
										</label>
									</div>
									<form:errors path="activated" class="text-danger" />
								</div>
								<div class="form-group col-md-12">
									<label for="">Role:</label> <br />
									<div class="form-check-inline">
										<label class="form-check-label"> <form:radiobuttons
												class="form-check-input ml-2" items="${roles}" path="admin" />
										</label>
									</div>
									<form:errors path="admin" class="text-danger" />
								</div>
								<div class="form-group col-md-12">
									<label for="">File Photo</label>
									<div class="custom-file">
										<input type="file" name="photoFile" class="custom-file-input"
											id="input_Image" onchange="chooseFile(this)"> <label class="custom-file-label"
											for="customFile">Choose file</label>
									</div>
								</div>
								<img src="/images/${accountDTO.photoName}"
									class="rounded-circle mx-auto" id="image" width="350px" height="350px" onerror="this.style.display='none';"/>
							</div>
						</div>
						<div class="card-footer bg-white">
							<div class="form-group col-md-12">
								<button class="btn btn-primary">Save</button>
								<button formaction="/admin/account/update" formmethod="post"
									class="btn btn-info border">Update</button>
								<button
									formaction="/admin/account/delete/${accountDTO.username}"
									formmethod="get" class="btn btn-danger ">Delete</button>
								<button formaction="/admin/account/add" formmethod="get" class="btn btn-warning">Reset</button>
							</div>
						</div>
					</form:form>

				</div>
			</div>
		</section>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
		integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
		crossorigin="anonymous"></script>
</body>
</html>