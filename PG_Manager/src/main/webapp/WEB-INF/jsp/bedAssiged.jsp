

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="modules/header.jsp"></jsp:include>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row">
	<div class="col-lg-12 p-5">
		<div class="card">
			<div
				class="card-header border-bottom border-dashed d-flex align-items-center">
				<h4 class="header-title">Bed Assignment</h4>
			</div>

			<div class="card-body">
				<p class="text-muted">Assign a bed to a customer by selecting
					room, bed, and customer details.</p>

				<form class="needs-validation" action="assignBed" method="post"
					novalidate>

					<!-- Select Room -->
					<div class="mb-3">
						<label class="form-label" for="roomId">Select Room</label> <select
							class="form-select" id="roomId" name="roomId" required>
							<option value="" disabled selected>Select a room</option>
							<c:forEach var="room" items="${Rooms}">
								<option value="${room.id}">${room.roomNumber}</option>
							</c:forEach>
						</select>
						<div class="invalid-feedback">Please select a room.</div>
					</div>

					<!-- Select Bed Number -->
					<div class="mb-3">
						<label class="form-label" for="bedNumber">Select Bed
							Number</label> <select class="form-select" id="bedNumber"
							name="bedNumber" required>
							<option value="" disabled selected>Select bed number</option>
							<%-- Example bed numbers (dynamic if needed) --%>
							<option value="1">Bed 1</option>
							<option value="2">Bed 2</option>
							<option value="3">Bed 3</option>
						</select>
						<div class="invalid-feedback">Please select a bed number.</div>
					</div>

					<!-- Assign to Customer -->
					<div class="mb-3">
						<label class="form-label" for="customerId">Assign to
							Customer</label> <select class="form-select" id="customerId"
							name="customerId" required>
							<option value="" disabled selected>Select a customer</option>
							
							<c:forEach var="customer" items="${customers}">
								<option value="${customer.id}">${customer.fullName}</option>
							</c:forEach>
						</select>
						<div class="invalid-feedback">Please select a customer.</div>
					</div>

					<!-- Occupied Checkbox -->
					<div class="mb-3 form-check">
						<input class="form-check-input" type="checkbox" id="occupied"
							name="occupied"> <label class="form-check-label"
							for="occupied">Occupied</label>
					</div>

					<button class="btn btn-primary" type="submit">Assign Bed</button>

				</form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="modules/footer.jsp"></jsp:include>
