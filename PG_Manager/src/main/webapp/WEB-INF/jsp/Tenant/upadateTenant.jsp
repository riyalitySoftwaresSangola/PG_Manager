<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp"></jsp:include>

<div class="row">
    <div class="col-lg-12 p-5">
        <div class="card">
            <div class="card-header border-bottom border-dashed d-flex align-items-center">
                <h4 class="header-title">Update Tenant</h4>
            </div>

            <!-- Success message -->
            <c:if test="${not empty successMessage}">
                <div style="color: green; font-weight: bold; margin-bottom: 10px;">
                    ${successMessage}
                </div>
            </c:if>

            <div class="card-body">
                <p class="text-muted">Please fill in the details below to update as a tenant.</p>
                
                <form class="needs-validation" action="update" method="post"
                      enctype="multipart/form-data" novalidate id="tenantForm">

                    <!-- Hidden ID -->
                    <input type="hidden" name="tenantId" value="${tenant.id}" />

                    <!-- Full Name -->
                    <div class="mb-3">
                        <label class="form-label" for="fullName">Full Name</label>
                        <input type="text" class="form-control" name="fullName" id="fullName"
                               value="${tenant.fullName}" required
                               pattern="^[A-Za-z\s]{3,50}$">
                        <div class="invalid-feedback js-invalid-feedback">Enter 3–50 characters (letters & spaces only).</div>
                    </div>

                    <!-- Email -->
                    <div class="mb-3">
                        <label class="form-label" for="email">Email</label>
                        <input type="email" class="form-control" name="email" id="email"
                               value="${tenant.email}" required
                               pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[A-Za-z]{2,}$">
                        <div class="invalid-feedback js-invalid-feedback">Enter a valid email (e.g., name@email.com).</div>
                    </div>

                    <!-- Mobile -->
                    <div class="mb-3">
                        <label class="form-label" for="mobile">Mobile Number</label>
                        <input type="tel" class="form-control" name="mobile" id="mobile"
                               value="${tenant.mobile}" required minlength="10" maxlength="10"
                               pattern="^[6-9][0-9]{9}$">
                        <div class="invalid-feedback js-invalid-feedback">Enter a valid 10-digit mobile number (starts 6–9).</div>
                    </div>

                    <!-- Gender -->
                    <div class="mb-3">
                        <label class="form-label d-block">Gender</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="male" value="Male"
                                   ${tenant.gender == 'Male' ? 'checked' : ''}>
                            <label class="form-check-label" for="male">Male</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="female" value="Female"
                                   ${tenant.gender == 'Female' ? 'checked' : ''}>
                            <label class="form-check-label" for="female">Female</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="other" value="Other"
                                   ${tenant.gender == 'Other' ? 'checked' : ''}>
                            <label class="form-check-label" for="other">Other</label>
                        </div>
                        <div class="invalid-feedback js-invalid-feedback">Please select gender.</div>
                    </div>

                    <!-- Aadhaar Number -->
                    <div class="mb-3">
                        <label class="form-label" for="aadhaar">Aadhaar Number</label>
                        <input type="text" class="form-control" name="aadhaar" id="aadhaar"
                               value="${tenant.aadhaar}" required minlength="10" maxlength="12"
                               pattern="^[2-9][0-9]{11}$">
                        <div class="invalid-feedback js-invalid-feedback">Enter valid 12-digit Aadhaar (cannot start with 0/1).</div>
                    </div>

                    <!-- Emergency Contact -->
                    <div class="mb-3">
                        <label class="form-label" for="emergencyContact">Emergency Contact Number</label>
                        <input type="tel" class="form-control" name="emergencyContact" id="emergencyContact"
                               value="${tenant.emergencyContact}" required minlength="10" maxlength="10"
                               pattern="^[6-9][0-9]{9}$">
                        <div class="invalid-feedback js-invalid-feedback">Enter a valid 10-digit contact number.</div>
                    </div>

                    <!-- Check-in Date -->
                    <div class="mb-3">
                        <label class="form-label" for="checkInDate">Check-in Date</label>
                        <input type="date" name="checkInDate" id="checkInDate"
                               class="form-control" value="${tenant.checkInDate}" required />
                        <div class="invalid-feedback js-invalid-feedback">Please select a check-in date.</div>
                    </div>

                    <!-- Check-out Date -->
                    <div class="mb-3">
                        <label class="form-label" for="checkOutDate">Check-out Date (Optional)</label>
                        <input type="date" class="form-control" name="checkOutDate"
                               id="checkOutDate" value="${tenant.checkOutDate}">
                        <div class="invalid-feedback js-invalid-feedback"></div>
                    </div>

                    <!-- Upload ID Proof -->
                    <div class="mb-3">
                        <label class="form-label" for="idProof">Upload New ID Proof (optional)</label>
                        <input type="file" class="form-control" name="idProof" id="idProof"
                               accept=".pdf,.jpg,.jpeg,.png">
                        <div class="invalid-feedback js-invalid-feedback"></div>
                        <c:if test="${not empty tenant.idProofPath}">
                            <small>Current File: <a href="/uploads/idProofs/${tenant.idProofPath}" target="_blank">View</a></small>
                        </c:if>
                    </div>

                    <!-- Status -->
                    <div class="mb-3">
                        <label class="form-label" for="statusId">Status</label>
                        <select class="form-select" id="statusId" name="status" required>
                            <option value="">-- Select Status --</option>
                            <option value="Active" ${tenant.status == 'Active' ? 'selected' : ''}>Active</option>
                            <option value="Left" ${tenant.status == 'Left' ? 'selected' : ''}>Left</option>
                        </select>
                        <div class="invalid-feedback js-invalid-feedback">Please select a status.</div>
                    </div>

                    <!-- Terms -->
                    <div class="mb-3">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="termsCheck" checked disabled>
                            <label class="form-check-label form-label" for="termsCheck">I agree to the terms and conditions</label>
                        </div>
                    </div>

                    <button class="btn btn-primary" type="submit">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById("tenantForm").addEventListener("submit", function (event) {
    let isValid = true;

    // Clear previous JS error messages
    document.querySelectorAll('.js-invalid-feedback').forEach(div => div.textContent = '');

    // Full Name
    const fullName = document.getElementById("fullName");
    if (!/^[A-Za-z\s]{3,50}$/.test(fullName.value.trim())) {
        isValid = false;
        fullName.nextElementSibling.textContent = "Full Name must be 3–50 letters and spaces only.";
    }

    // Email
    const email = document.getElementById("email");
    if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[A-Za-z]{2,}$/.test(email.value.trim())) {
        isValid = false;
        email.nextElementSibling.textContent = "Enter a valid email (e.g., name@email.com).";
    }

    // Mobile
    const mobile = document.getElementById("mobile");
    if (!/^[6-9][0-9]{9}$/.test(mobile.value.trim())) {
        isValid = false;
        mobile.nextElementSibling.textContent = "Enter a valid 10-digit Mobile Number starting with 6–9.";
    }

    // Gender
    const gender = document.querySelector('input[name="gender"]:checked');
    const genderDiv = document.getElementById("male").closest('.mb-3').querySelector('.js-invalid-feedback');
    if (!gender) {
        isValid = false;
        genderDiv.textContent = "Please select Gender.";
    }

    // Aadhaar
    const aadhaar = document.getElementById("aadhaar");
    if (!/^[2-9][0-9]{11}$/.test(aadhaar.value.trim())) {
        isValid = false;
        aadhaar.nextElementSibling.textContent = "Enter valid 12-digit Aadhaar (cannot start with 0/1).";
    }

    // Emergency Contact
    const emergencyContact = document.getElementById("emergencyContact");
    if (!/^[6-9][0-9]{9}$/.test(emergencyContact.value.trim())) {
        isValid = false;
        emergencyContact.nextElementSibling.textContent = "Enter a valid 10-digit Emergency Contact Number.";
    }

    // Check-in Date
    const checkIn = document.getElementById("checkInDate");
    if (!checkIn.value) {
        isValid = false;
        checkIn.nextElementSibling.textContent = "Please select Check-in Date.";
    }

    // Check-out Date
    const checkOut = document.getElementById("checkOutDate");
    if (checkIn.value && checkOut.value && (new Date(checkOut.value) < new Date(checkIn.value))) {
        isValid = false;
        checkOut.nextElementSibling.textContent = "Check-out date cannot be earlier than Check-in date.";
    }

    // ID Proof (optional)
    const idProof = document.getElementById("idProof");
    if (idProof.value) {
        const allowedExtensions = /(\.pdf|\.jpg|\.jpeg|\.png)$/i;
        if (!allowedExtensions.exec(idProof.value)) {
            isValid = false;
            idProof.nextElementSibling.textContent = "Upload valid ID Proof (PDF, JPG, JPEG, PNG only).";
        }
    }

    // Status
    const status = document.getElementById("statusId");
    if (!status.value) {
        isValid = false;
        status.nextElementSibling.textContent = "Please select Status.";
    }

    if (!isValid) {
        event.preventDefault();
        event.stopPropagation();
    }

    this.classList.add('was-validated');
});
</script>

<jsp:include page="../modules/footer.jsp"></jsp:include>
