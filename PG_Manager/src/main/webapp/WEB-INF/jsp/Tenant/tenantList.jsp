<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>View Tenants</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
<body>
	<%@ include file="../modules/header.jsp"%>

	<div
		class="page-title-head d-flex align-items-sm-center flex-sm-row flex-column gap-2">
		<div class="flex-grow-1">
			<h4 class="fs-18 fw-semibold mb-0">Orders</h4>
		</div>

		<div class="text-end">
			<ol class="breadcrumb m-0 py-0">
				<li class="breadcrumb-item"><a href="javascript: void(0);">Admin
						Pannal</a></li>

				<li class="breadcrumb-item"><a href="javascript: void(0);">Tenanat
						Management</a></li>

				<li class="breadcrumb-item active">All Records</li>
			</ol>
		</div>
	</div>

	<div class="row">
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
													<option>Select</option>
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
											data-provider="flatpickr"
											data-deafult-date="01 May to 31 May" data-date-format="d M"
											data-range-date="true"> <span
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


				<div class="table-responsive">
					<table class="table table-nowrap mb-0">
						<thead class="bg-light-subtle">
							<tr>
								<th>Tenant ID</th>
								<th>Full Name</th>
								<th>Email</th>
								<th>Mobile</th>
								<th>Gender</th>
								<th>Check-in Date</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
						</thead>

						<tbody>

							<c:forEach var="tenant" items="${tenants}">
								<tr>
									<td>${tenant.tenantId}</td>
									<td>${tenant.fullName}</td>
									<td>${tenant.email}</td>
									<td>${tenant.mobile}</td>
									<td>${tenant.gender}</td>
									<td>${tenant.checkInDate}</td>
									<td>${tenant.status}</td>
									<td class="pe-3">
										<div class="hstack gap-1 justify-content-end">
											<a href="UpdateTenant?id=${tenant.tenantId}"
												class="btn btn-soft-primary btn-icon btn-sm rounded-circle">
												<i class="ti ti-eye"></i>
											</a> <a href="DeleteTenant?id=${tenant.tenantId}"
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

</body>
</html>
