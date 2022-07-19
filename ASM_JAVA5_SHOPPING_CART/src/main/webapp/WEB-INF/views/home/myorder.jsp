<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container my-5">
	<div class="row">
		<div class="col-md-8 mx-auto">
			<table class="table table-bordered text-center">
				<thead class="table-dark">
					<tr>
						<th>No.</th>
						<th>My Phone</th>
						<th>My Address</th>
						<th>Date Order</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="no" value="0" />
					<c:forEach var="item" items="${myOrders}">
						<c:set var="no" value="${no + 1}" />
						<tr>
							<td>${no}</td>
							<td>${item.phone}</td>
							<td>${item.address}</td>
							<td><fmt:formatDate value="${item.createdate}"
									pattern="dd-MM-yyyy" /></td>
							<td><a href="/home/orderDetail/${item.id}"
								class="btn btn-danger">Info</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>