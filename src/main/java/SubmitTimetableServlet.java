import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/SubmitTimetableServlet")
public class SubmitTimetableServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	
    	
    	
        String[] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday"};
        int totalLectures = 6;

        int totalDivisions = Integer.parseInt(request.getParameter("totalDivisions"));

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "Vaishnav");

            String insertSQL = "INSERT INTO timetable2 (department, class, semester, division, day, lecture_number, subject, faculty) " +
                               "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement stmt = conn.prepareStatement(insertSQL);

            for (int d = 0; d < totalDivisions; d++) {
                String division = request.getParameter("division_" + d);

                for (int i = 0; i < days.length; i++) {
                    for (int j = 0; j < totalLectures; j++) {
                        String value = request.getParameter("data_" + d + "_" + i + "_" + j);
                        if (value != null && !value.trim().isEmpty()) {
                            String[] parts = value.split("/");
                            String subject = parts.length > 0 ? parts[0] : "";
                            String faculty = parts.length > 1 ? parts[1] : "";

                            stmt.setString(1, "MCA"); // Update accordingly
                            stmt.setString(2, "FY");  // Update accordingly
                            stmt.setString(3, "II");  // Update accordingly
                            stmt.setString(4, division);
                            stmt.setString(5, days[i]);
                            stmt.setInt(6, j + 1);
                            stmt.setString(7, subject);
                            stmt.setString(8, faculty);

                            stmt.addBatch();
                        }
                    }
                }
            }

            stmt.executeBatch();
            conn.close();

            response.sendRedirect("success.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }
}
