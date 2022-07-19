<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="header-outs" id="home">
	<div class="header-bar ">
		<div class="info-top-grid">
			<div class="info-contact-agile">
				<ul>
					<li><span class="fas fa-phone-volume"></span>
						<p>+(000)123 4565 32</p></li>
					<li><span class="fas fa-envelope"></span>
						<p>
							<a href="mailto:info@example.com">info@example1.com</a>
						</p></li>
					<li></li>
				</ul>
			</div>
		</div>
		<div class="container-fluid">
			<div class="hedder-up row">
				<div class="col-lg-3 col-md-3 logo-head">
					<h1>
						<a class="navbar-brand" href="/home/index">FI-Shop</a>
					</h1>
				</div>
				<div class="col-lg-5 col-md-6 search-right">
					<form class="form-inline my-lg-0" action="/home/search"
						method="post">
						<input class="form-control mr-sm-2 text-dark" type="search"
							name="keyword" placeholder="Search">
						<button class="btn" type="submit">Search</button>
					</form>
				</div>
				<div class="col-lg-4 col-md-3 right-side-cart">
					<div class="cart-icons">
						<ul>
							<li><a href="/home/login"> <span class="far fa-user"></span>
							</a></li>
							<li><a href="/home/signup"> <span
									class="fas fa-user-plus"></span>
							</a></li>
							<li><a href="/home/cart/view"> <span
									class="fas fa-cart-arrow-down"><b
										class="text-white pl-1 pb-1">${cartSize}</b></span></a></li>
							<c:if test="${not empty sessionScope.user}">
								<li><a href="/home/myOrder/${sessionScope.user.username}">
										<span class="fa fa-shopping-bag"></span>
								</a></li>
							</c:if>
							<c:if test="${sessionScope.user.admin}">
								<li><a href="/admin/index">[Administration]</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<nav class="navbar navbar-expand-lg navbar-light ">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-center"
				id="navbarSupportedContent">
				<ul class="navbar-nav ">
					<li class="nav-item active"><a class="nav-link"
						href="/home/index">Home <span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item"><a href="/home/about" class="nav-link">About</a>
					</li>
					<li class="nav-item"><a href="/home/service" class="nav-link">Service</a>
					</li>
					<li class="nav-item"><a href="/home/shop" class="nav-link">Shop
							Now</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown1"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Category </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="nav-link" href="/home/shop">All</a>
							<c:forEach var="item" items="${categories}">
								<a class="nav-link" href="/home/category/${item.id}">${item.name}</a>
							</c:forEach>
						</div></li>
					<li class="nav-item"><a href="/home/contact" class="nav-link">Contact</a>
					</li>
					<li class="nav-item dropdown" data-toggle="collapse"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-expanded="false">
							${sessionScope.user.username} <c:if
								test="${not empty sessionScope.user.photo}">
								<img src="/images/${sessionScope.user.photo}" alt=""
									width="30px" height="30px" />
							</c:if> <c:if test="${empty sessionScope.user.photo}">
								<img src="/images/avt5.jpg" alt="" width="30px" height="30px" />
							</c:if>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item font-weight-bold"
								href="/home/changepassword">Change Password</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item font-weight-bold" href="/home/logout">Logout</a>
						</div></li>
				</ul>
			</div>
		</nav>
	</div>
	<!-- Slideshow 4 -->
	<div class="slider text-center">
		<div class="callbacks_container">
			<ul class="rslides" id="slider4">
				<li>
					<div class="slider-img one-img">
						<div class="container">
							<div class="slider-info ">
								<h5>
									FASHION IN <br>The Latest Trends For YOU
								</h5>
								<div class="bottom-info">
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing
										elit.Aenean commodo ligula eget dolorL orem ipsum dolor sit
										amet eget dolor</p>
								</div>
								<div class="outs_more-buttn">
									<a href="about.html">Read More</a>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="slider-img two-img">
						<div class="container">
							<div class="slider-info ">
								<h5>
									FASHION IN <br>The Latest Trends For YOU
								</h5>
								<div class="bottom-info">
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing
										elit.Aenean commodo ligula eget dolorL orem ipsum dolor sit
										amet eget dolor</p>
								</div>
								<div class="outs_more-buttn">
									<a href="about.html">Read More</a>
								</div>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="slider-img three-img">
						<div class="container">
							<div class="slider-info">
								<h5>
									FASHION IN <br>The Latest Trends For YOU
								</h5>
								<div class="bottom-info">
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing
										elit.Aenean commodo ligula eget dolorL orem ipsum dolor sit
										amet eget dolor</p>
								</div>
								<div class="outs_more-buttn">
									<a href="about.html">Read More</a>
								</div>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<!-- This is here just to demonstrate the callbacks -->
		<!-- <ul class="events">
               <li>Example 4 callback events</li>
               </ul>-->
		<div class="clearfix"></div>
	</div>
</div>