<jsp:include page="../modules/header.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row">
	<div class="col-lg-12 p-5">

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
				<h4 class="header-title">Room Management</h4>
			</div>

			<div class="card-body">
				<p class="text-muted">Please fill in the details below to manage
					the Rooms.</p>
				<form class="needs-validation" action="addRooms" method="post"
					enctype="multipart/form-data" novalidate>

					<!-- Room Number -->
					<div class="mb-3">
						<label class="form-label" for="roomNumber">Number of Room
						</label> <input type="number" class="form-control" name="roomCount"
							id="roomNumber" placeholder="Enter room number" required>
						<div class="invalid-feedback">Please enter a room number.</div>
					</div>

					<!-- Room Type -->
					<div class="mb-3">
						<label class="form-label" for="roomType">Room Type</label> <select
							class="form-select" name="roomType" id="roomType" required>
							<option value="" disabled selected>Select room type</option>
							<option value="Single">Single</option>
							<option value="Double">Double</option>
							<option value="Triple">Triple</option>
						</select>
						<div class="invalid-feedback">Please select a room type.</div>
					</div>

					<!-- Monthly Rent -->
					<div class="mb-3">
						<label class="form-label" for="monthlyRent">Monthly Rent</label> <input
							type="number" class="form-control" name="monthlyRent"
							id="monthlyRent" placeholder="Enter monthly rent" required>
						<div class="invalid-feedback">Please enter the monthly rent.</div>
					</div>

					<!-- AC Available -->
					<div class="mb-3 form-check">
						<input type="checkbox" class="form-check-input" name="acAvailable"
							id="acAvailable"> <label class="form-check-label"
							for="acAvailable">AC Available</label>
					</div>

					<!-- Attached Bathroom -->
					<div class="mb-3 form-check">
						<input type="checkbox" class="form-check-input"
							name="attachedBathroom" id="attachedBathroom"> <label
							class="form-check-label" for="attachedBathroom">Attached
							Bathroom</label>
					</div>

					<!-- Status -->
					<div class="mb-3">
						<label class="form-label" for="statusID">Status</label> <select
							class="form-select" name="status" id="statusID" required>
							<option value="" disabled selected>Select status</option>
							<option value="Active">Active</option>
							<option value="Left">Left</option>
						</select>
						<div class="invalid-feedback">Please select a status.</div>
					</div>

					<!-- Terms and Conditions -->
					<div class="mb-3">
						<div class="form-check">
							<input type="checkbox" class="form-check-input" id="termsCheck"
								required> <label class="form-check-label form-label"
								for="termsCheck">I agree to the terms and conditions</label>
							<div class="invalid-feedback">You must agree before
								submitting.</div>
						</div>
					</div>

					<button class="btn btn-primary" type="submit">Register</button>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
 
  setTimeout(() => {
    let alerts = document.querySelectorAll('.alert');
    alerts.forEach(alert => {
      let bsAlert = new bootstrap.Alert(alert);
      bsAlert.close();
    });
  }, 3000); 
</script>


<jsp:include page="../modules/footer.jsp"></jsp:include>
