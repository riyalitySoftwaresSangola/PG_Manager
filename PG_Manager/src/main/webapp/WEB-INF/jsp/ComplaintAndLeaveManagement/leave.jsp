<jsp:include page="../modules/header.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

					<div class="mb-3">
						<label class="form-label" for="tenantId">Assign to
							Customer</label> <select class="form-select" id="tenantId" name="tenant"
							required>
							<option value="" disabled selected>Select a customer</option>
							<c:forEach var="customer" items="${customers}">
								<option value="${customer.id}">${customer.fullName}</option>
							</c:forEach>
						</select>
						<div class="invalid-feedback">Please select a customer.</div>
					</div>


					<!-- Leave From Date -->
					<div class="mb-3">
						<label class="form-label" for="leaveFrom">Leave From</label> <input
							type="date" class="form-control" id="leaveFrom" name="startDate"
							required>
						<div class="invalid-feedback">Please select start date.</div>
					</div>

					<!-- Leave To Date -->
					<div class="mb-3">
						<label class="form-label" for="leaveTo">Leave To</label> <input
							type="date" class="form-control" id="leaveTo" name="endDate"
							required>
						<div class="invalid-feedback">Please select end date.</div>
					</div>

					<!-- Destination -->
					<div class="mb-3">
						<label class="form-label" for="destination">Destination</label> <input
							type="text" class="form-control" id="destination"
							name="destination">
					</div>

					<!-- Reason -->
					<div class="mb-3">
						<label class="form-label" for="reason">Reason</label>
						<textarea class="form-control" id="reason" name="reason" rows="3"
							required></textarea>
						<div class="invalid-feedback">Please enter a reason.</div>
					</div>

					<!-- Leave Type -->
					<div class="mb-3">
						<label class="form-label" for="type">Leave Type</label> <select
							class="form-select" id="type" name="type" required>
							<option value="" disabled selected>Select leave type</option>
							<option value="CASUAL">Casual</option>
							<option value="EMERGENCY">Emergency</option>
							<option value="VACATION">Vacation</option>
						</select>
						<div class="invalid-feedback">Please select a leave type.</div>
					</div>

					<!-- Status Dropdown (Inside Template) -->
					<div class="mb-3">
						<label class="form-label" for="statusId">Status</label> <select
							class="form-select no-init" id="statusId" name="status" required>
							<option value="PENDING" selected>Pending</option>
							<option value="APPROVED">Approved</option>
							<option value="REJECTED">Rejected</option>
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




<jsp:include page="../modules/footer.jsp"></jsp:include>
