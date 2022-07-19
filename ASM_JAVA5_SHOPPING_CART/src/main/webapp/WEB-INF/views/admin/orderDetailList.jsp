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
			<div class="col-md-12">
				<table class="table table-borderless table-account ">
					<thead>
						<tr>
							<th class="text-center">Id</th>
							<th class="text-center">Username</th>
							<th class="text-center">Product Image</th>
							<th class="text-center">Product Name</th>
							<th class="text-center">Price</th>
							<th class="text-center">Quantity</th>
							<th class="text-center">Total</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${orderDetails}">
							<tr>
								<td class="align-middle text-center">${item.id}</td>
								<td class="align-middle text-center">${item.order.account.fullname}</td>
								<td class="align-middle text-center">
								<img src="/images/${item.product.image}" alt="" width="100px;" height="100px;" class="rounded-circle"/>
								</td>
								<td class="align-middle text-center">${item.product.name}</td>
								<td class="align-middle text-center">${item.price}</td>
								<td class="align-middle text-center">${item.quantity}</td>
								<td class="align-middle text-center">${item.price * item.quantity} Vnđ</td>
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