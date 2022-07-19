<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/AssetsForUser/css/checkout.css" />
<div class="container px-4 py-5 mx-auto">
	<div class="row justify-content-center">
		<div class="col-lg-12">
			<form action="/home/checkout" method="post">
				<div class="card">
					<h2 class="text-center mb-5 mt-3 font-weight-bold">SHIPPING
						INFORMATION</h2>
					<div class="row">
						<div class="col-lg-8">
							<div class="form-group">
								<label class="form-control-label">Full Name</label> <input
									type="text" id="cname" name="cname"
									placeholder="Enter Fullname" readonly
									value="${sessionScope.user.fullname}">
							</div>
							<div class="form-group">
								<label class="form-control-label">Email</label> <input
									type="email" id="email" name="email" placeholder="Enter Email"
									value="${sessionScope.user.email}">
							</div>
							<div class="form-group">
								<label class="form-control-label">Phone Number</label> <input
									type="number" id="cnum" name="phone"
									placeholder="Enter phone number">
							</div>


							<div class="form-group">
								<label class="form-control-label">Address</label> <input
									type="text" id="exp" name="address" placeholder="Enter addredd">
							</div>
						</div>
						<div class="col-lg-4 mt-2">
							<c:forEach var="item" items="${cart}">
								<div class="row d-flex justify-content-between px-4">
									<p class="mb-1 text-left">${item.name}</p>
									<h6 class="mb-1 text-right">
										<b>[${item.price} Vnđ]</b>
									</h6>
								</div>
							</c:forEach>

							<div class="row d-flex justify-content-between px-4" id="tax">
								<p class="mb-1 text-left">Total:</p>
								<h6 class="mb-1 text-right">${totals}Vnđ</h6>
							</div>
							<button class="btn-block btn-blue" type="submit">
								<span> <span id="checkout">Checkout</span> <span
									id="check-amt">${totals} Vnđ</span>
								</span>
							</button>
						</div>
					</div>
					<c:if test="${not empty message}">
					<h2 class="text-center text-success mb-5 mt-3 font-weight-bold">${message}</h2>
					</c:if>
				</div>
			</form>
		</div>
	</div>


</div>