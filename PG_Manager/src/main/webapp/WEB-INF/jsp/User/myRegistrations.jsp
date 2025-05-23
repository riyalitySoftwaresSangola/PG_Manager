<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../modules/userHeader.jsp" />

<html>
<head>
    <title>Students Registered for Event</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h2 class="mb-4 text-center">All Event Registrations</h2>
    <table class="table table-bordered table-hover">
        <thead class="table-primary">
        <tr>
            <th>Registration ID</th>
            <th>Student Name</th>
            <th>Email</th>
            <th>Event Name</th>
            <th>Registered At</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="reg" items="${registrations}">
            <tr>
                <td>${reg.id}</td>
                <td>${reg.username}</td>
                <td>${reg.email}</td>
                <td>${reg.eventTitle}</td>
                <td>${reg.registrationTime}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>

<jsp:include page="../modules/footer.jsp" />
