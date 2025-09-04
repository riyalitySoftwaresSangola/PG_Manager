
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../modules/header.jsp"></jsp:include>

<div class="row">
    <div class="col-lg-12 p-5">
    
    	<div class="position-fixed top-0 my-5 end-0 p-3"
			style="z-index: 1100;">
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
    
        <div class="card">
            <div class="card-header border-bottom border-dashed d-flex align-items-center">
                <h4 class="header-title">Daily Meal Entry</h4>
            </div>

            <div class="card-body">
                <p class="text-muted">Enter daily meal details for a customer.</p>

                <form class="needs-validation" action="saveMealEntry" method="post" novalidate>

                    <!-- Select Customer -->
                    <div class="mb-3">
                        <label class="form-label" for="customerId">Select Customer</label>
                        <select class="form-select" id="customerId" name="customerId" required>
                          <option value="" disabled selected>Select a Tenant</option>
                             <c:forEach var="tenant" items="${tenants}">
                            <option value="${tenant.id}">${tenant.fullName}</option>
                        </c:forEach>
                        </select>
                        <div class="invalid-feedback">Please select a customer.</div>
                    </div>

                    <!-- Meal Date -->
                    <div class="mb-3">
                        <label class="form-label" for="mealDate">Meal Date</label>
                        <input type="date" class="form-control" id="mealDate" name="mealDate" required>
                        <div class="invalid-feedback">Please select a meal date.</div>
                    </div>

                    <!-- Meal Checkboxes -->
                    <div class="mb-3">
                        <label class="form-label d-block">Meals</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="breakfast" name="meals" value="Breakfast">
                            <label class="form-check-label" for="breakfast">Breakfast</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="lunch" name="meals" value="Lunch">
                            <label class="form-check-label" for="lunch">Lunch</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="dinner" name="meals" value="Dinner">
                            <label class="form-check-label" for="dinner">Dinner</label>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">Submit Entry</button>
                </form>
            </div>
        </div>
    </div>
</div>


<script>
 
  setTimeout(() => {
    let alerts = document.querySelectorAll('.alert');
    alerts.forEach(alert => {
      let bsAlert = new bootstrap.Alert(alert);
      bsAlert.close();
    });
  }, 3000); 
</script>

<jsp:include page="../modules/footer.jsp"></jsp:include>