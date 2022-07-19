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
		    <div class="col-md-8">
		    <form action="/admin/revenue-report" method="post">
		    <div class="row">
		    <div class="form-group col-md-3">
		    <input type="date" class="form-control" name="mindate" value="${param.mindate}"/>
		    </div>
		    <div class="form-group col-md-3 ml-0">
		    <input type="date" class="form-control" name="maxdate" value="${param.maxdate}"/>
		    </div>
		    <div class="form-group col-md-3">
		     <button class="btn btn-danger py-1" type="submit">Search</button>
		    </div>
		    </div>
		    </form>
		    </div>
			<div class="col-md-12"></div>
			<div class="col-md-12 mx-auto">
				<table class="table table-borderless table-account ">
					<thead>
						<tr>
							<th class="text-center">No.</th>
							<th class="text-center">Category Id</th>
							<th class="text-center">Product Name</th>
							<th class="text-center">Quantity Sold</th>
							<th class="text-center">Number People Order</th>
							<th class="text-center">Date Order</th>
							<th class="text-center">Total Revenue</th>
						</tr>
					</thead>
					<tbody>
					    <c:set var="no" value="0"/>
						<c:forEach var="item" items="${revenues}">
						<c:set var="no" value="${no + 1}"/>
							<tr>
								<td class="align-middle text-center">${no}</td>
								<td class="align-middle text-center">${item.categoryId}</td>
								<td class="align-middle text-center">${item.productName}</td>
								<td class="align-middle text-center">${item.quantity}</td>
								<td class="align-middle text-center">${item.usernameOrder}</td>
								<td class="align-middle text-center">
								 <fmt:formatDate value="${item.dateOrder}" pattern="dd-MM-yyyy"/>
								</td>
								<td class="align-middle text-center">${item.totalRevenue}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
<!-- 			<div class="col-md-12"> -->
<!-- 							<ul class="pagination-custom text-center"> -->
<!-- 								<li class="pag-link"><a href="/admin/order?page=0"><i -->
<!-- 										class="fa fa-angle-double-left"></i></a></li> -->
<%-- 								<li class="pag-link"><a href="/admin/order?page=${pageNumber - 1}"><i --%>
<!-- 										class="fa fa-chevron-left"></i></a></li> -->
<%-- 								<li class="pag-link"><a href="/admin/order?page=${pageNumber + 1}"><i --%>
<!-- 										class="fa fa-chevron-right"></i></a></li> -->
<%-- 								<li class="pag-link"><a href="/admin/order?page=${pageTotals - 1}"><i --%>
<!-- 										class="fa fa-angle-double-right"></i></a></li> -->
<!-- 							</ul> -->
<!-- 			</div> -->
			<!-- Modal -->
			<div class="modal fade" id="deleteModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Delete Order</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<p>Are you sure you want to delete order?</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">No</button>
							<a class="btn btn-danger" href="" id="deleteHref">Yes</a>
						</div>
					</div>
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