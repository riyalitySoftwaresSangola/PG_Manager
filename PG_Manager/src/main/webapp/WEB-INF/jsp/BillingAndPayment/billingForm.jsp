<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../modules/header.jsp"></jsp:include>

<div class="row">
	<div class="col-lg-12 p-5">
		<div class="card">
			<div
				class="card-header border-bottom border-dashed d-flex align-items-center">
				<h4 class="header-title">Generate Bill</h4>
			</div>

			<div class="card-body">
				<form action="generateBill" method="post" class="needs-validation"
					novalidate>

					<!-- Select Tenant -->
					<div class="mb-3">
						<label for="customerId">Tenant</label> <select id="customerId"
							name="customerId" class="form-select" required>
							<option value="">Select a Tenant</option>
							<c:forEach var="customer" items="${tenants}">
								<option value="${customer.id}">${customer.fullName}</option>
							</c:forEach>
						</select>
					</div>

					<!-- Billing Month -->
					<div class="mb-3">
						<label class="form-label" for="billingMonth">Billing Month</label>
						<input type="month" class="form-control" id="billingMonth"
							name="billingMonth" required>
					</div>

					<!-- Rent -->
					<div class="mb-3">
						<label class="form-label" for="rent">Rent</label> <input
							type="number" class="form-control" id="rent" name="rent" readonly>
					</div>

					<!-- Meal Charges -->
					<div class="mb-3">
						<label class="form-label" for="mealCharges">Meal Charges</label> <input
							type="number" class="form-control" id="mealCharges"
							name="mealCharges" value="0" required>
					</div>

					<!-- Electricity Charges -->
					<div class="mb-3">
						<label class="form-label" for="electricityCharges">Electricity
							Charges</label> <input type="number" class="form-control"
							id="electricityCharges" name="electricityCharges" value="0"
							required>
					</div>

					<!-- Other Charges -->
					<div class="mb-3">
						<label class="form-label" for="otherCharges">Other Charges</label>
						<input type="number" class="form-control" id="otherCharges"
							name="otherCharges" value="0">
					</div>

					<!-- Total Amount -->
					<div class="mb-3">
						<label class="form-label" for="totalAmount">Total Amount</label> <input
							type="number" class="form-control" id="totalAmount"
							name="totalAmount" readonly>
					</div>

					<!-- Status -->
					<div class="mb-3">
						<label class="form-label" for="statusId">Status</label> <select
							class="form-select" id="statusId" name="status" required>
							<option value="" disabled selected>Select status</option>
							<option value="Pending">Pending</option>
							<option value="Paid">Paid</option>
						</select>
					</div>

					<!-- Generated Date -->
					<div class="mb-3">
						<label class="form-label" for="generatedDate">Generated
							Date</label> <input type="text" class="form-control" id="generatedDate"
							name="generatedDate" readonly>
					</div>

					<button type="submit" class="btn btn-primary">Generate
						Bill</button>
				</form>
			</div>
		</div>
	</div>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    document.getElementById("generatedDate").value = new Date().toISOString().split('T')[0];

    function calculateTotal() {
        const rent = parseFloat(document.getElementById("rent").value || 0);
        const meal = parseFloat(document.getElementById("mealCharges").value || 0);
        const electricity = parseFloat(document.getElementById("electricityCharges").value || 0);
        const other = parseFloat(document.getElementById("otherCharges").value || 0);
        document.getElementById("totalAmount").value = rent + meal + electricity + other;
    }

    
    document.getElementById("mealCharges").addEventListener("input", calculateTotal);
    document.getElementById("electricityCharges").addEventListener("input", calculateTotal);
    document.getElementById("otherCharges").addEventListener("input", calculateTotal);

    
    document.getElementById("customerId").addEventListener("change", function () {
        const customerId = this.value;
        if (!customerId) return;

        $.ajax({
            url: '${pageContext.request.contextPath}/getRentByCustomerId',
            method: 'GET',
            data: { id: customerId },
            success: function (data) {
                const rentValue = data.rent ?? 0;
                document.getElementById("rent").value = rentValue;
                calculateTotal();
            },
            error: function (xhr, status, error) {
                console.error("Error fetching rent:", error);
                document.getElementById("rent").value = 0;
                calculateTotal();
            }
        });
    });
</script>

<jsp:include page="../modules/footer.jsp"></jsp:include>
