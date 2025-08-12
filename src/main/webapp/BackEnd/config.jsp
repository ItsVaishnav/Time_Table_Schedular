<%@ page import="java.sql.*" %>
<%
Connection conn = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/timetable", "root", "Vaishnav99");
} catch(Exception e) {
    out.println("<script>");
    out.println("alert('Database connection error: " + e.getMessage().replace("'", "\\'") + "');");
    out.println("</script>");
}
%>