import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet("/SignUp")
public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(SignUpServlet.class.getName());

     // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/cab_db";
    private static final String DB_USER = "root";  // Default user for WAMP
    private static final String DB_PASSWORD = "";  // Default password for WAMP (empty)

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullName = request.getParameter("fullname");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {

                // Insert query (OTP removed as it's not in the form)
                String sql = "INSERT INTO users (fullname, gender, address, email, phone, username, password) VALUES (?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, fullName);
                    stmt.setString(2, gender);
                    stmt.setString(3, address);
                    stmt.setString(4, email);
                    stmt.setString(5, phone);
                    stmt.setString(6, username);
                    stmt.setString(7, password);

                    int rowsInserted = stmt.executeUpdate();
                    if (rowsInserted > 0) {
                        // ✅ Show success popup and redirect
                        out.println("<script type='text/javascript'>");
                        out.println("alert('✅ Account created successfully!');");
                        out.println("window.location='index.jsp';");
                        out.println("</script>");
                    } else {
                        // ❌ Show failure popup and redirect
                        out.println("<script type='text/javascript'>");
                        out.println("alert('❌ Failed to create account!');");
                        out.println("window.location='signUp.jsp';");
                        out.println("</script>");
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "MySQL JDBC Driver not found", e);
            out.println("<script>alert('❌ Database driver not found!'); window.location='signUp.jsp';</script>");
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Database error", e);
            out.println("<script>alert('❌ Database error: " + e.getMessage() + "'); window.location='signUp.jsp';</script>");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Unexpected error", e);
            out.println("<script>alert('❌ Unexpected error occurred!'); window.location='signUp.jsp';</script>");
        }
    }
}
