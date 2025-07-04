

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <form method="get" action="viewMeal" class="mb-4 row g-2 align-items-end">
        <div class="col-auto">
            <label for="date" class="form-label">Select Date:</label>
            <input type="date" id="date" name="date" class="form-control"
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
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="../modules/footer.jsp" />
