<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../modules/header.jsp" />

<div class="container mt-4">
    <h2>Submit Complaint</h2>
    <form action="${pageContext.request.contextPath}/complaintSubmit" method="post">
        <div class="mb-3">
            <label for="tenantId">Tenant</label>
            <select name="tenantId" class="form-select" required>
                <option value="">-- Select Tenant --</option>
                <c:forEach var="tenant" items="${tenants}">
                    <option value="${tenant.id}">${tenant.fullName}</option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label for="type">Type</label>
            <select name="type" class="form-select" required>
                <option>Electricity</option>
                <option>Water</option>
                <option>Cleanliness</option>
                <option>Food</option>
                <option>Other</option>
            </select>
        </div>
        
<%--          <input type="text" name="subject" placeholder="Subject" value="${complaint.subject}" />  --%> 
 

        <div class="mb-3">
            <label for="description">Description</label>
            <textarea name="description" class="form-control" rows="4" required></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Submit Complaint</button>
    </form>
</div>

<jsp:include page="../modules/footer.jsp" />
