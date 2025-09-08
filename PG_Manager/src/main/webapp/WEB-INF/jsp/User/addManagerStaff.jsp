<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />

<div class="row">
	<div class="col-lg-12 p-5">

		<!-- Alert container -->
		<div class="position-fixed top-0 my-5 end-0 p-3"
			style="z-index: 1100;">
			<c:if test="${not empty successMessage}">
				<div class="alert alert-success alert-dismissible fade show shadow"
					role="alert">
					${successMessage}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<c:if test="${not empty errorMessage}">
				<div class="alert alert-danger alert-dismissible fade show shadow"
					role="alert">
					${errorMessage}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
		</div>

		<div class="card">
			<div
				class="card-header border-bottom border-dashed d-flex align-items-center">
				<h4 class="header-title">Add Manager / Staff</h4>
			</div>

			<div class="card-body">
				<form class="needs-validation"
					action="${pageContext.request.contextPath}/addManagerStaff"
					method="post" novalidate>

					<!-- Role -->
					<div class="mb-3">
						<label class="form-label">Role</label> <select class="form-select"
							name="role" required>
							<option value="" disabled selected>-- Select Role --</option>
							<option value="MANAGER">Manager</option>
							<option value="STAFF">Staff</option>
						</select>
						<div class="invalid-feedback">Please select a role.</div>
					</div>

					<!-- Username -->
					<div class="mb-3">
						<label class="form-label" for="username">Username</label> <input
							type="text" class="form-control" name="username" id="username"
							placeholder="Enter username" required minlength="4"
							maxlength="20" pattern="^[A-Za-z0-9]{4,20}$" autocomplete="off">
						<div class="invalid-feedback">Username must be 4–20
							alphanumeric characters.</div>
					</div>

					<!-- Email -->
					<div class="mb-3">
						<label class="form-label" for="email">Email</label> <input
							type="email" class="form-control" name="email" id="email"
							placeholder="Enter email" required maxlength="50"
							pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[A-Za-z]{2,}$"
							autocomplete="off">
						<div class="invalid-feedback">Please enter a valid email.</div>
					</div>

					<!-- Mobile Number -->
					<div class="mb-3">
						<label class="form-label" for="mobile">Mobile Number</label> <input
							type="text" class="form-control" name="mobile" id="mobile"
							placeholder="Enter mobile number" required minlength="10"
							maxlength="10" pattern="^[6-9][0-9]{9}$" autocomplete="off">
						<div class="invalid-feedback">Please enter a valid 10-digit
							mobile number starting with 6–9.</div>
					</div>

					<!-- Password -->
					<div class="mb-3">
						<label class="form-label" for="password">Password</label> <input
							type="password" class="form-control" name="password"
							id="password" placeholder="Enter password" required
							maxlength="20" autocomplete="new-password">
						<div class="invalid-feedback">Password must be 6–20
							characters, include at least 1 letter & 1 number.</div>
					</div>

					<button class="btn btn-primary" type="submit">Save User</button>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- Auto-dismiss Alerts -->
<script>
	setTimeout(() => {
		document.querySelectorAll('.alert').forEach(alert => {
			if (bootstrap.Alert.getOrCreateInstance(alert)) {
				bootstrap.Alert.getInstance(alert).close();
			}
		});
	}, 4000);
</script>

<!-- Bootstrap Validation -->
<script>
(function () {
	'use strict';
	const forms = document.querySelectorAll('.needs-validation');
	Array.from(forms).forEach(form => {
		form.addEventListener('submit', function (event) {
			if (!form.checkValidity()) {
				event.preventDefault();
				event.stopPropagation();
			}
			form.classList.add('was-validated');
		}, false);
	});
})();
</script>

<jsp:include page="../modules/footer.jsp"></jsp:include>
