<%@ page import="java.sql.*" %>

<%
String[] subjectCodes = request.getParameterValues("subject_code[]");
String[] faculties = request.getParameterValues("faculty[]");

String className = "MCA 1";   // Can be dynamic
String division = "A";        // Can be dynamic

Connection conn = null;
PreparedStatement pst = null;

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "Vaishnav");

    String sql = "INSERT INTO assign_faculty (class, division, subject_code, faculty) VALUES (?, ?, ?, ?)";
    pst = conn.prepareStatement(sql);

    for (int i = 0; i < subjectCodes.length; i++) {
        pst.setString(1, className);
        pst.setString(2, division);
        pst.setString(3, subjectCodes[i]);
        pst.setString(4, faculties[i]);
        pst.executeUpdate();
    }
    out.println("<p>Faculty assigned successfully!</p>");
} catch(Exception e) {
    out.println("Error: " + e.getMessage());
} finally {
    if (pst != null) pst.close();
    if (conn != null) conn.close();
}
%>

<form action="assignFaculty.jsp" method="post">
  <table border="1">
    <tr>
      <th>SR NO</th>
      <th>SUBJECT CODE</th>
      <th>SUBJECT NAME</th>
      <th>CREDIT POINTS</th>
      <th>FACULTY</th>
    </tr>

    <%
      int sr = 1;
      Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "Vaishnav");
      Statement stmt = con.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT * FROM subjects");

      while(rs.next()) {
    %>
      <tr>
        <td><%= sr++ %></td>
        <td>
          <%= rs.getString("course_code") %>
          <input type="hidden" name="subject_code[]" value="<%= rs.getString("course_code") %>">
        </td>
        <td><%= rs.getString("course_title") %></td>
        <td><%= rs.getInt("cp") %></td>
        <td>
          <select name="faculty[]">
            <option value="Prof. A">Prof. A</option>
            <option value="Prof. B">Prof. B</option>
            <option value="Prof. C">Prof. C</option>
          </select>
        </td>
      </tr>
    <%
      }
      rs.close();
      stmt.close();
    %>
  </table>

  <br>
  <input type="submit" value="Assign Faculty">
</form>
