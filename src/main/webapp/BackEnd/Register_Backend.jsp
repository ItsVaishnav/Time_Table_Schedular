<%@ page import="java.sql.*" %> <%@ page import="java.io.*" %> <%@ page
contentType="text/html" pageEncoding="UTF-8" %> <%@ include
file="/BackEnd/config.jsp" %> <% if
("POST".equalsIgnoreCase(request.getMethod())) { String role =
request.getParameter("role"); String identifier =
request.getParameter("identifier"); String name = request.getParameter("name");
String mobile = request.getParameter("mobile"); String email =
request.getParameter("email"); String password =
request.getParameter("password"); String repassword =
request.getParameter("repassword"); String course =
request.getParameter("course"); String year = request.getParameter("year");
String designation = request.getParameter("designation"); if
(!password.equals(repassword)) { out.println("
<script>
  alert("Passwords do not match!");
  window.history.back();
</script>
"); return; } try { PreparedStatement pst = conn.prepareStatement("INSERT INTO
users (identifier, role, name, mobile, email, password, course, year,
designation) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"); pst.setString(1, identifier);
pst.setString(2, role); pst.setString(3, name); pst.setString(4, mobile);
pst.setString(5, email); pst.setString(6, password); pst.setString(7, course);
pst.setString(8, year); pst.setString(9, designation); int rows =
pst.executeUpdate(); if (rows > 0) {
response.sendRedirect("/TimeTable/index.jsp"); } else { out.println("
<script>
  alert("Registration failed!");
  window.history.back();
</script>
"); } } catch (Exception e) { out.println("
<script>
  alert('Error: " + e.getMessage() + "');
  window.history.back();
</script>
"); } } %>
