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
	margin-left: 20px;
	margin-right: 20px;
	border-radius: 50px;
	background-color: #20B2AA;
	color: white
}
</style>
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<section class="row mb-4">
			<div class="col-md-5 mx-auto">
				<div class="card card-admin">
					<div class="card-header bg-white">
						<a href="/admin/category" class="btn btn-success ml-auto">Category
							List</a>
					</div>
					<div class="mt-2  text-danger text-center title">
						<h2>Category Information</h2>
					</div>
					<form:form action="/admin/category/add" method="post" modelAttribute="category">
					<div class="card-body font-weight-bold">
						<div class="row">
							<div class="form-group col-md-12">
								<label for="">Category Id</label> <form:input type="text"
									class="form-control" placeholder="Enter categoryid" path="id"/>
							</div>
							<div class="form-group col-md-12">
								<label for="">Name</label> <form:input type="text"
									class="form-control" placeholder="Enter name" path="name"/>
							</div>

						</div>
					</div>
					<div class="card-footer bg-white">
						<div class="form-group col-md-12">
							<button class="btn btn-primary">Save</button>
							<button formaction="/admin/category/update" formmethod="post" class="btn btn-info border">Update</button>
								<button formaction="/admin/category/delete/${category.id}"
									formmethod="get" class="btn btn-danger">Delete</button>
								<button formaction="/admin/category/add" formmethod="get" class="btn btn-warning">Reset</button>
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