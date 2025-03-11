<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <title>Mega City Cab</title>
</head>
<body>

    <!-- Include Navbar -->
    <jsp:include page="navbar.jsp" />

    <!-- Page Content Container -->
    <div class="container mt-4">
        <div id="pageContent">
            <jsp:include page="home.jsp" />
        </div>
    </div>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- jQuery AJAX Navigation -->
    <script>
        $(document).ready(function() {
            $(document).on("click", ".nav-link", function(e) {
                e.preventDefault();  // Prevent default link behavior
                
                let page = $(this).attr("href");  // Get target page (e.g., "about.jsp")

                // Load only content inside #content
                $("#pageContent").fadeOut(200, function() {
                    $("#pageContent").load(page + " #content", function() {
                        $("#pageContent").fadeIn(200);
                    });
                });

                // Update browser history (like React Router)
                window.history.pushState({ path: page }, "", page);
            });

            // Handle browser back/forward buttons
            window.onpopstate = function(event) {
                if (event.state) {
                    $("#pageContent").load(event.state.path + " #content");
                }
            };
        });
    </script>

</body>
</html>
