<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>View Tenants</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/plugins/monthSelect/style.css"
	rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script
	src="https://cdn.jsdelivr.net/npm/flatpickr/dist/plugins/monthSelect/index.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%@ include file="../modules/header.jsp"%>

	<!-- Page Title -->
	<div
		class="page-title-head d-flex align-items-sm-center flex-sm-row flex-column gap-2">
		<div class="flex-grow-1">
			<h4 class="fs-18 fw-semibold mb-0">Orders</h4>
		</div>
		<div class="text-end">
			<ol class="breadcrumb m-0 py-0">
				<li class="breadcrumb-item"><a href="javascript: void(0);">Admin
						Pannal</a></li>
				<li class="breadcrumb-item"><a href="javascript: void(0);">Tenant
						Management</a></li>
				<li class="breadcrumb-item active">All Records</li>
			</ol>
		</div>
	</div>

	<!-- Filters Row -->
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header border-bottom border-light">
					<div class="row align-items-center g-3">

						<!-- Search Tenant -->
						<div class="col-md-3">
							<div class="position-relative">
								<input type="text" class="form-control ps-4"
									placeholder="Search Tenant"> <i
									class="ti ti-search position-absolute top-50 translate-middle-y ms-2"></i>
							</div>
						</div>

						<!-- Status Filter -->
						<div class="col-md-3">
							<form action="${pageContext.request.contextPath}/filterTenants"
								method="get" id="statusForm">
								<select class="form-select" name="status"
									onchange="document.getElementById('statusForm').submit();"
									id="status-select">
									<option>Status</option>
									<option value="Active"
										${param.status == 'Active' ? 'selected' : ''}>Active</option>
									<option value="Left"
										${param.status == 'Left' ? 'selected' : ''}>Left</option>
								</select>
							</form>
						</div>

					<div class="col-md-3">
    <form action="${pageContext.request.contextPath}/filterTenantsByMonth" method="get" id="monthForm">
        <div class="input-group">
            <input type="text" id="monthPicker" name="month" class="form-control" placeholder="Select Month" readonly>
            <span class="input-group-text bg-primary border-primary text-white">
                <i class="ti ti-calendar fs-15"></i>
            </span>
        </div>
    </form>
</div>

						<div class="col-12 col-md-3 col-lg-3 ">
							<div
								class="d-flex flex-wrap justify-content-start justify-content-md-end gap-2">
								<button type="button" class="btn btn-success">
									<i class="ti ti-settings me-1"></i> More Setting
								</button>
								<button type="button" class="btn btn-dark">
									<i class="ti ti-filter me-1"></i> Filters
								</button>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Alert container at top-right -->
	<div class="position-fixed top-0 end-0 p-3" style="z-index: 1100;">
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

	<!-- Tenant Table -->
	<div class="table-responsive mt-3">
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
								<a
									href="${pageContext.request.contextPath}/UpdateTenant?id=${tenant.tenantId}"
									class="btn btn-soft-primary btn-icon btn-sm rounded-circle">
									<i class="ti ti-eye"></i>
								</a> <a
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

	
<script>
    
    flatpickr("#monthPicker", {
        plugins: [
            new monthSelectPlugin({
                shorthand: true,
                dateFormat: "Y-m",   
                altFormat: "F Y",   
            })
        ],
        onChange: function(selectedDates, dateStr) {
            document.getElementById("monthForm").submit(); 
        }
    });
</script>

	<!-- SweetAlert messages -->
	<c:if test="${not empty successMessage}">
		<script>
            Swal.fire({
                icon: 'success',
                title: 'Success!',
                text: '${successMessage}',
                showConfirmButton: false,
                timer: 3000
            });
        </script>
	</c:if>

	<c:if test="${not empty errorMessage}">
		<script>
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: '${errorMessage}',
                showConfirmButton: true
            });
        </script>
	</c:if>

</body>
</html>
