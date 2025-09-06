<%@ include file="../modules/header.jsp"%>

<div class="page-title-head d-flex align-items-sm-center flex-sm-row flex-column gap-2">
    <div class="flex-grow-1">
        <h4 class="fs-18 fw-semibold mb-0">Leave Requests</h4>
    </div>

    <!-- Success message -->
    <c:if test="${not empty success}">
        <div id="alertMessage" class="alert alert-success alert-dismissible fade show" role="alert">
            ${success}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <!-- Error message -->
    <c:if test="${not empty error}">
        <div id="alertMessage" class="alert alert-danger alert-dismissible fade show" role="alert">
            ${error}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <script>
        // Auto hide alert after 3 seconds
        setTimeout(function() {
            let alertBox = document.getElementById("alertMessage");
            if (alertBox) {
                let bsAlert = new bootstrap.Alert(alertBox);
                bsAlert.close();
            }
        }, 3000); // 3 seconds
    </script>

    <div class="text-end">
        <ol class="breadcrumb m-0 py-0">
            <li class="breadcrumb-item"><a href="javascript: void(0);">Admin Panel</a></li>
            <li class="breadcrumb-item"><a href="javascript: void(0);">Leave Management</a></li>
            <li class="breadcrumb-item active">All Requests</li>
        </ol>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <div class="card">
            <!-- Card Header -->
            <div class="card-header border-bottom border-light">
                <div class="row justify-content-between g-3">
                    <div class="col-lg-6">
                        <div class="row g-3">
                            <!-- Search -->
                            <div class="col-lg-4">
                                <div class="position-relative">
                                    <input type="text" class="form-control ps-4" placeholder="Search by Tenant" id="searchInput">
                                    <i class="ti ti-search position-absolute top-50 translate-middle-y ms-2"></i>
                                </div>
                            </div>

                            <!-- Status Filter -->
                            <div class="col-lg-4">
                                <form action="${pageContext.request.contextPath}/filterLeaves" method="get" id="statusForm">
                                    <div class="flex-grow-1 d-flex align-items-center">
                                        <label for="status-select" class="me-2">Status</label>
                                        <div class="flex-grow-1">
                                            <select class="form-select my-1 my-md-0" name="status"
                                                onchange="document.getElementById('statusForm').submit();" id="status-select">
                                                <option>Select</option>
                                                <option value="PENDING" ${param.status == 'PENDING' ? 'selected' : ''}>Pending</option>
                                                <option value="APPROVED" ${param.status == 'APPROVED' ? 'selected' : ''}>Approved</option>
                                                <option value="REJECTED" ${param.status == 'REJECTED' ? 'selected' : ''}>Rejected</option>
                                            </select>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <!-- Date Range Filter -->
                            <div class="col-lg-4">
                                <div class="input-group">
                                    <input type="text" class="form-control" data-provider="flatpickr" data-deafult-date="01 Sep to 30 Sep"
                                        data-date-format="d M" data-range-date="true">
                                    <span class="input-group-text bg-primary border-primary text-white">
                                        <i class="ti ti-calendar fs-15"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Right side buttons -->
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

            <!-- Leave Table -->
            <div class="table-responsive">
                <table class="table table-nowrap mb-0" id="leaveTable">
                    <thead class="bg-light-subtle">
                        <tr>
                            <th>Leave ID</th>
                            <th>Tenant</th>
                            <th>Leave Type</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Destination</th>
                            <th>Reason</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="leave" items="${leaves}">
                            <tr>
                                <td>${leave.id}</td>
                                <td class="tenant-name">${leave.tenant.fullName}</td>
                                <td>${leave.type}</td>
                                <td>${leave.startDate}</td>
                                <td>${leave.endDate}</td>
                                <td>${leave.destination}</td>
                                <td>${leave.reason}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${leave.status == 'PENDING'}">
                                            <span class="badge bg-warning text-dark">Pending</span>
                                        </c:when>
                                        <c:when test="${leave.status == 'APPROVED'}">
                                            <span class="badge bg-success">Approved</span>
                                        </c:when>
                                        <c:when test="${leave.status == 'REJECTED'}">
                                            <span class="badge bg-danger">Rejected</span>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td>
                                    <form action="approveLeave/${leave.id}" method="get" style="display: inline;">
                                        <button type="submit" class="btn btn-success btn-sm">Approve</button>
                                    </form>
                                    <form action="rejectLeave/${leave.id}" method="get" style="display: inline;">
                                        <button type="submit" class="btn btn-danger btn-sm">Reject</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>

<!-- Search Script -->
<script>
    const searchInput = document.getElementById('searchInput');
    searchInput.addEventListener('keyup', function () {
        const filter = this.value.toLowerCase();
        const rows = document.querySelectorAll('#leaveTable tbody tr');

        rows.forEach(row => {
            const tenantName = row.querySelector('.tenant-name').textContent.toLowerCase();
            row.style.display = tenantName.includes(filter) ? '' : 'none';
        });
    });
</script>

<jsp:include page="../modules/footer.jsp"></jsp:include>
