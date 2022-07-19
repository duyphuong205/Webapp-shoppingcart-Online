<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container login-form my-5">
	<div class="row">
		<div class="col-md-12 mx-auto">
			<section class="vh-100 py-4">
				<div class="container-fluid h-custom">
					<div
						class="row d-flex justify-content-center align-items-center h-100">
						<div class="col-md-9 col-lg-6 col-xl-5">
							<img
								src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
								class="img-fluid" alt="Sample image">
						</div>
						<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
							<form action="/home/changepassword" method="post">
								<div
									class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
									<p class="lead fw-normal mb-0 me-3">Sign in with</p>
									<button type="button" class="btn btn-primary btn-floating mx-1">
										<i class="fab fa-facebook-f"></i>
									</button>

									<button type="button" class="btn btn-primary btn-floating mx-1">
										<i class="fab fa-twitter"></i>
									</button>

									<button type="button" class="btn btn-primary btn-floating mx-1">
										<i class="fab fa-linkedin-in"></i>
									</button>
								</div>

								<div class="divider d-flex align-items-center my-4">
									<p class="text-center fw-bold mx-3 mb-0">Or</p>
								</div>
								<!-- username input -->
								<div class="form-outline mb-4">
									<input type="text" id="form3Example3" name="username"
										class="form-control form-control-lg"
										placeholder="Enter Username" /> <label
										class="form-label py-2" for="form3Example3">Username</label>
								</div>

								<!-- Password input -->
								<div class="form-outline mb-3">
									<input type="password" id="form3Example4" name="current_password"
										class="form-control form-control-lg"
										placeholder="Enter current password" /> <label
										class="form-label py-2" for="form3Example4">Current
										Password</label>
								</div>
								<!-- New Password input -->
								<div class="form-outline mb-3">
									<input type="password" id="form3Example4" name="new_password"
										class="form-control form-control-lg"
										placeholder="Enter new password" /> <label
										class="form-label py-2" for="form3Example4">New
										Password</label>
								</div>
								<!-- Confirm Password input -->
								<div class="form-outline mb-3">
									<input type="password" id="form3Example4" name="confirm_password"
										class="form-control form-control-lg"
										placeholder="Enter confirm password" /> <label
										class="form-label py-2" for="form3Example4">Confirm
										Password</label>
								</div>


								<div class="text-center text-lg-start mt-4 pt-2">
									<button type="submit"
										class="btn btn-warning btn-lg form-control"
										style="padding-left: 2.5rem; padding-right: 2.5rem;">Change</button>

								</div>

							</form>
							<div class="text-danger text-center font-weight-bold my-3">
								<c:if test="${not empty error}">
									<h3>${error}</h3>
								</c:if>
							</div>
							<div class="text-info text-center font-weight-bold my-3">
								<c:if test="${not empty message}">
									<h3>${message}</h3>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>