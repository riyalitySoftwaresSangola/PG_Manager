
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../modules/userHeader.jsp" />

<div class="row">
    <div class="col-lg-12 p-5">
        <div class="card">
            <div class="card-header border-bottom border-dashed d-flex align-items-center">
                <h4 class="header-title">Event Registration</h4>
            </div>

            <div class="card-body">
                <p class="text-muted">Fill in the details below to register for the event.</p>
                
                <form class="needs-validation" action="registerEvent" method="post" novalidate>
                    <div class="mb-3">
                        <label class="form-label" for="name">Full Name</label>
                        <input type="text" class="form-control" name="name" id="name" placeholder="Your full name" required>
                        <div class="invalid-feedback">Please enter your name.</div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="email">Email</label>
                        <input type="email" class="form-control" name="email" id="email" placeholder="Email address" required>
                        <div class="invalid-feedback">Please enter a valid email address.</div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="phone">Phone Number</label>
                        <input type="tel" class="form-control" name="phone" id="phone" placeholder="Phone number" required>
                        <div class="invalid-feedback">Please enter a valid phone number.</div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="eventId">Select Event</label>
                        <select class="form-select" name="eventId" id="eventId" required>
                            <option value="">-- Choose an Event --</option>
                            <c:forEach var="event" items="${availableEvents}">
                                <option value="${event.id}">${event.title}</option>
                            </c:forEach>
                        </select>
                        <div class="invalid-feedback">Please select an event.</div>
                    </div>
                       <input type="hidden" name="eventId" value="${event.id}" />

                    <div class="mb-3">
                        <label class="form-label" for="comments">Any Comments (optional)</label>
                        <textarea class="form-control" name="comments" id="comments" rows="3"></textarea>
                    </div>

                    <div class="mb-3">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="termsCheck" required>
                            <label class="form-check-label form-label" for="termsCheck">I agree to the terms and conditions</label>
                            <div class="invalid-feedback">You must agree before submitting.</div>
                        </div>
                    </div>

                    <button class="btn btn-success" type="submit">Register</button>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../modules/footer.jsp"></jsp:include>
