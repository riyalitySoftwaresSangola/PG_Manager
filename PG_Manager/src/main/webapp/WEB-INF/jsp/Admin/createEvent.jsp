<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <title>Create Event</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
        }
        .card {
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        }
        .form-label {
            font-weight: 600;
        }
        .btn-primary {
            border-radius: 12px;
            padding: 10px 30px;
        }
    </style>
</head>
<body>

<jsp:include page="../modules/header.jsp" />

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-11">
            <div class="card p-4 bg-white">
                <h3 class="text-center mb-4 text-primary">Create New Event</h3>

                <!-- Alert messages -->
                <c:if test="${not empty message}">
                    <div class="alert alert-success">${message}</div>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger">${error}</div>
                </c:if>

                <!-- Form starts -->
                <form action="saveEvent" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <!-- Left side: Event details -->
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Event ID</label>
                                <input type="number" name="eventId" class="form-control" placeholder="Enter event ID" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Event Title</label>
                                <input type="text" name="title" class="form-control" placeholder="Enter event title" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Event Description</label>
                                <textarea name="description" class="form-control" rows="4" placeholder="Enter event description" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Event Date</label>
                                <input type="date" name="date" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Event Location</label>
                                <input type="text" name="location" class="form-control" placeholder="Enter event location" required>
                            </div>
                    </div>

                        <!-- Right side: Image upload -->
                        <div class="col-md-6">
                            <div class="card h-100">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Event Banner/Image</h5>
                                </div>
                                <div class="card-body">
                                    <div class="mb-3">
                                         <input type="file" name="file" class="form-control" required />
                                    </div>
                                    <p class="text-muted">Upload an image (e.g. poster or banner) for the event.</p>
                                </div>
                                <div class="card-footer text-end">
                                    <button type="submit" class="btn btn-primary">Create Event</button>
                                    <a href="#" class="btn btn-danger">Cancel</a>
                                </div>
                            </div>
                        </div>
                        
                        <div>
                        <img src="${pageContext.request.contextPath}/images/official_photo.jpg" alt="Uploaded Image" width="200"/>
                        
                        </div>
                        
                       <c:if test="${not empty image}">
                                     <h3>Event Image</h3>
                                 <img src="${pageContext.request.contextPath}/images/${image.imageUrl}" alt="Event Image" width="400"/>
                         </c:if>
                        
                    </div>
                </form>
                <!-- Form ends -->
            </div>
        </div>
    </div>
</div>

<footer class="bg-dark text-light text-center py-3 mt-5">
    &copy; 2025 College Event Management System
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<jsp:include page="../modules/footer.jsp"></jsp:include>
