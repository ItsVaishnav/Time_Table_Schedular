import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.*;

@WebServlet("/GenerateTimetableServlet2")
public class GenerateTimetableServlet2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[][]> timetableData = new HashMap<>();
        String[] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday"};
        int totalLectures = 6;

        // Dummy sample data for testing
        String[][] matrixA = new String[5][6];
        for (int i = 0; i < days.length; i++) {
            for (int j = 0; j < totalLectures; j++) {
                matrixA[i][j] = "Java/Mr. A";
            }
        }
        timetableData.put("Div-A", matrixA);

        // Set timetable data and forward to JSP
        request.setAttribute("timetableData", timetableData);
        RequestDispatcher dispatcher = request.getRequestDispatcher("timetable.jsp");
        dispatcher.forward(request, response);
    }
}
