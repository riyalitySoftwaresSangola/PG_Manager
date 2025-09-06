<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../modules/header.jsp" />

<div class="container-fluid mt-4">
    <div class="page-title-head d-flex align-items-sm-center flex-sm-row flex-column gap-2 mb-3">
        <div class="flex-grow-1">
            <h4 class="fs-18 fw-semibold mb-0">All Complaints</h4>
        </div>
        <div class="text-end">
            <ol class="breadcrumb m-0 py-0">
                <li class="breadcrumb-item"><a href="#">Admin Panel</a></li>
                <li class="breadcrumb-item">Complaints & Leave</li>
                <li class="breadcrumb-item active">All Complaints</li>
            </ol>
        </div>
    </div>

    <!-- Filter Row -->
    <div class="card mb-4">
        <div class="card-header border-bottom border-light">
            <div class="row justify-content-between g-3">
                <div class="col-lg-6">
                    <div class="row g-3">
                        <div class="col-lg-4">
                            <div class="position-relative">
                                <input type="text" class="form-control ps-4" placeholder="Search Tenant" id="searchInput">
                                <i class="ti ti-search position-absolute top-50 translate-middle-y ms-2"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 text-md-end mt-3 mt-md-0">
                    <button type="button" class="btn btn-success me-1">
                        <i class="ti ti-settings me-1"></i> More Settings
                    </button>
                    <button type="button" class="btn btn-dark">
                        <i class="ti ti-filter me-1"></i> Filters
                    </button>
                </div>
            </div>
        </div>

        <!-- Complaint Table -->
        <div class="card-body">
            <c:if test="${empty complaints}">
                <div class="alert alert-info">No complaints found.</div>
            </c:if>

            <c:if test="${not empty complaints}">
                <div class="table-responsive">
                    <table class="table table-striped table-hover table-bordered" id="complaintTable">
                        <thead class="table-light">
                            <tr>
                                <th>ID</th>
                                <th>Tenant Name</th>
                                <th>Type</th>
                                <th>Description</th>
                                <th>Status</th>
                                <th>Date</th>
                                <th>Remark</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="complaint" items="${complaints}">
                                <tr>
                                    <td>${complaint.id}</td>
                                    <td class="tenant-name">${complaint.tenantName}</td>
                                    <td>${complaint.type}</td>
                                    <td>${complaint.description}</td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/update-status"
                                              method="post" class="d-flex flex-column"
                                              name="statusUpdateForm">
                                            <input type="hidden" name="complaintId" value="${complaint.id}" />
                                            <input type="hidden" name="remark" value="" />
                                            <select name="status"
                                                    class="form-select form-select-sm mb-2"
                                                    onchange="handleStatusChange(this)">
                                                <option value="Pending" ${complaint.status == 'Pending' ? 'selected' : ''}>Pending</option>
                                                <option value="In Progress" ${complaint.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                                                <option value="Resolved" ${complaint.status == 'Resolved' ? 'selected' : ''}>Resolved</option>
                                            </select>
                                        </form>
                                    </td>
                                    <td>${complaint.createdDate}</td>
                                    <td>
                                        <c:if test="${complaint.status != 'Pending'}">
                                            ${complaint.remark}
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    function handleStatusChange(selectElement) {
        const form = selectElement.form;
        const selectedStatus = selectElement.value;
        const remarkField = form.querySelector('input[name="remark"]');

        if (selectedStatus === 'Resolved' || selectedStatus === 'In Progress') {
            let message = selectedStatus === 'Resolved' ?
                "Please enter a resolution remark:" :
                "Please enter a remark for status: In Progress";

            Swal.fire({
                title: 'Enter Remark',
                text: message,
                input: 'text',
                inputPlaceholder: 'Type your remark here...',
                showCancelButton: true,
                confirmButtonText: 'Submit',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    const remark = result.value;
                    if (!remark || remark.trim() === '') {
                        Swal.fire('Error', 'Remark is required!', 'error');
                        selectElement.value = "Pending";
                    } else {
                        remarkField.value = remark.trim();
                        form.submit();
                    }
                } else {
                    selectElement.value = "Pending";
                }
            });
        } else {
            remarkField.value = '';
            form.submit();
        }
    }

    // Search complaints by Tenant Name
    document.getElementById('searchInput').addEventListener('keyup', function () {
        const searchValue = this.value.toLowerCase();
        const rows = document.querySelectorAll('#complaintTable tbody tr');

        rows.forEach(row => {
            const tenantText = row.querySelector('.tenant-name').textContent.toLowerCase();
            row.style.display = tenantText.includes(searchValue) ? '' : 'none';
        });
    });
</script>

<jsp:include page="../modules/footer.jsp" />
