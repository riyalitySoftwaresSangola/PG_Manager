<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../modules/header.jsp" />

<div class="row">
    <div class="col-lg-12 p-5">
        <div class="card">
            <div class="card-header border-bottom border-dashed d-flex align-items-center">
                <h4 class="header-title">Bed Assignment</h4>
            </div>

            <div class="card-body">
                <form class="needs-validation" action="assignBed" method="post" novalidate>

                    <!-- Room Dropdown -->
                    <div class="mb-3">
                        <label class="form-label" for="roomId">Select Room</label>
                        <select class="form-select" id="roomId" name="roomId" required>
                            <option value="" disabled selected>Select a room</option>
                            <c:forEach var="room" items="${Rooms}">
                                <option value="${room.id}">${room.roomNumber}</option>
                            </c:forEach>
                        </select>
                        <div class="invalid-feedback">Please select a room.</div>
                    </div>

                    <!-- Bed Dropdown -->
                    <div class="mb-3">
                        <label class="form-label" for="bedNumber">Select Bed Number</label>
                        <select id="bedNumber" name="bedNumber" class="form-select" required>
                            <option value="" disabled selected>Select bed number</option>
                        </select>
                        <div class="invalid-feedback">Please select a bed number.</div>
                    </div>

                    <!-- Tenant Dropdown -->
                    <div class="mb-3">
                        <label class="form-label" for="tenantId">Assign to Customer</label>
                        <select class="form-select" id="tenantId" name="tenantId" required>
                            <option value="" disabled selected>Select a customer</option>
                            <c:forEach var="customer" items="${customers}">
                                <option value="${customer.id}">${customer.fullName}</option>
                            </c:forEach>
                        </select>
                        <div class="invalid-feedback">Please select a customer.</div>
                    </div>

                    <button class="btn btn-primary" type="submit">Assign Bed</button>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<c:if test="${not empty successMessage}">
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Success',
            text: '${successMessage}',
            confirmButtonColor: '#3085d6'
        });
    </script>
</c:if>

<c:if test="${not empty errorMessage}">
    <script>
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: '${errorMessage}',
            confirmButtonColor: '#d33'
        });
    </script>
</c:if>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const roomSelect = document.getElementById("roomId");
        const bedSelect = document.getElementById("bedNumber");
        const contextPath = "<%= request.getContextPath() %>";

        roomSelect.addEventListener("change", function () {
            const roomId = roomSelect.value;
            bedSelect.innerHTML = ""; // Clear existing options

            if (!roomId) {
                bedSelect.innerHTML = "<option disabled selected>Select bed number</option>";
                return;
            }

            const xhr = new XMLHttpRequest();
            xhr.open("GET", contextPath + "/getBedsByRoomId/" + roomId, true);
            xhr.setRequestHeader("Accept", "application/json");

            xhr.onload = function () {
                if (xhr.status === 200) {
                    const beds = JSON.parse(xhr.responseText);
                    let availableBeds = 0;

                    const defaultOption = document.createElement("option");
                    defaultOption.text = "Select bed number";
                    defaultOption.disabled = true;
                    defaultOption.selected = true;
                    bedSelect.appendChild(defaultOption);

                    beds.forEach(function (bed) {
                    	console.log(bed);
                        const id = bed.bedId || bed.id;
                        const number = bed.bedNumber || bed.number;
                        const type = bed.bedType || bed.type;
                        const status = (bed.status || "").toLowerCase();

                        if (status !== "occupied") {
                            const option = document.createElement("option");
                            option.value = bed.bedId;
                            option.text = `Bed \${bed.bedNumber} (\${bed.status})`;
                            bedSelect.appendChild(option);
                            availableBeds++;
                        }
                    });

                    if (availableBeds === 0) {
                        const noBed = document.createElement("option");
                        noBed.text = "No available beds";
                        noBed.disabled = true;
                        bedSelect.appendChild(noBed);
                    }
                } else {
                    console.error("Failed to load beds:", xhr.statusText);
                    alert("❌ Failed to fetch beds. Please try again.");
                }
            };

            xhr.onerror = function () {
                console.error("AJAX request error.");
                alert("❌ Network error. Please check your connection.");
            };

            xhr.send();
        });
    });
</script>

<jsp:include page="../modules/footer.jsp" />
