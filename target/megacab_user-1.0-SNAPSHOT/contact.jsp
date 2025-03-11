<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="com.megacitycab.model.User"%>

<div id="content">

    <!-- Hero Section -->
    <header class="bg-primary text-white text-center py-5">
        <div class="container">
            <h1 class="fw-bold">Contact Mega City Cab</h1>
            <p class="lead">We’re here to assist you 24/7.</p>
            <a href="home.jsp" class="btn btn-light btn-lg text-primary fw-bold">
                <i class="bi bi-arrow-left-circle"></i> Back to Home
            </a>
        </div>
    </header>

    <!-- Contact Details -->
    <section class="container mt-5">
        <div class="row text-center">
            <div class="col-md-4">
                <i class="bi bi-geo-alt text-danger" style="font-size: 3rem;"></i>
                <h4 class="mt-3">Our Address</h4>
                <p>123 Main Street, Colombo, Sri Lanka</p>
            </div>
            <div class="col-md-4">
                <i class="bi bi-telephone text-primary" style="font-size: 3rem;"></i>
                <h4 class="mt-3">Call Us</h4>
                <p>+94 77 123 4567</p>
            </div>
            <div class="col-md-4">
                <i class="bi bi-envelope text-success" style="font-size: 3rem;"></i>
                <h4 class="mt-3">Email Us</h4>
                <p>support@megacitycab.com</p>
            </div>
        </div>
    </section>
    
    <% String loggedInUser = (String) session.getAttribute("username"); %>
    <% if (loggedInUser != null) { %>
    
    <!-- Contact Form -->
    <section class="bg-light py-5 mt-5">
        <div class="container text-center">
            <h2 class="fw-bold">Send Us a Message</h2>
            <div class="row justify-content-center mt-4">
                <div class="col-md-6">
                    <form action="CommentServlet" method="post">
                        <div class="mb-3">
                            <label for="name" class="form-label">User Name</label>
                            <input type="name" class="form-control" id="name" name="name" value="<%= loggedInUser %>" required readonly>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Your Email</label>
                            <input type="email" class="form-control" id="email" name="email" required></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="message" class="form-label">Your Message</label>
                            <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="bi bi-send"></i> Send Message
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <% } else { %>
    
    <!-- Message for Unauthenticated Users -->
    <section class="text-center py-5">
        <h4 class="fw-bold">You need to sign in to send a message.</h4>
        <a href="#signInModal" class="btn btn-primary">Sign In</a>
    </section>
    <% } %>

    <!-- Google Map -->
    <section class="container text-center my-5">
        <h4 class="fw-bold">Find Us on the Map</h4>
        <iframe 
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.742525907021!2d79.86124357508728!3d6.919162593081983!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae2591c1b4f9b13%3A0xabcde1234567890!2sColombo%2C%20Sri%20Lanka!5e0!3m2!1sen!2s!4v1700000000000" 
            width="100%" height="350" style="border:0;" allowfullscreen="" loading="lazy">
        </iframe>
    </section>

    <!-- Call to Action -->
    <section class="bg-primary text-white text-center py-5 mt-5">
        <div class="container">
            <h2 class="fw-bold">Need Help?</h2>
            <p>Contact our support team for assistance.</p>
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
