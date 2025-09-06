<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp"></jsp:include>

<div class="page-title-head d-flex align-items-sm-center flex-sm-row flex-column gap-2">
	<div class="flex-grow-1">
		<h4 class="fs-18 fw-semibold mb-0">Rooms & Beds</h4>
	</div>
	<div class="text-end">
		<ol class="breadcrumb m-0 py-0">
			<li class="breadcrumb-item"><a href="javascript:void(0);">Admin Panel</a></li>
			<li class="breadcrumb-item"><a href="javascript:void(0);">Room Management</a></li>
			<li class="breadcrumb-item active">Room List</li>
		</ol>
	</div>
</div>

<div class="row mt-4">
	<div class="col-12">
		<div class="card">

			<div class="card-header border-bottom border-light">
				<div class="row justify-content-between g-3">
					<div class="col-lg-6">
						<div class="row g-3">
							<!-- Search Bar -->
							<div class="col-lg-4">
								<div class="position-relative">
									<input type="text" class="form-control ps-4" placeholder="Search Room / Tenant" id="searchInput">
									<i class="ti ti-search position-absolute top-50 translate-middle-y ms-2"></i>
								</div>
							</div>

							<!-- Status Filter -->
							<div class="col-lg-4">
								<form action="${pageContext.request.contextPath}/filterRooms" method="get" id="statusForm">
									<div class="flex-grow-1 d-flex align-items-center">
										<label for="status-select" class="me-2">Status</label>
										<div class="flex-grow-1">
											<select class="form-select my-1 my-md-0" name="status"
												onchange="document.getElementById('statusForm').submit();" id="status-select">
												<option value="Active" ${param.status == 'Active' ? 'selected' : ''}>Active</option>
												<option value="Left" ${param.status == 'Left' ? 'selected' : ''}>Left</option>
											</select>
										</div>
									</div>
								</form>
							</div>

						</div>
					</div>

					<div class="col-lg-6">
						<div class="text-md-end mt-3 mt-md-0">
							<button type="button" class="btn btn-success waves-effect waves-light me-1">
								<i class="ti ti-settings me-1"></i>More Setting
							</button>
							<button type="button" class="btn btn-dark waves-effect waves-light">
								<i class="ti ti-filter me-1"></i> Filters
							</button>
						</div>
					</div>

				</div>
			</div>

			<!-- Table -->
			<div class="table-responsive">
				<table class="table table-bordered table-hover align-middle mb-0" id="roomTable">
					<thead class="table-light">
						<tr>
							<th>Room No</th>
							<th>Room Type</th>
							<th>Rent</th>
							<th>AC</th>
							<th>Bathroom</th>
							<th>Status</th>
							<th>Beds</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="room" items="${rooms}">
							<tr>
								<td class="room-number">${room.roomNumber}</td>
								<td class="room-type">${room.roomType}</td>
								<td>₹${room.monthlyRent}</td>
								<td>${room.acAvailable ? 'Yes' : 'No'}</td>
								<td>${room.attachedBathroom ? 'Yes' : 'No'}</td>
								<td class="room-status">${room.status}</td>
								<td>
									<table class="table table-sm table-bordered mb-0">
										<thead class="bg-light">
											<tr>
												<th>Bed No</th>
												<th>Type</th>
												<th>Status</th>
												<th>Tenant</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="bed" items="${room.beds}">
												<tr>
													<td>${bed.bedNumber}</td>
													<td>${bed.bedType}</td>
													<td><c:choose>
															<c:when test="${bed.status eq 'Occupied'}">
																<span class="text-danger fw-bold">${bed.status}</span>
															</c:when>
															<c:otherwise>
																<span class="text-success fw-semibold">${bed.status}</span>
															</c:otherwise>
														</c:choose></td>
													<td><c:choose>
															<c:when test="${bed.tenant != null}">
																${bed.tenant.fullName} (${bed.tenant.mobile})
															</c:when>
															<c:otherwise>
																<span class="text-muted">Not Assigned</span>
															</c:otherwise>
														</c:choose></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</td>

								<td class="pe-3">
									<div class="hstack gap-1 justify-content-end">
										<a href="${pageContext.request.contextPath}/UpdateRoom?id=${room.id}"
											class="btn btn-soft-primary btn-icon btn-sm rounded-circle">
											<i class="ti ti-eye"></i>
										</a>
										<a href="${pageContext.request.contextPath}/toggleRoomStatus?id=${room.id}"
											class="btn btn-soft-danger btn-icon btn-sm rounded-circle">
											<i class="ti ti-trash"></i>
										</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>
</div>
<script>
	// Universal search bar functionality (search all fields)
	document.getElementById('searchInput').addEventListener('keyup', function () {
		const filter = this.value.toLowerCase();
		const rows = document.querySelectorAll('#roomTable tbody tr');

		rows.forEach(row => {
			// Get all text content inside the row (including nested tables like tenant info)
			const rowText = row.textContent.toLowerCase();

			if (rowText.includes(filter)) {
				row.style.display = '';
			} else {
				row.style.display = 'none';
			}
		});
	});
</script>


<jsp:include page="../modules/footer.jsp"></jsp:include>
