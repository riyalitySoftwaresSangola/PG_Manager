<jsp:include page="modules/header.jsp"></jsp:include>

<div class="row">
    <div class="col-lg-12 p-5">
        <div class="card">
            <div class="card-header border-bottom border-dashed d-flex align-items-center">
                <h4 class="header-title">Complaint Submission</h4>
            </div>

            <div class="card-body">
                <form action="submitComplaint" method="post" class="needs-validation" novalidate>

                    <!-- Select Customer -->
                    <div class="mb-3">
                        <label class="form-label" for="customerId">Select Customer</label>
                        <select class="form-select" id="customerId" name="customerId" required>
                            <option value="" disabled selected>Select a customer</option>
                            <%-- Example: dynamically populate customer list --%>
                            <option value="1">John Doe</option>
                            <option value="2">Jane Smith</option>
                        </select>
                        <div class="invalid-feedback">Please select a customer.</div>
                    </div>

                    <!-- Subject -->
                    <div class="mb-3">
                        <label class="form-label" for="subject">Subject</label>
                        <input type="text" class="form-control" id="subject" name="subject" placeholder="Complaint subject" required>
                        <div class="invalid-feedback">Please enter the subject.</div>
                    </div>

                    <!-- Description -->
                    <div class="mb-3">
                        <label class="form-label" for="description">Description</label>
                        <textarea class="form-control" id="description" name="description" rows="4" placeholder="Describe the issue" required></textarea>
                        <div class="invalid-feedback">Please describe the complaint.</div>
                    </div>

                    <!-- Status -->
                  <div class="mb-3">
                       <label class="form-label" for="statusId">Status</label>
						 <select class="form-select no-init" id="statusId" name="status" required >
						   <option value="" disabled selected>Select status</option>
                            <option value="Open">Open</option>
                            <option value="In Progress">In Progress</option>
                            <option value="Resolved">Resolved</option>
                        </select>
                        <div class="invalid-feedback">Please select a status.</div>
                    </div> 

                    <!-- Raised Date (Auto-filled) -->
                    <div class="mb-3">
                        <label class="form-label" for="raisedDate">Raised Date</label>
                        <input type="date" class="form-control" id="raisedDate" name="raisedDate" readonly
                               value="<%= java.time.LocalDate.now() %>">
                    </div>

                    <!-- Resolved Date (Optional) -->
                    <div class="mb-3">
                        <label class="form-label" for="resolvedDate">Resolved Date (Optional)</label>
                        <input type="date" class="form-control" id="resolvedDate" name="resolvedDate">
                    </div>

                    <button type="submit" class="btn btn-primary">Submit Complaint</button>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="modules/footer.jsp"></jsp:include>
