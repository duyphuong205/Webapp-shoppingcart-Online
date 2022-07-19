<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
								<form action="/home/forgotpassword" method="post">
									<div
										class="d-flex flex-row align-items-center justify-content-center justify-content-lg-start">
										<p class="lead fw-normal mb-0 me-3">Sign in with</p>
										<button type="button"
											class="btn btn-primary btn-floating mx-1">
											<i class="fab fa-facebook-f"></i>
										</button>

										<button type="button"
											class="btn btn-primary btn-floating mx-1">
											<i class="fab fa-twitter"></i>
										</button>

										<button type="button"
											class="btn btn-primary btn-floating mx-1">
											<i class="fab fa-linkedin-in"></i>
										</button>
									</div>

									<div class="divider d-flex align-items-center my-4">
										<p class="text-center fw-bold mx-3 mb-0">Or</p>
									</div>
									
									<!-- Email input -->
									<div class="form-outline mb-3">
										<input type="text" id="form3Example4"
											class="form-control form-control-lg"
											placeholder="Enter username" name="username" /> <label class="form-label py-2"
											for="form3Example4">Your Username</label>
									</div>
									
									<!-- Password input -->
									<div class="form-outline mb-3">
										<input type="email" id="form3Example4"
											class="form-control form-control-lg"
											placeholder="Enter email" name="email"/> <label class="form-label py-2"
											for="form3Example4">Your Email Address</label>
									</div>
									
									<div class="text-center text-lg-start mt-4 pt-2">
										<button type="submit" class="btn btn-warning btn-lg form-control"
											style="padding-left: 2.5rem; padding-right: 2.5rem;">Recover</button>
										<p class="small fw-bold mt-2 pt-1 mb-0">
											You have created an account? <a href="/home/login" class="text-danger">Login Here?</a>
										</p>
									</div>

								</form>
								<div class="text-danger text-center font-weight-bold">
									<c:if test="${not empty error}">
										<h3>${error}</h3>
									</c:if>
								</div>
								<div class="text-success text-center font-weight-bold">
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