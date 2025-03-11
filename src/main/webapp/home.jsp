<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="content">
    <header class="bg-primary text-white text-center py-5">
        <div class="container">
            <h1 class="fw-bold">Welcome to Mega City Cab</h1>
            <p class="lead">Book a cab in seconds, ride in comfort.</p>
            <a href="bookCab.jsp" class="btn btn-light btn-lg text-primary fw-bold">
                <i class="bi bi-car-front-fill"></i> Book a Ride
            </a>
        </div>
    </header>

    <!-- Features Section -->
    <section class="container mt-5">
        <div class="row text-center">
            <div class="col-md-4">
                <i class="bi bi-clock-history text-primary" style="font-size: 3rem;"></i>
                <h4 class="mt-3">24/7 Service</h4>
                <p>Book a ride anytime, anywhere in Colombo.</p>
            </div>
            <div class="col-md-4">
                <i class="bi bi-shield-lock text-success" style="font-size: 3rem;"></i>
                <h4 class="mt-3">Safe & Reliable</h4>
                <p>Verified drivers and secure payments.</p>
            </div>
            <div class="col-md-4">
                <i class="bi bi-geo-alt text-danger" style="font-size: 3rem;"></i>
                <h4 class="mt-3">Quick Pickup</h4>
                <p>Find a cab near you instantly.</p>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="container mt-5">
        <h2 class="text-center fw-bold">What Our Customers Say</h2>
        <div class="row text-center mt-4">
            <c:if test="${not empty testimonial1}">
                <div class="col-md-4">
                    <div class="card shadow-sm p-3">
                        <img src="${testimonial1['imageUrl']}" alt="${testimonial1['fullname']}" class="rounded-circle mx-auto d-block" style="width: 80px; height: 80px;">
                        <blockquote class="blockquote mt-3">
                            <p>“${testimonial1['comment']}”</p>
                            <footer class="blockquote-footer">${testimonial1['fullname']}</footer>
                        </blockquote>
                    </div>
                </div>
            </c:if>

            <c:if test="${not empty testimonial2}">
                <div class="col-md-4">
                    <div class="card shadow-sm p-3">
                        <img src="${testimonial2['imageUrl']}" alt="${testimonial2['fullname']}" class="rounded-circle mx-auto d-block" style="width: 80px; height: 80px;">
                        <blockquote class="blockquote mt-3">
                            <p>“${testimonial2['comment']}”</p>
                            <footer class="blockquote-footer">${testimonial2['fullname']}</footer>
                        </blockquote>
                    </div>
                </div>
            </c:if>

            <c:if test="${not empty testimonial3}">
                <div class="col-md-4">
                    <div class="card shadow-sm p-3">
                        <img src="${testimonial3['imageUrl']}" alt="${testimonial3['fullname']}" class="rounded-circle mx-auto d-block" style="width: 80px; height: 80px;">
                        <blockquote class="blockquote mt-3">
                            <p>“${testimonial3['comment']}”</p>
                            <footer class="blockquote-footer">${testimonial3['fullname']}</footer>
                        </blockquote>
                    </div>
                </div>
            </c:if>

            <c:if test="${empty testimonial1 && empty testimonial2 && empty testimonial3}">
                <p class="text-center text-danger">No testimonials available.</p>
            </c:if>
        </div>
    </section>

    <!-- Call to Action Section -->
    <section class="bg-primary text-white text-center py-5 mt-5">
        <div class="container">
            <h2 class="fw-bold">Ready to Ride?</h2>
            <p>Book your cab now and enjoy a comfortable journey.</p>
            <a href="bookCab.jsp" class="btn btn-light text-primary btn-lg fw-bold">
                <i class="bi bi-geo-alt"></i> Book Now
            </a>
        </div>
    </section>

    <!-- Footer Section -->
    <footer class="bg-dark text-white text-center py-3">
        <p>&copy; 2025 Mega City Cab. All Rights Reserved.</p>
    </footer>
</div>
