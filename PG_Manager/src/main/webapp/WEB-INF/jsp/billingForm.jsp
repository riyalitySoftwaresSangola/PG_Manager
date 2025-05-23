<jsp:include page="modules/header.jsp"></jsp:include>

<div class="row">
    <div class="col-lg-12 p-5">
        <div class="card">
            <div class="card-header border-bottom border-dashed d-flex align-items-center">
                <h4 class="header-title">Generate Bill</h4>
            </div>

            <div class="card-body">
                <form action="generateBill" method="post" class="needs-validation" novalidate>

                    <!-- Select Customer -->
                    <div class="mb-3">
                        <label class="form-label" for="customerId">Customer</label>
                        <select class="form-select" id="customerId" name="customerId" required>
                            <option value="" disabled selected>Select a customer</option>
                            <%-- Example: dynamically populated --%>
                            <option value="1">John Doe</option>
                        </select>
                    </div>

                    <!-- Billing Month -->
                    <div class="mb-3">
                        <label class="form-label" for="billingMonth">Billing Month</label>
                        <input type="month" class="form-control" id="billingMonth" name="billingMonth" required>
                    </div>

                    <!-- Rent -->
                    <div class="mb-3">
                        <label class="form-label" for="rent">Rent</label>
                        <input type="number" class="form-control" id="rent" name="rent" readonly>
                    </div>

                    <!-- Meal Charges -->
                    <div class="mb-3">
                        <label class="form-label" for="mealCharges">Meal Charges</label>
                        <input type="number" class="form-control" id="mealCharges" name="mealCharges" value="0" required>
                    </div>

                    <!-- Electricity Charges -->
                    <div class="mb-3">
                        <label class="form-label" for="electricityCharges">Electricity Charges</label>
                        <input type="number" class="form-control" id="electricityCharges" name="electricityCharges" value="0" required>
                    </div>

                    <!-- Other Charges -->
                    <div class="mb-3">
                        <label class="form-label" for="otherCharges">Other Charges</label>
                        <input type="number" class="form-control" id="otherCharges" name="otherCharges" value="0">
                    </div>

                    <!-- Total Amount -->
                    <div class="mb-3">
                        <label class="form-label" for="totalAmount">Total Amount</label>
                        <input type="number" class="form-control" id="totalAmount" name="totalAmount" readonly>
                    </div>

                    <!-- Status -->
                     <div class="mb-3">
                      <label class="form-label" for="statusId">Status</label>
						 <select class="form-select no-init" id="statusId" name="status"  required >
						 <option value="" disabled selected>Select status</option>
                            <option value="Pending">Pending</option>
                            <option value="Paid">Paid</option>
                        </select>
                    </div> 

                    <!-- Generated Date -->
                    <div class="mb-3">
                        <label class="form-label" for="generatedDate">Generated Date</label>
                        <input type="text" class="form-control" id="generatedDate" name="generatedDate" readonly>
                    </div>

                    <button type="submit" class="btn btn-primary">Generate Bill</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // Set generated date to today
    document.getElementById("generatedDate").value = new Date().toISOString().split('T')[0];

    // Auto-calculate total
    function calculateTotal() {
        const rent = parseFloat(document.getElementById("rent").value || 0);
        const meal = parseFloat(document.getElementById("mealCharges").value || 0);
        const electricity = parseFloat(document.getElementById("electricityCharges").value || 0);
        const other = parseFloat(document.getElementById("otherCharges").value || 0);

        const total = rent + meal + electricity + other;
        document.getElementById("totalAmount").value = total;
    }

    document.getElementById("mealCharges").addEventListener("input", calculateTotal);
    document.getElementById("electricityCharges").addEventListener("input", calculateTotal);
    document.getElementById("otherCharges").addEventListener("input", calculateTotal);

    // Optional: Auto-load rent when customer selected
    document.getElementById("customerId").addEventListener("change", function () {
        const customerId = this.value;
        fetch(`/getRentByCustomerId?id=${customerId}`)
            .then(response => response.json())
            .then(data => {
                document.getElementById("rent").value = data.rent || 0;
                calculateTotal();
            });
    });
</script>

<jsp:include page="modules/footer.jsp"></jsp:include>
