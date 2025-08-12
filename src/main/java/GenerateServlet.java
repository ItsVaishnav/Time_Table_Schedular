
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/GenerateServlet")
public class GenerateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String[] subjectCodes = request.getParameterValues("subject_code[]");
        String[] creditPoints = request.getParameterValues("credit_points[]");
        String[] faculties = request.getParameterValues("faculty[]");
        int[] transformedCredits = new int[creditPoints.length];

        for (int i = 0; i < creditPoints.length; i++) {
            int credit = Integer.parseInt(creditPoints[i]);

            if (credit == 3) {
                transformedCredits[i] = 4;
            } else if (credit == 2) {
                transformedCredits[i] = 3;
            } else if (credit == 1) {
                transformedCredits[i] = 1;
            } else if (credit == 6) {
                transformedCredits[i] = 1;
            } else {
                transformedCredits[i] = 0;
            }
        }

        String dep = request.getParameter("department");
        String classs = request.getParameter("classs");
        String semester = request.getParameter("semester");
        String division = request.getParameter("division");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DBConnection.getConnection();

            String sql = "INSERT INTO assign_faculty (as_sem , as_class , as_course_code , as_cp , as_faculty_code , as_available_lec ,as_division ) VALUES (?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);

            for (int i1 = 0; i1 < subjectCodes.length; i1++) {
                if (!faculties[i1].equalsIgnoreCase("Select Faculty")) {
                    ps.setString(1, semester);
                    ps.setString(2, classs);
                    ps.setString(3, subjectCodes[i1]);
                    ps.setString(4, creditPoints[i1]);
                    ps.setString(5, faculties[i1]);
                    ps.setInt(6, transformedCredits[i1]);
                    ps.setString(7, division);
                    ps.addBatch();
                }
            }

            ps.executeBatch();

            response.sendRedirect("GenerateTimeTable.jsp?dep=" + dep + "&cls=" + classs + "&sem=" + semester + "&div=" + division);
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
