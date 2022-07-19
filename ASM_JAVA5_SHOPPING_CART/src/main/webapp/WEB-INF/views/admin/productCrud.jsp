<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
	background-color: #F5F5F5;
	border-radius: 15px;
}

.card-admin {
	margin-bottom: 50px;
	margin-top: 20px;
	box-shadow: 8px 8px 12px gray;
	background-color: white;
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

	<div class="container">
		<section class="row mb-4">
			<div class="col-md-8 mx-auto">
				<div class="card card-admin">
					<div class="card-header bg-white">
						<a href="/admin/product" class="btn btn-success ml-auto">Product
							List</a>
					</div>
					<div class="mt-2  text-danger text-center title">
						<h2>Product Information</h2>
					</div>
					<form:form action="/admin/product/add" method="post"
						enctype="multipart/form-data" modelAttribute="productDTO">
						<div class="card-body font-weight-bold ">
							<div class="row">
								<div class="form-group col-md-6">
									<label for="">Product Id</label>
									<form:input type="text" class="form-control"
										placeholder="No enter" path="id" readonly="true" />
								</div>
<!-- 								<div class="form-group col-md-6"> -->
<!-- 									<label for="">CreateDate</label> -->
<%-- 									<form:input type="text" class="form-control" --%>
<%-- 										placeholder="No enter" path="createdate" readonly="true" /> --%>
<!-- 								</div> -->
								<div class="form-group col-md-6">
									<label for="">Product Name</label>
									<form:input type="text" class="form-control"
										placeholder="Enter Name" path="name" />
								</div>
								<div class="form-group col-md-6">
									<label for="">Price</label>
									<form:input type="number" class="form-control"
										placeholder="Enter Price" path="price" />
								</div>
								<div class="form-group col-md-6">
									<label for="">Category Id</label>
									<form:select class="form-control" path="categoryId">
										<c:forEach var="item" items="${categories}">
											<option value="${item.id}">${item.name}</option>
										</c:forEach>
									</form:select>
								</div>
								<div class="form-group col-md-12">
									<label for="">File Photo</label>
									<div class="custom-file">
										<input type="file" name="imageFile" class="custom-file-input"
											id="customFile" onchange="chooseFile(this)"> <label class="custom-file-label"
											for="customFile">Choose file</label>
									</div>
								</div>
								<img src="/images/${productDTO.imageName}"
									class="rounded-circle mx-auto" id="image" width="350px" height="350px" onerror="this.style.display='none';"/>
								<div class="form-group col-md-12">
									<label for="">Avaiable:</label> <br />
									<div class="form-check-inline">
										<label class="form-check-label"> <form:radiobuttons
												class="form-check-input ml-2" items="${avaiables}"
												path="avaiable" />
										</label>
									</div>
								</div>
								<div class="form-group col-md-12">
									<label for="">Description</label>
									<form:textarea rows="3" class="form-control"
										placeholder="Enter description" path="description" />
								</div>
							</div>
						</div>
						<div class="card-footer bg-white">
							<div class="form-group col-md-12">
								<button class="btn btn-primary">Save</button>
								<button formaction="/admin/product/update"  formmethod="post" class="btn btn-info border">Update</button>
								<button formaction="/admin/product/delete/${productDTO.id}"  formmethod="get" class="btn btn-danger">Delete</button>
								<button formaction="/admin/product"  formmethod="get" class="btn btn-warning">Reset</button>
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