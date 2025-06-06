<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8" />
<title>Log In || PG Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta
	content="A fully featured admin theme which can be used to build CRM, CMS, etc."
	name="description" />
<meta content="Coderthemes" name="author" />

<!-- App favicon -->
<link rel="shortcut icon" href="resources/assets/images/favicon.ico">

<!-- Theme Config Js -->
<script src="resources/assets/js/config.js"></script>

<!-- Vendor css -->
<link href="resources/assets/css/vendor.min.css" rel="stylesheet"
	type="text/css" />

<!-- App css -->
<link href="resources/assets/css/app.min.css" rel="stylesheet"
	type="text/css" id="app-style" />

<!-- Icons css -->
<link href="resources/assets/css/icons.min.css" rel="stylesheet"
	type="text/css" />
</head>

<body>

	<div
		class="auth-bg d-flex min-vh-100 justify-content-center align-items-center">
		<div class="row g-0 justify-content-center w-100 m-xxl-5 px-xxl-4 m-3">
			<div class="col-xl-4 col-lg-5 col-md-6">
				<div class="card overflow-hidden text-center h-100 p-xxl-4 p-3 mb-0">
					<a href="index.html" class="auth-brand mb-3"> <img
						src="resources/assets/images/logo-dark.png" alt="dark logo"
						height="24" class="logo-dark"> <img
						src="resources/assets/images/logo.png" alt="logo light"
						height="24" class="logo-light">
					</a>

					<h3 class="fw-semibold mb-2">Login your account</h3>

					<p class="text-muted mb-4">Enter your email address and
						password to access admin panel.</p>

					<div class="d-flex justify-content-center gap-2 mb-3">
						<a href="#!" class="btn btn-soft-danger avatar-lg"><i
							class="ti ti-brand-google-filled fs-24"></i></a> <a href="#!"
							class="btn btn-soft-success avatar-lg"><i
							class="ti ti-brand-apple fs-24"></i></a> <a href="#!"
							class="btn btn-soft-primary avatar-lg"><i
							class="ti ti-brand-facebook fs-24"></i></a> <a href="#!"
							class="btn btn-soft-info avatar-lg"><i
							class="ti ti-brand-linkedin fs-24"></i></a>
					</div>

					<p class="fs-13 fw-semibold">Or Login With Email</p>

					<form action="login" method="post" class="text-start mb-3">
						<div class="mb-3">
							<label class="form-label" for="example-email">Email</label> <input
								type="email" id="example-email" name="exampleEmail"
								class="form-control" placeholder="Enter your email">
						</div>

						<div class="mb-3">
							<label class="form-label" for="example-password">Password</label>
							<input type="password" id="example-password"
								name="examplePassword" class="form-control"
								placeholder="Enter your password">
						</div>



						<div class="d-flex justify-content-between mb-3">
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="checkbox-signin"> <label class="form-check-label"
									for="checkbox-signin">Remember me</label>
							</div>

							<a href="auth-recoverpw.html"
								class="text-muted border-bottom border-dashed">Forget
								Password</a>
						</div>

						<div class="d-grid">
							<button class="btn btn-primary" type="submit">Login</button>
						</div>
					</form>

					<c:if test="${param.error eq 'true'}">
						<div class="alert alert-danger">Invalid credentials!</div>
					</c:if>

					<p class="text-danger fs-14 mb-4">
						Don't have an account? <a href="register"
							class="fw-semibold text-dark ms-1">Sign Up !</a>
					</p>

					<p class="mt-auto mb-0">
						<script>
							document.write(new Date().getFullYear())
						</script>
						�Riyality - By <span
							class="fw-bold text-decoration-underline text-uppercase text-reset fs-12">Sajjan
							Ghadage</span>
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Vendor js -->
	<script src="resources/assets/js/vendor.min.js"></script>

	<!-- App js -->
	<script src="resources/assets/js/app.js"></script>

</body>
</html>