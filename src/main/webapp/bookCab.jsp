<%@page import="com.megacitycab.model.Places"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Ride</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</head>
<body>

    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />

    <div id="content">
        <header class="bg-primary text-white text-center py-5">
            <div class="container">
                <h1 class="fw-bold">Book Your Ride</h1>
                <p class="lead">Fast, Reliable & Safe Cab Service in Colombo</p>
            </div>
        </header>

        <section class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="card shadow-lg p-4">
                        <h2 class="text-center fw-bold">Book a Cab</h2>

                        <form action="BookCabServlet" method="POST">
                            <!-- Pickup Location Dropdown -->
                            <div class="mb-3">
                                <label for="pickupLocation" class="form-label">Pickup Location</label>
                                <select class="form-control" name="pickupLocation" id="pickupLocation" required>
                                    <option value="">Select Pickup Location</option>
                                    <c:forEach var="place" items="${placeList}">
                                        <option value="${places.placeName}">${places.placeName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <!-- Dropoff Location Dropdown -->
                            <div class="mb-3">
                                <label for="dropoffLocation" class="form-label">Drop-off Location</label>
                                <select class="form-control" name="dropoffLocation" id="dropoffLocation" required>
                                    <option value="">Select Dropoff Location</option>
                                    <c:forEach var="place" items="${placeList}">
                                        <option value="${places.placeName}">${places.placeName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="rideDate" class="form-label">Date</label>
                                <input type="date" class="form-control" id="rideDate" name="rideDate" required>
                            </div>

                            <div class="mb-3">
                                <label for="rideTime" class="form-label">Time</label>
                                <input type="time" class="form-control" id="rideTime" name="rideTime" required>
                            </div>

                            <div class="mb-3">
                                <label for="cabType" class="form-label">Cab Type</label>
                                <select class="form-select" id="cabType" name="cabType" required>
                                    <option value="Standard">Standard</option>
                                    <option value="Executive">Executive</option>
                                    <option value="Luxury">Luxury</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="distance" class="form-label">Distance</label>
                                <input type="text" class="form-control" id="distance" name="distance" required>
                            </div>

                            <div class="mb-3">
                                <label for="price" class="form-label">Estimated Fare</label>
                                <input type="text" class="form-control" id="price" name="price" readonly>
                            </div>

                            <div class="d-grid">
                                <button type="button" class="btn btn-secondary fw-bold" onclick="calculateDistance()">
                                    <i class="bi bi-cash"></i> Calculate Fare
                                </button>
                                <button type="submit" class="btn btn-primary fw-bold mt-2">
                                    <i class="bi bi-check-circle"></i> Confirm Booking
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="bg-dark text-white text-center py-3">
            <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
        </footer>

    </div>

</body>
</html>
