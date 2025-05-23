<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registered Users</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
</head>
<body>

<jsp:include page="../modules/header.jsp"></jsp:include> 


<div class="container mt-5">
    <h2 class="mb-4">📋 All Event Registrations</h2>
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
    <td>${reg.userName}</td>
    <td>${reg.userEmail}</td>
    <td>${reg.eventTitle}</td>
    <td>${reg.registrationTime}</td>
</tr>

        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function() {
        var table = $('#userTable').DataTable({
        	
        	window.location.href = '/some-url?id=5';

            "paging": true,
            "searching": true,
            "lengthChange": false,
            "pageLength": 5
        });

        $('#searchInput').on('keyup', function () {
            table.search(this.value).draw();
        });
    });
</script>

<jsp:include page="../modules/footer.jsp" /> 

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
