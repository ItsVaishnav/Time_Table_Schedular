<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //session.invalidate(); // Destroys the session
    //response.sendRedirect("index.jsp"); // Redirect to login
%>

<%
    // Invalidate the session if it exists
    if (session != null) {
        session.invalidate();
    }

    // Set headers to prevent caching
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies

    // Redirect to login page
    response.sendRedirect("index.jsp");
%>
