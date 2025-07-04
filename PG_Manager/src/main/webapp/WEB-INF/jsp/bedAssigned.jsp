<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="modules/header.jsp" />

<div class="row">
	<div class="col-lg-12 p-5">
		<div class="card">
			<div
				class="card-header border-bottom border-dashed d-flex align-items-center">
				<h4 class="header-title">Bed Assignment</h4>
			</div>

			<div class="card-body">
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

					<!-- Select Bed -->
					<div class="mb-3">
						<label class="form-label" for="bedNumber">Select Bed
							Number</label> <select id="bedNumber" name="bedNumber"
							class="form-select" required>
							<option value="" disabled selected>Select bed number</option>
						</select>
						<div class="invalid-feedback">Please select a bed number.</div>
					</div>

					<!-- Assign to Customer -->
					<div class="mb-3">
						<label class="form-label" for="tenantId">Assign to
							Customer</label> <select class="form-select" id="tenantId"
							name="tenantId" required>
							<option value="" disabled selected>Select a customer</option>
							<c:forEach var="customer" items="${customers}">
								<option value="${customer.id}">${customer.fullName}</option>
							</c:forEach>
						</select>
						<div class="invalid-feedback">Please select a customer.</div>
					</div>

					<!-- Submit -->
					<button class="btn btn-primary" type="submit">Assign Bed</button>
				</form>
			</div>
		</div>
	</div>
</div>






<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



<script>
document.getElementById('roomId').addEventListener('change', function () {
	const roomId = this.value;
	if (!roomId) return;

	fetch(`http://localhost:6766/getBedsByRoomId/${roomId}`)
		.then(response => response.json())
		.then(beds => {
			console.log("Beds loaded:", beds);
			const bedDropdown = document.getElementById('bedNumber');
			bedDropdown.innerHTML = `<option value="" disabled selected>Select bed number</option>`;

			let count = 0;
			beds.forEach(bed => {
				if (bed.status !== 'Occupied') {
					const option = document.createElement('option');
					option.value = bed.bedId;
					option.textContent = `Bed ${bed.bedNumber} (${bed.bedType})`;
					bedDropdown.appendChild(option);
					count++;
				}
			});

			if (count === 0) {
				const noBedsOption = document.createElement('option');
				noBedsOption.disabled = true;
				noBedsOption.textContent = "No available beds";
				bedDropdown.appendChild(noBedsOption);
			}
		})
		.catch(error => {
			console.error("Error loading beds:", error);
			alert("Failed to load beds.");
		});
});

</script>


<jsp:include page="modules/footer.jsp" />
