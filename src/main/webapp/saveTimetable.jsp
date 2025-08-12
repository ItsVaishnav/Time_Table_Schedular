<%@ page import="java.sql.*" %>
<%@ include file="/BackEnd/config.jsp" %>
<%
String matrixData = request.getParameter("matrixData");
String className = request.getParameter("cls");
String div = request.getParameter("div");
String sem = request.getParameter("sem");

if (matrixData != null && !matrixData.isEmpty()) {
    String[] rows = matrixData.split(";");
    
    try {  
        String insertSQL = "INSERT INTO Generated_Time_Table (CLASS, DAY_NUMBER, PERIOD_NUMBER, SUBJECT_CODE, PERIOD_LABEL, TIME_SLOT, SEMESTER, DIVISION, SUBJECT , FACULTY_CODE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(insertSQL);
        String select_faculty = "";
        String select_sub_code = "";
        ResultSet sscc = null;
        ResultSet ssff = null;
        PreparedStatement ssc = null;
        PreparedStatement ssf = null;
        for (int i = 0; i < rows.length; i++) {
            String[] cols = rows[i].split(",");
            for (int j = 0; j < cols.length; j++) {
                String[] parts = cols[j].split("\\|");

                // Skip invalid entries (less than 4 parts)
                if (parts.length < 4) {
                    out.println("<p>Skipping invalid data at row " + i + ", column " + j + ": " + cols[j] + "</p>");
                    continue;
                }

                String subject = parts[3];
                String periodLabel = parts[1];
                String timeSlot = parts[2];

                // 1. Get COURSE_CODE from subjects table using ACRONYM and SEMESTER
                select_sub_code = "SELECT COURSE_CODE FROM subjects WHERE ACRONYM = ? AND SEMESTER = ?";
                ssc = conn.prepareStatement(select_sub_code);
                ssc.setString(1, subject);
                ssc.setInt(2, Integer.parseInt(sem)); 
                sscc = ssc.executeQuery();

                String subjectCode = "";

                // Optional Debug: List column names returned
                ResultSetMetaData meta1 = sscc.getMetaData();
                for (int c = 1; c <= meta1.getColumnCount(); c++) {
                    out.println("subjects column: " + meta1.getColumnName(c) + "<br>");
                }

                while (sscc.next()) {
                    subjectCode = sscc.getString("COURSE_CODE");
                }

                // 2. Get faculty code from assign_faculty
                String faculty_code = "";
                select_sub_code = "SELECT AS_FACULTY_CODE FROM assign_faculty WHERE AS_SEM = ? AND AS_DIVISION = ? AND AS_COURSE_CODE = ?";
                ssf = conn.prepareStatement(select_sub_code);
                ssf.setString(1, sem);
                ssf.setString(2, div);
                ssf.setString(3, subjectCode);
                ssff = ssf.executeQuery();

                // Optional Debug: List column names returned
                ResultSetMetaData meta2 = ssff.getMetaData();
                for (int c = 1; c <= meta2.getColumnCount(); c++) {
                    out.println("assign_faculty column: " + meta2.getColumnName(c) + "<br>");
                }

                while (ssff.next()) {
                    faculty_code = ssff.getString("AS_FACULTY_CODE");
                }

                // 3. Insert into your final table
                ps.setString(1, className);       // CLASS
                ps.setInt(2, i);                  // DAY_NUMBER
                ps.setInt(3, j);                  // PERIOD_NUMBER
                ps.setString(4, subjectCode);     // SUBJECT_CODE
                ps.setString(5, periodLabel);     // PERIOD_LABEL
                ps.setString(6, timeSlot);        // TIME_SLOT
                ps.setString(7, sem);             // SEMESTER
                ps.setString(8, div);             // DIVISION
                ps.setString(9, subject);         // SUBJECT acronym
                ps.setString(10, faculty_code);   // FACULTY_CODE
                ps.addBatch();
            }
        }
        ps.executeBatch();
        ps.close();
        conn.close();

        out.println("<script>alert('Time Table with Time Slots Saved Successfully'); location='viewTimeTable.jsp?sem="+sem+"&div="+div+"&cls="+className+"';</script>");
    
    }catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() +"</p>");
        e.printStackTrace();
    }
} else {
    out.println("<p>No matrix data received</p>");
}
%>
