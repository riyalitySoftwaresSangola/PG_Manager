<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../modules/header.jsp" />

<div class="container mt-5">
	<div class="card">
		<div
			class="card-header d-flex justify-content-between align-items-center">
			<h3>All Bills</h3>
			<div>
				<a href="${pageContext.request.contextPath}/billingForm"
					class="btn btn-primary">+ Generate New Bill</a> <a
					href="${pageContext.request.contextPath}/bills/download-pdf"
					class="btn btn-danger">Download PDF</a>
			</div>
		</div>

		<div class="card-body">
			<c:if test="${not empty bills}">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>SR.no</th>
							<th>Tenant ID</th>
							<th>Billing Month</th>
							<th>Total</th>
							<th>Status</th>
							<th>Generated Date</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="bill" items="${bills}" varStatus="loop">
							<tr>
								<td>${bill.id}</td>
								<td>${bill.customerId}</td>
								<td class="billing-month">${bill.billingMonth}</td>
								<td>${bill.totalAmount}</td>
								<td><span
									class="badge ${bill.status == 'Paid' ? 'bg-success' : 'bg-warning'}">
										${bill.status} </span></td>
								<td>${bill.generatedDate}</td>
								<td class="pe-3">
									<div class="hstack gap-1 justify-content-center">
										<a
											href="${pageContext.request.contextPath}/bills/view-pdf?id=${bill.id}"
											class="btn btn-soft-primary btn-icon btn-sm rounded-circle">
											<i class="ti ti-eye"></i>
										</a>
										 <a
											href="${pageContext.request.contextPath}/bills/download-pdf?id=${bill.customerId}"
											class="btn btn-soft-success btn-icon btn-sm rounded-circle"
											title="Download Bill"> <i class="ti ti-download"></i>
										</a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>

			<c:if test="${empty bills}">
				<div class="alert alert-info">No bills available.</div>
			</c:if>
		</div>
	</div>
</div>

<!-- JS to convert "7-2025" to "July 2025" -->
<script>
  document.addEventListener("DOMContentLoaded", function () {
    console.log("Billing Month conversion script started");

    const monthNames = [
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];

    const billingCells = document.querySelectorAll(".billing-month");
    console.log("Billing month cells found:", billingCells.length);

    billingCells.forEach(cell => {
      const original = cell.textContent.trim();
      console.log("Original billing month:", original);

      if (original.includes("-")) {
        const [monthStr, year] = original.split("-");
        const monthIndex = parseInt(monthStr, 10);

        if (!isNaN(monthIndex) && monthIndex >= 1 && monthIndex <= 12) {
          cell.textContent = `${monthNames[monthIndex - 1]} ${year}`;
          console.log("Converted billing month:", cell.textContent);
        }
      }
    });
  });
</script>

<jsp:include page="../modules/footer.jsp" />
