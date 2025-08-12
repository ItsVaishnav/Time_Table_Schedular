import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;
import java.util.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/GenerateTimetableServlet")

public class GenerateTimetableServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String[] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
        String[] timeSlots = {
            "8:00am to 9:00am", "9:00am to 10:00am",
            "10:30am to 11:30am", "11:30am to 12:30pm",
            "1:15pm to 2:15pm", "2:15pm to 3:15pm"
        };

        Set<String> scheduledFaculty = new HashSet<>();
        Set<String> scheduledClass = new HashSet<>();

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "your_username", "your_password");

            // Clear existing timetable
            Statement clearStmt = con.createStatement();
            clearStmt.executeUpdate("DELETE FROM timetable");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM assign_faculty");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String className = rs.getString("AS_CLASS");
                String division = getDivisionFromClass(className);
                String courseCode = rs.getString("AS_COURSE_");
                String facultyCode = rs.getString("AS_FACULTY_CODE");
                int creditPoints = rs.getInt("AS_CP");
                int availableLectures = rs.getInt("AS_AVAILABLE_LEC");

                boolean assignedPreferred = false;

                // 1. Try assigning 3-credit subject in preferred slot
                if (creditPoints == 3) {
                    for (String day : days) {
                        String timeSlot = "8:00am to 9:00am";
                        String facultyKey = facultyCode + "|" + day + "|" + timeSlot;
                        String classKey = className + "|" + day + "|" + timeSlot;

                        if (!scheduledFaculty.contains(facultyKey) && !scheduledClass.contains(classKey)) {
                            insertLecture(con, className, division, day, timeSlot, courseCode, facultyCode);
                            scheduledFaculty.add(facultyKey);
                            scheduledClass.add(classKey);
                            availableLectures--;
                            assignedPreferred = true;
                            break;
                        }
                    }
                }

                // 2. Fill remaining lectures
                outer:
                for (String day : days) {
                    for (String timeSlot : timeSlots) {
                        if (availableLectures == 0) break outer;
                        if (timeSlot.equals("8:00am to 9:00am") && assignedPreferred) continue;

                        String facultyKey = facultyCode + "|" + day + "|" + timeSlot;
                        String classKey = className + "|" + day + "|" + timeSlot;

                        if (!scheduledFaculty.contains(facultyKey) && !scheduledClass.contains(classKey)) {
                            insertLecture(con, className, division, day, timeSlot, courseCode, facultyCode);
                            scheduledFaculty.add(facultyKey);
                            scheduledClass.add(classKey);
                            availableLectures--;
                        }
                    }
                }
            }

            con.close();
            response.getWriter().println("✅ Timetable generated successfully!");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("❌ Error: " + e.getMessage());
        }
    }

    private void insertLecture(Connection con, String className, String division, String day, String timeSlot, String courseCode, String facultyCode) throws SQLException {
        PreparedStatement insert = con.prepareStatement("INSERT INTO timetable (class_name, division, day_name, time_slot, course_code, faculty_code) VALUES (?, ?, ?, ?, ?, ?)");
        insert.setString(1, className);
        insert.setString(2, division);
        insert.setString(3, day);
        insert.setString(4, timeSlot);
        insert.setString(5, courseCode);
        insert.setString(6, facultyCode);
        insert.executeUpdate();
    }

    private String getDivisionFromClass(String className) {
        // Customize based on how your class names are structured
        if (className.contains("1")) return "D1";
        else return "D2";
    }
}
