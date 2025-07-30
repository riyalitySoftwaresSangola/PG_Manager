

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<jsp:include page="../modules/header.jsp" />



<div
	class="page-title-head d-flex align-items-sm-center flex-sm-row flex-column gap-2">
	<div class="flex-grow-1">
		<h4 class="fs-18 fw-semibold mb-0">Meal Records</h4>
	</div>
	<div class="text-end">
		<ol class="breadcrumb m-0 py-0">
			<li class="breadcrumb-item"><a href="javascript:void(0);">Admin
					Panel</a></li>
			<li class="breadcrumb-item"><a href="javascript:void(0);">Meal
					Management</a></li>
			<li class="breadcrumb-item active">Meal List</li>
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
							<div class="col-lg-4">
								<div class="position-relative">
									<input type="text" class="form-control ps-4"
										placeholder="Search Teanat"> <i
										class="ti ti-search position-absolute top-50 translate-middle-y ms-2"></i>
								</div>
							</div>

							<div class="col-lg-4">
								<form action="${pageContext.request.contextPath}/filterTenants"
									method="get" id="statusForm">
									<div class="flex-grow-1 d-flex align-items-center">
										<label for="status-select" class="me-2">Status</label>

										<div class="flex-grow-1">
											<select class="form-select my-1 my-md-0" name="status"
												onchange="document.getElementById('statusForm').submit();"
												data-toggle="select2" id="status-select">
												<option value="Active"
													${param.status == 'Active' ? 'selected' : ''}>Active</option>
												<option value="Left"
													${param.status == 'Left' ? 'selected' : ''}>Left</option>

											</select>
										</div>
									</div>
								</form>
							</div>


							<div class="col-lg-4">
								<div class="input-group">
									<input type="text" class="form-control"
										data-provider="flatpickr" data-deafult-date="01 May to 31 May"
										data-date-format="d M" data-range-date="true"> <span
										class="input-group-text bg-primary border-primary text-white">
										<i class="ti ti-calendar fs-15"></i>
									</span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-6">
						<div class="text-md-end mt-3 mt-md-0">
							<button type="button"
								class="btn btn-success waves-effect waves-light me-1">
								<i class="ti ti-settings me-1"></i>More Setting
							</button>
							<button type="button"
								class="btn btn-dark waves-effect waves-light">
								<i class="ti ti-filter me-1"></i> Filters
							</button>
						</div>
					</div>

				</div>
			</div>



			<!-- 🔍 Filter Form -->
			<form method="get" action="viewMeal"
				class="mb-4 row g-2 align-items-end">
				<div class="col-auto">
					<label for="date" class="form-label">Select Date:</label> <input
						type="date" id="date" name="date" class="form-control"
						value="${selectedDate}">
				</div>
				<div class="col-auto">
					<button type="submit" class="btn btn-primary">Filter</button>
				</div>
			</form>

			<!-- 📋 Meal Records Table -->
			<div class="table-responsive">
				<table class="table table-bordered table-hover align-middle mb-0">
					<thead class="table-light">
						<tr>
							<th>Tenant Name</th>
							<th>Date</th>
							<th>Breakfast</th>
							<th>Lunch</th>
							<th>Dinner</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="meal" items="${meals}">
							<tr>
								<td>${meal.tenant.fullName}</td>
								<td>${meal.mealDate}</td>
								<td><c:if test="${meal.breakfast}">✔️</c:if></td>
								<td><c:if test="${meal.lunch}">✔️</c:if></td>
								<td><c:if test="${meal.dinner}">✔️</c:if></td>
								<td class="pe-3">
									<div class="hstack gap-1 justify-content-center">
										<button type="button"
											class="btn btn-soft-primary btn-icon btn-sm rounded-circle"
											onclick="openMealEditModal(${meal.id})">
											<i class="ti ti-eye"></i>
										</button>
										<a
											href="${pageContext.request.contextPath}/DeleteTenant?id=${tenant.tenantId}"
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



			<!-- Bootstrap Modal -->
			<div class="modal fade" id="mealEditModal" tabindex="-1"
				aria-labelledby="mealEditModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<form id="updateMealForm" method="post"
							action="${pageContext.request.contextPath}/updateMeal">
							<div class="modal-header">
								<h5 class="modal-title">Update Meal</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!-- ✅ Correct hidden field -->
								<input type="hidden" id="mealId" name="mealId">

								<div class="mb-3">
									<label for="tenantName" class="form-label">Tenant Name</label>
									<input type="text" class="form-control" id="tenantName"
										readonly>
								</div>

								<div class="mb-3">
									<label for="mealDate" class="form-label">Meal Date</label> <input
										type="date" class="form-control" id="mealDate" name="mealDate">
								</div>

								<div class="mb-3">
									<label class="form-label">Meal Types</label><br>
									<!-- ✅ Correct name and value for meal checkboxes -->
									<input type="checkbox" name="meals" value="Breakfast"
										id="breakfast"> Breakfast <input type="checkbox"
										name="meals" value="Lunch" id="lunch"> Lunch <input
										type="checkbox" name="meals" value="Dinner" id="dinner">
									Dinner
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">Update</button>
							</div>
						</form>

					</div>
				</div>
			</div>

			<!-- <script>
function submitMealUpdateForm() {
    const formData = new FormData(document.getElementById("mealForm"));

    fetch('${pageContext.request.contextPath}/updateMeal', {
        method: 'POST',
        body: formData
    }).then(response => response.text())
      .then(data => {
        Swal.fire("Success", data, "success");
      }).catch(err => {
        Swal.fire("Error", "Something went wrong!", "error");
      });
}
</script> -->

			<script>function openMealEditModal(mealId) {
			    if (!mealId) {
			        alert("Meal ID is missing.");
			        return;
			    }

			    fetch('${pageContext.request.contextPath}/api/meal/' + mealId)
			        .then(res => {
			            if (!res.ok) {
			                throw new Error("HTTP status " + res.status);
			            }
			            return res.json();
			        })
			        .then(data => {
			        	console.log(data);
			            document.getElementById("mealId").value = data.id;
			            document.getElementById("mealDate").value = data.mealDate;
			            document.getElementById("breakfast").checked = data.breakfast;
			            document.getElementById("lunch").checked = data.lunch;
			            document.getElementById("dinner").checked = data.dinner;
			            document.getElementById("tenantName").value = data.tenantName || 'N/A';

			            new bootstrap.Modal(document.getElementById("mealEditModal")).show();
			        })
			        .catch(err => {
			            console.error("Error fetching meal data:", err);
			            alert("Failed to load meal data.");
			        });
			}


</script>


			<jsp:include page="../modules/footer.jsp" />