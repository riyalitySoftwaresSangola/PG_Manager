<jsp:include page="modules/header.jsp"></jsp:include>

<div class="row">
	<div class="col-lg-12 p-5">
		<div class="card">
			<div
				class="card-header border-bottom border-dashed d-flex align-items-center">
				<h4 class="header-title">Leave Request Form</h4>
			</div>

			<div class="card-body">
				<form action="submitLeaveRequest" method="post"
					class="needs-validation" novalidate>

					<!-- Select Customer -->
					<div class="mb-3">
						<label class="form-label" for="customerId">Select Customer</label>
						<select class="form-select" id="customerId" name="customerId"
							required>
							<option value="" disabled selected>Select a customer</option>
							<%-- Populate dynamically --%>
							<option value="1">John Doe</option>
							<option value="2">Jane Smith</option>
						</select>
						<div class="invalid-feedback">Please select a customer.</div>
					</div>

					<!-- Leave From Date -->
					<div class="mb-3">
						<label class="form-label" for="leaveFrom">Leave From</label> <input
							type="date" class="form-control" id="leaveFrom" name="leaveFrom"
							required>
						<div class="invalid-feedback">Please select start date.</div>
					</div>

					<!-- Leave To Date -->
					<div class="mb-3">
						<label class="form-label" for="leaveTo">Leave To</label> <input
							type="date" class="form-control" id="leaveTo" name="leaveTo"
							required>
						<div class="invalid-feedback">Please select end date.</div>
					</div>

					<!-- Reason -->
					<div class="mb-3">
						<label class="form-label" for="reason">Reason</label>
						<textarea class="form-control" id="reason" name="reason" rows="3"
							required></textarea>
						<div class="invalid-feedback">Please enter a reason.</div>
					</div>

					<!-- Status Dropdown (Inside Template) -->
					<div class="mb-3">
						<label class="form-label" for="statusId">Status</label>
						 <select class="form-select no-init" id="statusId" name="status" required >
							<option value="" disabled selected>Select status</option>
							<option value="Pending">Pending</option>
							<option value="Approved">Approved</option>
							<option value="Rejected">Rejected</option>
						</select>
						<div class="invalid-feedback">Please select a status.</div>
					</div>


					<button type="submit" class="btn btn-primary">Submit
						Request</button>
				</form>
			</div>
		</div>
	</div>
</div>




<jsp:include page="modules/footer.jsp"></jsp:include>
