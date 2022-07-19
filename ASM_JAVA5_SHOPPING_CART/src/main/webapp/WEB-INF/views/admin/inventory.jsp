<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.form-Search .form-control {
	border-radius: 15px;
}
</style>

<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<section class="row mb-4">
			<div class="col-md-12"></div>
			<div class="col-md-8 mx-auto">
			<h1 class="text-center text-info font-weight-bold my-3">Inventory By Category</h1>
				<table class="table table-borderless table-account ">
					<thead>
						<tr>
							<th class="text-center">No.</th>
							<th class="text-center">Category Name</th>
							<th class="text-center">Total Money</th>
							<th class="text-center">Number Products</th>
						</tr>
					</thead>
					<tbody>
					    <c:set var="no" value="0"/>
						<c:forEach var="item" items="${inventories}">
						<c:set var="no" value="${no + 1}"/>
							<tr>
								<td class="align-middle text-center">${no}</td>
								<td class="align-middle text-center">${item.name}</td>
								<td class="align-middle text-center">${item.sum}</td>
								<td class="align-middle text-center">${item.count}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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