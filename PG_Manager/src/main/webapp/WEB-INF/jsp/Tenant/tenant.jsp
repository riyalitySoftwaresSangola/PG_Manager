<jsp:include page="../modules/header.jsp"></jsp:include>

<div class="row">
	<div class="col-lg-12 p-5">
		<div class="card">
			<div
				class="card-header border-bottom border-dashed d-flex align-items-center">
				<h4 class="header-title">Tenant Registration</h4>
			</div>

			<%-- Success message block --%>
			<c:if test="${not empty successMessage}">
				<div style="color: green; font-weight: bold; margin-bottom: 10px;">
					${successMessage}</div>
			</c:if>

			<div class="card-body">
				<p class="text-muted">Please fill in the details below to
					register as a tenant.</p>
				<form class="needs-validation" action="userRegistration"
					method="post" enctype="multipart/form-data" novalidate>

					<!-- Full Name -->
					<div class="mb-3">
						<label class="form-label" for="fullName">Full Name</label> <input
							type="text" class="form-control" name="fullName" id="fullName"
							placeholder="Full name" required>
						<div class="invalid-feedback">Please enter your full name.</div>
					</div>

					<!-- Email -->
					<div class="mb-3">
						<label class="form-label" for="email">Email</label> <input
							type="email" class="form-control" name="email" id="email"
							placeholder="Email address" required>
						<div class="invalid-feedback">Please enter a valid email
							address.</div>
					</div>

					<!-- Mobile Number -->
					<div class="mb-3">
						<label class="form-label" for="mobile">Mobile Number</label> <input
							type="tel" class="form-control" name="mobile" id="mobile"
							placeholder="Mobile number" required>
						<div class="invalid-feedback">Please enter your mobile
							number.</div>
					</div>

					<!-- Gender -->
					<div class="mb-3">
						<label class="form-label d-block">Gender</label>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="male" value="Male" required> <label
								class="form-check-label" for="male">Male</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="female" value="Female"> <label
								class="form-check-label" for="female">Female</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="gender"
								id="other" value="Other"> <label
								class="form-check-label" for="other">Other</label>
						</div>
						<div class="invalid-feedback">Please select your gender.</div>
					</div>

					<!-- Aadhaar Number -->
					<div class="mb-3">
						<label class="form-label" for="aadhaar">Aadhaar Number</label> <input
							type="text" class="form-control" name="aadhaar" id="aadhaar"
							placeholder="Aadhaar Number" required>
						<div class="invalid-feedback">Please enter your Aadhaar
							number.</div>
					</div>

					<!-- Emergency Contact Number -->
					<div class="mb-3">
						<label class="form-label" for="emergencyContact">Emergency
							Contact Number</label> <input type="tel" class="form-control"
							name="emergencyContact" id="emergencyContact"
							placeholder="Emergency contact number" required>
						<div class="invalid-feedback">Please enter an emergency
							contact number.</div>
					</div>

					<!-- Check-in Date -->
					<div class="mb-3">
						<label class="form-label" for="checkInDate">Check-in Date</label>
						<input type="date" name="checkInDate" class="form-control" required/> 
						<div class="invalid-feedback">Please select a check-in date.</div>
					</div>

					<!-- Check-out Date (Optional) -->
					<div class="mb-3">
						<label class="form-label" for="checkOutDate">Check-out
							Date (Optional)</label> <input type="date" class="form-control"
							name="checkOutDate" id="checkOutDate">
					</div>

					<!-- Upload ID Proof -->
					<div class="mb-3">
						<label class="form-label" for="idProof">Upload ID Proof</label> <input
							type="file" class="form-control" name="idProof" id="idProof"
							accept=".pdf,.jpg,.jpeg,.png" required>
						<div class="invalid-feedback">Please upload a valid ID
							proof.</div>
					</div>

					<!-- Status -->
					<div class="mb-3">
						<label class="form-label" for="statusId">Status</label> <select
							class="form-select no-init" id="statusId" name="status" required>
							<option value="" disabled selected>Select status</option>
							<option value="Active">Active</option>
							<option value="Left">Left</option>
						</select>
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



	<img src="/uploads/idProofs/${tenant.idProofPath}" alt="ID Proof" />

</div>

<jsp:include page="../modules/footer.jsp"></jsp:include>
