<jsp:include page="modules/header.jsp"></jsp:include>

<div class="row">
    <div class="col-lg-12 p-5">
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
                            <option value="" disabled selected>Select a customer</option>
                            <%-- Example dynamic options --%>
                            <option value="101">John Doe</option>
                            <option value="102">Jane Smith</option>
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

<jsp:include page="modules/footer.jsp"></jsp:include>
