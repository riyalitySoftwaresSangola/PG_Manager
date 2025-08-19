<jsp:include page="../modules/header.jsp"></jsp:include>

<div class="row">
    <div class="col-lg-12 p-5">
        <div class="card">
            <div class="card-header border-bottom border-dashed d-flex align-items-center">
                <h4 class="header-title">Payment Entry</h4>
            </div>

            <div class="card-body">
                <form action="savePayment" method="post" class="needs-validation" novalidate>

                    <!-- Select Bill ID -->
                    <div class="mb-3">
                        <label class="form-label" for="billId">Select Bill ID</label>
                        <select class="form-select" id="billId" name="billId" required>
                            <option value="" disabled selected>Select a bill</option>
                            <%-- Example: dynamic bill list --%>
                            <option value="101">Bill #101 - John Doe - ₹5000</option>
                            <option value="102">Bill #102 - Jane Smith - ₹6200</option>
                        </select>
                        <div class="invalid-feedback">Please select a bill.</div>
                    </div>

                    <!-- Payment Date -->
                    <div class="mb-3">
                        <label class="form-label" for="paymentDate">Payment Date</label>
                        <input type="date" class="form-control" id="paymentDate" name="paymentDate" required>
                        <div class="invalid-feedback">Please select the payment date.</div>
                    </div>

                    <!-- Amount Paid -->
                    <div class="mb-3">
                        <label class="form-label" for="amountPaid">Amount Paid (₹)</label>
                        <input type="number" class="form-control" id="amountPaid" name="amountPaid" min="0" step="0.01" required>
                        <div class="invalid-feedback">Please enter the amount paid.</div>
                    </div>

                    <!-- Payment Mode -->
                    <div class="mb-3">
                        <label class="form-label" for="paymentMode">Payment Mode</label>
                        <select class="form-select" id="paymentMode" name="paymentMode" required>
                            <option value="" disabled selected>Select payment mode</option>
                            <option value="Cash">Cash</option>
                            <option value="UPI">UPI</option>
                            <option value="Bank Transfer">Bank Transfer</option>
                        </select>
                        <div class="invalid-feedback">Please select a payment mode.</div>
                    </div>

                    <!-- Transaction ID (Optional) -->
                    <div class="mb-3">
                        <label class="form-label" for="transactionId">Transaction ID (Optional)</label>
                        <input type="text" class="form-control" id="transactionId" name="transactionId" placeholder="Enter transaction/reference ID if applicable">
                    </div>

                    <button type="submit" class="btn btn-primary">Submit Payment</button>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../modules/footer.jsp"></jsp:include>
