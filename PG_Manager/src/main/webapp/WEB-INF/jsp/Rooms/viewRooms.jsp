<jsp:include page="../modules/header.jsp"></jsp:include>
<table class="table table-bordered">
    <thead class="table-dark">
        <tr>
            <th>Room No</th>
            <th>Room Type</th>
            <th>Rent</th>
            <th>AC</th>
            <th>Bathroom</th>
            <th>Status</th>
            <th>Beds</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="room" items="${rooms}">
            <tr>
                <td>${room.roomNumber}</td>
                <td>${room.roomType}</td>
                <td>${room.monthlyRent}</td>
                <td>${room.acAvailable ? 'Yes' : 'No'}</td>
                <td>${room.attachedBathroom ? 'Yes' : 'No'}</td>
                <td>${room.status}</td>
                <td>
                    <table class="table table-sm table-striped">
                        <thead>
                            <tr>
                                <th>Bed No</th>
                                <th>Type</th>
                                <th>Status</th>
                                <th>Tenant</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="bed" items="${room.beds}">
                                <tr>
                                    <td>${bed.bedNumber}</td>
                                    <td>${bed.bedType}</td>
                                    <td>${bed.status}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${bed.tenant != null}">
                                                ${bed.tenant.fullName} (${bed.tenant.mobile})
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-success">Available</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<jsp:include page="../modules/footer.jsp"></jsp:include>
