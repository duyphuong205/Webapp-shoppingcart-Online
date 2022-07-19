<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<div class="container">
	<section class="pt-5 pb-5">
		<div class="container">
			<div class="row w-100">
				<div class="col-lg-12 col-md-12 col-12">
					<h3 class="display-5 mb-2 text-center font-weight-bold">Shopping Cart</h3>
					<p class="mb-5 text-center">
						<i class="text-info font-weight-bold">${cartSize}</i> items in your cart
					</p>
					<table id="shoppingCart"
						class="table table-condensed table-responsive table-hover">
						<thead class="table-dark">
							<tr>
								<th style="width: 50%">Product</th>
								<th style="width: 12%">Price</th>
								<th style="width: 10%">Quantity</th>
								<th style="width: 10%">Amout</th>
								<th style="width: 10%"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${cart}">
								<form action="/home/cart/update" method="post">
									<input type="hidden" name="id" value="${item.id}">
									<tr>
										<td data-th="Product">
											<div class="row">
												<div class="col-md-3 text-left">
													<img src="/images/${item.image}" alt=""
														class="img-fluid d-none d-md-block rounded-circle mb-2 shadow ">
												</div>
												<div class="col-md-9 text-left mt-sm-2 ">
													<h4 class="align-middle">${item.name}</h4>

												</div>
											</div>
										</td>
										<td data-th="Price">${item.price}</td>
										<td data-th="Quantity"><input type="number"
											name="quantity"
											class="form-control form-control-lg text-center"
											value="${item.quantity}" onblur="this.form.submit()">
										</td>
										<td data-th="Amount">${item.price * item.quantity}</td>
										<td class="actions" data-th="">
											<div class="text-right">
												<a href="/home/cart/remove/${item.id}"
													class="btn btn-white border-secondary bg-white btn-md mb-2">
													<i class="fas fa-trash"></i>
												</a>
											</div>
										</td>
									</tr>
								</form>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left pt-5">
						<a href="/home/cart/clear" class="btn btn-danger"> Clear All </a>
					</div>
					<div class="float-right text-right col-md-6">
						<div class="card">
						<div class="card-header bg-warning">
						<h2 class="text-dark text-left">Subtotal: ${cartSize} Items</h2>
						</div>
						<div class="card-body p-0">
								<c:forEach var="item" items="${cart}">
								<ul class="list-group">
									<li class="list-group-item text-left">${item.name} <span class="badge badge-danger float-right">${item.price} Vnđ</span></li>
								</ul>
								</c:forEach>
								<h3 class="font-weight-bold text-center">Total = ${totals} Vnđ</h3>
						</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-4 d-flex align-items-center">
				<div class="col-sm-6 order-md-2 text-right">
					<a href="/home/checkout"
						class="btn btn-primary mb-4 btn-lg pl-5 pr-5 mr-5">Checkout</a>
				</div>
				<div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
					<a href="/home/shop" class="btn btn-primary"> <i class="fas fa-arrow-left mr-2"></i>
						Continue Shopping
					</a>
				</div>
			</div>
		</div>
	</section>
</div>