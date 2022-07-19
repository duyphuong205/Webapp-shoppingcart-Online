<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="contact py-lg-4 py-md-3 py-sm-3 py-3">
	<div class="container-fluid py-lg-5 py-md-4 py-sm-4 py-3">

		<div class="row">
			<div class="side-bar col-lg-3">
				<div class="search-hotel">
					<h2 class="agileits-sear-head">Search Here..</h2>
					<form action="/home/search" method="post">
						<input type="search" class="text-dark" placeholder="Product name..." name="keyword">
						<input type="submit" value=" ">
					</form>
				</div>
				<!-- price range -->
					<div class="range">
						<h3 class="agileits-sear-head">Price range</h3>
					<form action="/home/search-by-price" method="get">
						<ul class="dropdown-menu6">
							<li>
								<div class="row mx-auto mt-4">
									<div class="form-group col-md-5">
										<input type="text" id="minamount" name="min" class="text-center form-control" value="0" />
									</div>
									<div class="form-group col-md-5">
										<input type="text" id="maxamount" class="text-center form-control" name="max" value="300"/>
									</div>
								</div>
								<div id="slider-range" class="mt-0"></div>
							</li>
						</ul>
						<button class="btn btn-warning mt-3 px-5 text-white" type="submit">Filter</button>
					</form>
				</div>
					<!-- //price range -->
					<hr />
				<!--preference -->
				<div class="left-side">
					<h2 class="agileits-sear-head">Category</h2>
					<ul>
						<li><a href="/home/shop">All Product</a></li>
						<c:forEach var="item" items="${categories}">
						<li><a href="/home/category/${item.id}">${item.name}</a></li>
						</c:forEach>
						
					</ul>
				</div>
				<hr />
				<!-- //show product -->
			</div>
			<div class="left-ads-display col-lg-9">
				<div class="container">
       <div class="row">
        <c:forEach var="item" items="${pageProducts}">
        <div class="col-md-3 col-sm-6">
            <div class="product-grid4">
                <div class="product-image4">
                    <a href="#">
                        <img class="pic-1" src="/images/${item.image}" >
                    </a>
                    <ul class="social">
                        <li><a href="/home/productDeatail/${item.id}" data-tip="Quick View"><i class="fa fa-eye"></i></a></li>
                        <li><a href="#" data-tip="Add to Wishlist"><i class="fa fa-shopping-bag"></i></a></li>
                        <li><a href="/home/cart/add/${item.id}" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
                    </ul>
                    <span class="product-new-label">New</span>
                    <span class="product-discount-label">-10%</span>
                </div>
                <div class="product-content">
                    <h3 class="title"><a href="#">${item.name}</a></h3>
                    <div class="price">
                        ${item.price} Vnd
                    </div>
                    <a class="add-to-cart" href="/home/cart/add/${item.id}">ADD TO CART</a>
                </div>
            </div>
        </div>
        </c:forEach>
						<div class="col-md-12 mx-auto mt-5">
							<ul class="pagination-custom text-center">
								<li class="pag-link"><a href="?page=0"><i
										class="fa fa-angle-double-left"></i></a></li>
								<li class="pag-link"><a href="?page=${pageNumber - 1}"><i
										class="fa fa-chevron-left"></i></a></li>
								<li class="pag-link"><a href="?page=${pageNumber + 1}"><i
										class="fa fa-chevron-right"></i></a></li>
								<li class="pag-link"><a href="?page=${pageTotalPages - 1}"><i
										class="fa fa-angle-double-right"></i></a></li>
							</ul>
						</div>
					</div>
    </div>
			</div>
		</div>
	</div>
</section>