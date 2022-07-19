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
							<form action="/home/login" method="post">
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
										class="form-control form-control-lg" value="${usernameCookie}"
										placeholder="Enter Username" /> <label
										class="form-label py-2" for="form3Example3">Username</label>
								</div>

								<!-- Password input -->
								<div class="form-outline mb-3">
									<input type="password" id="form3Example4" name="password"
										class="form-control form-control-lg" value="${passwordCookie}"
										placeholder="Enter password" /> <label
										class="form-label py-2" for="form3Example4">Password</label>
								</div>

								<div class="d-flex justify-content-between align-items-center">
									<!-- Checkbox -->
									<div class="form-check mb-0">
										<input class="form-check-input me-2" type="checkbox"
											name="remember" id="form2Example3" value="true" /> <label
											class="form-check-label" for="form2Example3">
											Remember me </label>
									</div>
									<a href="/home/forgotpassword" class="text-body text-primary">Forgot
										password?</a>
								</div>

								<div class="text-center text-lg-start mt-4 pt-2">
									<button type="submit"
										class="btn btn-warning btn-lg form-control"
										style="padding-left: 2.5rem; padding-right: 2.5rem;">Login</button>
									<p class="small fw-bold mt-2 pt-1 mb-0">
										Don't have an account? <a href="/home/signup"
											class="text-danger">Register</a>
									</p>
								</div>

							</form><div class="text-danger text-center font-weight-bold">
									<c:if test="${not empty error}">
										<h3>${error}</h3>
									</c:if>
								</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>