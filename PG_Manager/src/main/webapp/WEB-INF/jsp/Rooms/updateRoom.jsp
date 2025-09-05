<jsp:include page="../modules/header.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="row">
	<div class="col-lg-12 p-5">

		<div class="card">
			<div class="card-header border-bottom border-dashed d-flex align-items-center">
				<h4 class="header-title">Update Room</h4>
			</div>

			<div class="card-body">
				<p class="text-muted">Update the details of the room below.</p>

				<form class="needs-validation" 
					  action="${pageContext.request.contextPath}/updateRoom" 
					  method="post" novalidate>

					<!-- Hidden ID -->
					<input type="hidden" name="roomId" value="${room.id}" />

					<!-- Room Number -->
					<div class="mb-3">
						<label class="form-label" for="roomNumber">Room Number</label>
						<input type="text" class="form-control" name="roomNumber"
							   id="roomNumber" value="${room.roomNumber}" readonly>
					</div>

					<!-- Room Type -->
					<div class="mb-3">
						<label class="form-label" for="roomType">Room Type</label>
						<select class="form-select" name="roomType" id="roomType" required>
							<option value="Single" ${room.roomType == 'Single' ? 'selected' : ''}>Single</option>
							<option value="Double" ${room.roomType == 'Double' ? 'selected' : ''}>Double</option>
							<option value="Triple" ${room.roomType == 'Triple' ? 'selected' : ''}>Triple</option>
						</select>
					</div>

					<!-- Monthly Rent -->
					<div class="mb-3">
						<label class="form-label" for="monthlyRent">Monthly Rent</label>
						<input type="number" class="form-control" name="monthlyRent"
							   id="monthlyRent" value="${room.monthlyRent}" required>
					</div>

					<!-- AC Available -->
					<div class="mb-3 form-check">
						<input type="checkbox" class="form-check-input" name="acAvailable"
							id="acAvailable" ${room.acAvailable ? 'checked' : ''}>
						<label class="form-check-label" for="acAvailable">AC Available</label>
					</div>

					<!-- Attached Bathroom -->
					<div class="mb-3 form-check">
						<input type="checkbox" class="form-check-input" name="attachedBathroom"
							id="attachedBathroom" ${room.attachedBathroom ? 'checked' : ''}>
						<label class="form-check-label" for="attachedBathroom">Attached Bathroom</label>
					</div>

					<!-- Status -->
					<div class="mb-3">
						<label class="form-label" for="statusID">Status</label>
						<select class="form-select" name="status" id="statusID" required>
							<option value="Active" ${room.status == 'Active' ? 'selected' : ''}>Active</option>
							<option value="Left" ${room.status == 'Left' ? 'selected' : ''}>Left</option>
						</select>
					</div>

					<button class="btn btn-primary" type="submit">Update Room</button>
					<a href="${pageContext.request.contextPath}/rooms" class="btn btn-secondary">Cancel</a>
				</form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="../modules/footer.jsp"></jsp:include>
