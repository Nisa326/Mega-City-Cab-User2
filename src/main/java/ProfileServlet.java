
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/ProfileServlet"})
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

  private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int userId;
    
    // First, validate and parse the user ID
    try {
        userId = Integer.parseInt(request.getParameter("userId"));
    } catch (NumberFormatException e) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid user ID.");
        return;
    }

    // Retrieve form data
    String fullname = request.getParameter("fullname");
    String gender = request.getParameter("gender");
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Validate required fields
    if (fullname == null || email == null || username == null ||
        fullname.isEmpty() || email.isEmpty() || username.isEmpty()) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required fields.");
        return;
    }

    // Database update logic
    try (Connection conn = DBConnection.getConnection()) {
        String sql;
        
        if (password != null && !password.isEmpty()) {
            sql = "UPDATE users SET fullname=?, gender=?, address=?, email=?, phone=?, username=?, password=? WHERE id=?";
        } else {
            sql = "UPDATE users SET fullname=?, gender=?, address=?, email=?, phone=?, username=? WHERE id=?";
        }

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, fullname);
            stmt.setString(2, gender);
            stmt.setString(3, address);
            stmt.setString(4, email);
            stmt.setString(5, phone);
            stmt.setString(6, username);

            if (password != null && !password.isEmpty()) {
                stmt.setString(7, password); // Ideally, hash the password before storing
                stmt.setInt(8, userId);
            } else {
                stmt.setInt(7, userId);
            }

            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.sendRedirect("ManageUserServlet"); // Redirect after successful update
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "User update failed.");
            }
        }
    } catch (SQLException e) {
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        e.printStackTrace(); // Log error for debugging
    }
}

}
