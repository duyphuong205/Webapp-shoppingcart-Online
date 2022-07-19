<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="index3.html" class="brand-link"> <img
		src="/AssetsForAdmin/dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
		class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light">AdminLTE 3</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<div class="image">
				<img src="/images/${sessionScope.user.photo}"
					class="img-circle elevation-2" alt="User Image">
			</div>
			<div class="info">
				<a href="#" class="d-block">${sessionScope.user.username}</a>
			</div>
		</div>

		<!-- SidebarSearch Form -->
		<div class="form-inline">
			<div class="input-group" data-widget="sidebar-search">
				<input class="form-control form-control-sidebar" type="search"
					placeholder="Search" aria-label="Search">
				<div class="input-group-append">
					<button class="btn btn-sidebar">
						<i class="fas fa-search fa-fw"></i>
					</button>
				</div>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
				<li class="nav-item menu-open"><a href="#"
					class="nav-link active"> <i
						class="nav-icon fas fa-tachometer-alt"></i>
						<p>
							Manage <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="/admin/account" class="nav-link ">
								<i class="far fa-circle nav-icon"></i>
								<p>Account User</p>
						</a></li>
						<li class="nav-item"><a href="/admin/category" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Category</p>
						</a></li>
						<li class="nav-item"><a href="/admin/product" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Product</p>
						</a></li>
						<li class="nav-item"><a href="/admin/cartitem" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>CartItem</p>
						</a></li>
						<li class="nav-item"><a href="/admin/order" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Order</p>
						</a></li>
					</ul></li>
				<li class="nav-item menu-open"><a href="#"
					class="nav-link active"> <i
						class="nav-icon fas fa-tachometer-alt"></i>
						<p>
							Reports & Statistics <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="/admin/inventory-by-category" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Inventory</p>
						</a></li>
						<li class="nav-item"><a href="/admin/revenue-report" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p>Revenue</p>
						</a></li>
						
					</ul></li>
			</ul>
		</nav>
		<!-- /.sidebar-menu -->
			<div class="justify-content-center my-3">
			<a class="btn btn-danger form-control" href="/home/logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
			</div>
	</div>
	

</aside>