<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
							<form:form action="/home/signup" method="post"
								enctype="multipart/form-data" modelAttribute="accountDTO">
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

								<!-- Email input -->
								<div class="form-outline mb-4">
									<label class="form-label py-1" for="form3Example3">Username</label>
									<form:input type="text" id="form3Example3"
										class="form-control form-control-lg"
										placeholder="Enter Username" path="username" />
									<form:errors path="username" class="text-danger" />
								</div>

								<!-- Password input -->
								<div class="form-outline mb-3">
									<label class="form-label py-1" for="form3Example4">Password</label>
									<form:input type="password" id="form3Example4"
										class="form-control form-control-lg"
										placeholder="Enter password" path="password" />
									<form:errors path="password" class="text-danger" />
								</div>

								<!-- Fullname input -->
								<div class="form-outline mb-3">
									<label class="form-label py-1" for="form3Example4">Fullname</label>
									<form:input type="text" id="form3Example4"
										class="form-control form-control-lg"
										placeholder="Enter fullname" path="fullname" />
									<form:errors path="fullname" class="text-danger" />
								</div>

								<!-- Email input -->
								<div class="form-outline mb-3">
									<label class="form-label py-1" for="form3Example4">Email
										Address</label>
									<form:input type="email" id="form3Example4"
										class="form-control form-control-lg" placeholder="Enter email"
										path="email" />
									<form:errors path="email" class="text-danger" />
								</div>

								<!-- 								admin input -->
								<!-- 								<div class="form-outline mb-3"> -->
								<!-- 									<input type="hidden" id="form3Example4" -->
								<!-- 										class="form-control form-control-lg" value="false" /> -->
								<!-- 								</div> -->

								<!-- 								activated input -->
								<!-- 								<div class="form-outline mb-3"> -->
								<!-- 									<input type="hidden" id="form3Example4" -->
								<!-- 										class="form-control form-control-lg" value="true" /> -->
								<!-- 								</div> -->

								<div class="form-outline mb-3">
									<label class="form-label py-1" for="form3Example4">Photo</label>
									<input type="file" id="form3Example4" name="photoFile"
										class="form-control form-control-lg" placeholder="Enter photo" />
								</div>
								<div class="text-center text-lg-start mt-4 pt-2">
									<form:button class="btn btn-warning btn-lg form-control"
										style="padding-left: 2.5rem; padding-right: 2.5rem;">Register</form:button>
									<p class="small fw-bold mt-2 pt-1 mb-0">
										You have created an account? <a href="/home/login"
											class="text-danger">Login Here?</a>
									</p>
								</div>

							</form:form>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
</div>