<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Ride</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <!-- Google Maps & Places API -->
    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_GOOGLE_MAPS_API_KEY&libraries=places"></script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=YAIzaSyDA7x0JbyxlBGGXvWSlQIM1w4R2XUznzM0&libraries=places&callback=initAutocomplete"></script>


    <script>
        function initAutocomplete() {
            var pickup = document.getElementById('pickupLocation');
            var dropoff = document.getElementById('dropoffLocation');

            new google.maps.places.Autocomplete(pickup);
            new google.maps.places.Autocomplete(dropoff);
        }

        function calculateDistance() {
            var origin = document.getElementById("pickupLocation").value;
            var destination = document.getElementById("dropoffLocation").value;
            var cabType = document.getElementById("cabType").value;

            if (origin === "" || destination === "") {
                alert("Please enter both pickup and drop-off locations.");
                return;
            }

            var service = new google.maps.DistanceMatrixService();
            service.getDistanceMatrix(
                {
                    origins: [origin],
                    destinations: [destination],
                    travelMode: 'DRIVING',
                },
                function (response, status) {
                    if (status === 'OK') {
                        var distanceText = response.rows[0].elements[0].distance.text; 
                        var distanceValue = response.rows[0].elements[0].distance.value / 1000; // Convert meters to km

                        document.getElementById("distance").value = distanceText;

                        // Pricing Logic
                        var baseFare = 100; // Base fare
                        var pricePerKm = cabType === "Luxury" ? 50 : cabType === "Executive" ? 35 : 25;
                        var totalFare = baseFare + (distanceValue * pricePerKm);

                        document.getElementById("price").value = "LKR " + totalFare.toFixed(2);
                    } else {
                        alert("Error calculating distance. Please try again.");
                    }
                }
            );
        }

        window.onload = initAutocomplete;
    </script>
</head>
<body>

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
                    <form action="confirmBooking.jsp" method="POST">
                        <div class="mb-3">
                            <label for="pickupLocation" class="form-label">Pickup Location</label>
                            <input type="text" class="form-control" id="pickupLocation" name="pickupLocation" required>
                        </div>
                        <div class="mb-3">
                            <label for="dropoffLocation" class="form-label">Drop-off Location</label>
                            <input type="text" class="form-control" id="dropoffLocation" name="dropoffLocation" required>
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
                            <select class="form-select" id="cabType" name="cabType" required onchange="calculateDistance()">
                                <option value="Standard">Standard</option>
                                <option value="Executive">Executive</option>
                                <option value="Luxury">Luxury</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="distance" class="form-label">Distance</label>
                            <input type="text" class="form-control" id="distance" name="distance" readonly>
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
    
    <!-- Ride Benefits -->
    <section class="container mt-5">
        <h2 class="text-center fw-bold">Why Ride With Us?</h2>
        <div class="row text-center mt-4">
            <div class="col-md-4">
                <i class="bi bi-shield-lock text-success" style="font-size: 3rem;"></i>
                <h4 class="mt-3">Safe & Secure</h4>
                <p>Verified drivers and real-time tracking.</p>
            </div>
            <div class="col-md-4">
                <i class="bi bi-wallet2 text-primary" style="font-size: 3rem;"></i>
                <h4 class="mt-3">Affordable Rates</h4>
                <p>Transparent pricing, no hidden fees.</p>
            </div>
            <div class="col-md-4">
                <i class="bi bi-clock-history text-danger" style="font-size: 3rem;"></i>
                <h4 class="mt-3">24/7 Availability</h4>
                <p>Book a ride anytime, anywhere in Colombo.</p>
            </div>
        </div>
    </section>

    <!-- How It Works -->
    <section class="bg-light py-5 mt-5">
        <div class="container text-center">
            <h2 class="fw-bold">How It Works</h2>
            <div class="row mt-4">
                <div class="col-md-4">
                    <i class="bi bi-phone text-primary" style="font-size: 3rem;"></i>
                    <h5>1. Book Online</h5>
                    <p>Select your pickup and drop-off location.</p>
                </div>
                <div class="col-md-4">
                    <i class="bi bi-car-front text-success" style="font-size: 3rem;"></i>
                    <h5>2. Get a Ride</h5>
                    <p>Our driver will arrive at your pickup location.</p>
                </div>
                <div class="col-md-4">
                    <i class="bi bi-credit-card text-danger" style="font-size: 3rem;"></i>
                    <h5>3. Pay & Go</h5>
                    <p>Secure online payment or cash on arrival.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action -->
    <section class="bg-primary text-white text-center py-5 mt-5">
        <div class="container">
            <h2 class="fw-bold">Book Now & Enjoy Your Ride</h2>
            <p>Experience the best cab service in Colombo.</p>
            <a href="home.jsp" class="btn btn-light text-primary btn-lg fw-bold">
                <i class="bi bi-house-door"></i> Back to Home
            </a>
        </div>
    </section>
    
    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3">
        <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
    </footer>

</div>

</body>
</html>
