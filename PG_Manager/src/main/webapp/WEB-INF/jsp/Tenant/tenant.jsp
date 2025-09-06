<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />

<div class="row">
    <div class="col-lg-12 p-5">

        <!-- Alert container -->
        <div class="position-fixed top-0 my-5 end-0 p-3" style="z-index: 1100;">
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success alert-dismissible fade show shadow" role="alert">
                    ${successMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show shadow" role="alert">
                    ${errorMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
        </div>

        <div class="card">
            <div class="card-header border-bottom border-dashed d-flex align-items-center">
                <h4 class="header-title">Tenant Registration</h4>
            </div>

            <div class="card-body">
                <p class="text-muted">Please fill in the details below to register as a tenant.</p>

                <form class="needs-validation" action="userRegistration" method="post" enctype="multipart/form-data" novalidate>
                    
                    <!-- Full Name -->
                    <div class="mb-3">
                        <label class="form-label" for="fullName">Full Name</label>
                        <input type="text" class="form-control" name="fullName" id="fullName"
                               placeholder="Full name" required
                               pattern="^[A-Za-z\s]{3,50}$" minlength="3" maxlength="50"
                               title="Name should only contain letters and spaces (3–50 chars)">
                        <div class="invalid-feedback">Please enter a valid full name (only letters).</div>
                    </div>

                    <!-- Email -->
                    <div class="mb-3">
                        <label class="form-label" for="email">Email</label>
                        <input type="email" class="form-control" name="email" id="email"
                               placeholder="Email address" required
                               pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[A-Za-z]{2,}$"
                               title="Enter a valid email like example@mail.com">
                        <div class="invalid-feedback">Please enter a valid email address.</div>
                    </div>

                    <!-- Mobile Number -->
                    <div class="mb-3">
                        <label class="form-label" for="mobile">Mobile Number</label>
                        <input type="tel" class="form-control" name="mobile" id="mobile"
                               placeholder="10-digit mobile number" required
                               pattern="^[6-9]\d{9}$" minlength="10" maxlength="10"
                               title="Enter a valid 10-digit Indian mobile number">
                        <div class="invalid-feedback">Please enter a valid 10-digit mobile number.</div>
                    </div>

                    <!-- Gender -->
                    <div class="mb-3">
                        <label class="form-label d-block">Gender</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="male" value="Male" required>
                            <label class="form-check-label" for="male">Male</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="female" value="Female">
                            <label class="form-check-label" for="female">Female</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="other" value="Other">
                            <label class="form-check-label" for="other">Other</label>
                        </div>
                        <div class="invalid-feedback">Please select your gender.</div>
                    </div>

                    <!-- Aadhaar Number -->
                    <div class="mb-3">
                        <label class="form-label" for="aadhaar">Aadhaar Number</label>
                        <input type="text" class="form-control" name="aadhaar" id="aadhaar"
                               placeholder="12-digit Aadhaar Number" required
                               pattern="^\d{12}$" minlength="12" maxlength="12"
                               title="Enter a valid 12-digit Aadhaar number">
                        <div class="invalid-feedback">Please enter a valid 12-digit Aadhaar number.</div>
                    </div>

                    <!-- Emergency Contact -->
                    <div class="mb-3">
                        <label class="form-label" for="emergencyContact">Emergency Contact Number</label>
                        <input type="tel" class="form-control" name="emergencyContact" id="emergencyContact"
                               placeholder="10-digit contact number" required
                               pattern="^[6-9]\d{9}$" minlength="10" maxlength="10"
                               title="Enter a valid 10-digit Indian mobile number">
                        <div class="invalid-feedback">Please enter a valid emergency contact number.</div>
                    </div>

                    <!-- Check-in Date -->
                    <div class="mb-3">
                        <label class="form-label" for="checkInDate">Check-in Date</label>
                        <input type="date" name="checkInDate" class="form-control" required />
                        <div class="invalid-feedback">Please select a check-in date.</div>
                    </div>

                    <!-- Check-out Date -->
                    <div class="mb-3">
                        <label class="form-label" for="checkOutDate">Check-out Date (Optional)</label>
                        <input type="date" class="form-control" name="checkOutDate" id="checkOutDate">
                    </div>

                    <!-- Upload ID Proof -->
                    <div class="mb-3">
                        <label class="form-label" for="idProof">Upload ID Proof</label>
                        <input type="file" class="form-control" name="idProof" id="idProof"
                               accept=".pdf,.jpg,.jpeg,.png" required>
                        <div class="invalid-feedback">Please upload a valid ID proof (PDF/JPG/PNG, max 2MB).</div>
                    </div>

                    <!-- Status -->
                    <div class="mb-3">
                        <label class="form-label" for="statusId">Status</label>
                        <select class="form-select" id="statusId" name="status" required>
                            <option value="" disabled selected>Select status</option>
                            <option value="Active">Active</option>
                            <option value="Left">Left</option>
                        </select>
                        <div class="invalid-feedback">Please select a status.</div>
                    </div>

                    <!-- Terms -->
                    <div class="mb-3">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="termsCheck" required>
                            <label class="form-check-label form-label" for="termsCheck">
                                I agree to the terms and conditions
                            </label>
                            <div class="invalid-feedback">You must agree before submitting.</div>
                        </div>
                    </div>

                    <button class="btn btn-primary" type="submit">Register</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- ID Proof Preview -->
<c:if test="${not empty tenant.idProofPath}">
    <img src="/uploads/idProofs/${tenant.idProofPath}" alt="ID Proof" style="max-width:200px;"/>
</c:if>

<!-- Auto close alerts after 4 sec -->
<script>
    setTimeout(() => {
        document.querySelectorAll('.alert').forEach(alert => {
            if (bootstrap.Alert.getOrCreateInstance(alert)) {
                bootstrap.Alert.getInstance(alert).close();
            }
        });
    }, 4000);
</script>

<!-- Validation Script -->
<script>
(function () {
    'use strict';

    const forms = document.querySelectorAll('.needs-validation');
    if (!forms.length) return;

    const aadhaar = document.getElementById('aadhaar');
    const mobile = document.getElementById('mobile');
    const emergency = document.getElementById('emergencyContact');
    const idProof = document.getElementById('idProof');
    const checkIn = document.querySelector('input[name="checkInDate"]');
    const checkOut = document.getElementById('checkOutDate');
    const genderInputs = document.getElementsByName('gender');

    function clearOnInput(el) {
        if (!el) return;
        el.addEventListener('input', () => el.setCustomValidity(''));
        el.addEventListener('change', () => el.setCustomValidity(''));
    }
    [aadhaar, mobile, emergency, idProof, checkIn, checkOut].forEach(clearOnInput);
    Array.from(genderInputs).forEach(g => g.addEventListener('change', () => {
        genderInputs.forEach(i => i.setCustomValidity(''));
    }));

    Array.from(forms).forEach(form => {
        form.addEventListener('submit', function (event) {
            [aadhaar, mobile, emergency, idProof, checkOut].forEach(el => el && el.setCustomValidity(''));
            genderInputs.forEach(i => i.setCustomValidity(''));

            // Gender
            if (!Array.from(genderInputs).some(i => i.checked)) {
                genderInputs.forEach(i => i.setCustomValidity('Please select your gender.'));
            }

            // Aadhaar validation
            if (aadhaar && !/^\d{12}$/.test(aadhaar.value.trim())) {
                aadhaar.setCustomValidity('Aadhaar must be exactly 12 digits.');
            }

            // Mobile validation
            if (mobile && !/^[6-9]\d{9}$/.test(mobile.value.trim())) {
                mobile.setCustomValidity('Enter a valid 10-digit mobile number.');
            }

            // Emergency validation
            if (emergency && !/^[6-9]\d{9}$/.test(emergency.value.trim())) {
                emergency.setCustomValidity('Enter a valid 10-digit emergency contact.');
            }

            // File validation
            if (idProof && idProof.files.length > 0) {
                const file = idProof.files[0];
                const allowed = ['application/pdf', 'image/jpeg', 'image/png'];
                const maxSize = 2 * 1024 * 1024;
                if (!allowed.includes(file.type)) {
                    idProof.setCustomValidity('ID proof must be PDF, JPEG, or PNG.');
                } else if (file.size > maxSize) {
                    idProof.setCustomValidity('ID proof must be smaller than 2MB.');
                }
            } else if (idProof) {
                idProof.setCustomValidity('Please upload an ID proof.');
            }

            // Date check
            if (checkIn && checkOut && checkOut.value) {
                const dIn = new Date(checkIn.value);
                const dOut = new Date(checkOut.value);
                if (dOut < dIn) {
                    checkOut.setCustomValidity('Check-out must be same or after check-in date.');
                }
            }

            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    });
})();
</script>

<jsp:include page="../modules/footer.jsp"></jsp:include>
