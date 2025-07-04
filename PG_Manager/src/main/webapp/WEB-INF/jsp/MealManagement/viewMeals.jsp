<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../modules/header.jsp" />

<div class="container mt-5">
    <h2 class="mb-4">Meal Records</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Tenant Name</th>
                <th>Date</th>
                <th>Breakfast</th>
                <th>Lunch</th>
                <th>Dinner</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="meal" items="${meals}">
                <tr>
                    <td>${meal.tenant.fullName}</td>
                    <td>${meal.mealDate}</td>
                    <td><c:if test="${meal.breakfast}">✔️</c:if></td>
                    <td><c:if test="${meal.lunch}">✔️</c:if></td>
                    <td><c:if test="${meal.dinner}">✔️</c:if></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="../modules/footer.jsp" />
