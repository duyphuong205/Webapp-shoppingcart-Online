<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<div class="container my-5">
		<section class="row mb-4">
			<div class="col-md-12"></div>
			<div class="col-md-12">
				<table class="table table-borderless table-account ">
					<thead class="table-dark">
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