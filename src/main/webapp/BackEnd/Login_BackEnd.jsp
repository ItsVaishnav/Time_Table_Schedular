<%@ page import="java.sql.*" %>
<%@ include file="/BackEnd/config.jsp" %>

<%
String role = request.getParameter("role");
String identifier = request.getParameter("identifier");
String password = request.getParameter("password");

System.out.println("Selected Role: " + role);
System.out.println("Identifier: " + identifier);
System.out.println("Password: " + password);

PreparedStatement pst = null;
ResultSet rs = null;

try {
    String sql = "SELECT * FROM users WHERE identifier = ? AND password = ? AND role = ?";
    pst = conn.prepareStatement(sql);
    pst.setString(1, identifier);
    pst.setString(2, password);
    pst.setString(3, role);

    rs = pst.executeQuery();

    if (rs.next()) {
        String dbRole = rs.getString("role").trim().toLowerCase();
        String dbName_pre = rs.getString("name").trim();
        String[] arr = dbName_pre.split(" ");
        String dbName = (arr.length > 1) ? arr[0] + arr[1] : dbName_pre;

        System.out.println("DB Role: " + dbRole);
        System.out.println("Session Name: " + dbName);

        session.setAttribute("user_role", dbRole);
        session.setAttribute("user_id", identifier);
        session.setAttribute("username", dbName);
        session.setAttribute("role", dbRole);

        if ("admin".equalsIgnoreCase(dbRole)) {
            response.sendRedirect("/TimeTable/Admin.jsp");
        } else if ("student".equals(dbRole)) {
            response.sendRedirect("/TimeTable/Student.jsp");
        } else if ("faculty".equals(dbRole)) {
            response.sendRedirect("/TimeTable/Faculty.jsp");
        } else {
%>
            <script>
                alert("Invalid Role!");
                window.history.back();
            </script>
<%
        }
    } else {
        System.out.println("No Matching User Found!");
%>
        <script>
            alert("Invalid ID or Password!");
            window.history.back();
        </script>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
%>
    <script>
        alert("Error: <%= e.getMessage().replace("\"", "\\\"") %>");
    </script>
<%
} finally {
    if (rs != null) try { rs.close(); } catch (Exception ignored) {}
    if (pst != null) try { pst.close(); } catch (Exception ignored) {}
    if (conn != null) try { conn.close(); } catch (Exception ignored) {}
}
%>
