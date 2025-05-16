 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../modules/userHeader.jsp"/>

<html>
<head>
    <title>My Event Registrations</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"/>
</head>
<body>



<%-- <jsp:include page="../modules/userHeader.jsp" /> --%>
<div class="container mt-5">
    <h2 class="text-center mb-4">My Event Registrations</h2>

    <table class="table table-bordered table-hover">
        <thead class="table-primary">
        <tr>
            <th>Registration ID</th>
            <th>Student Name</th>
            <th>Email</th>
            <th>Event Name</th>
            <th>Registered At</th>
            <th>Certificate</th>
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
                <td>
            <a href="/downloadCertificate/${reg.id}" 
               class="btn btn-success btn-sm" target="_blank">
                Download
            </a>
        </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="../modules/footer.jsp"/>
</body>
</html>
              
                

     