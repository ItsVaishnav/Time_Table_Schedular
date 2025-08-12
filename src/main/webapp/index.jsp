<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>College Timetable Generator - Login</title>
  <link rel="stylesheet" href="Components/CSS/Index.css">
</head>
<body>
  <!-- Header with College Logo -->
  <header class="header">
    <img src="college-logo.png" alt="College Logo" class="logo">
  </header>

  <!-- Login Container -->
  <div class="login-container">
    <div class="welcome-text">
      <h1>Welcome Back!</h1>
      <p>Please log in to access your timetable.</p>
    </div>

    <!-- Role Selection Dropdown -->
    <div class="role-selection">
      <label for="role">Select Role:</label>
      <select id="role" name="role" onchange="changeForm()">
        <option value="Admin">Admin</option>
        <option value="student">Student</option>
        <option value="faculty">Faculty</option>
      </select>
    </div>

    <!-- Login Form -->
    <form id="login-form" action="/TimeTable/BackEnd/Login_BackEnd.jsp" method="post">
      <input type="hidden" id="hidden-role" name="role"> <!-- Hidden role input -->

      <!-- Common Login Form -->
      <div class="form-group">
        <input type="text" id="identifier" name="identifier" placeholder="Enter ID" required>
        <input type="password" id="password" name="password" placeholder="Password" required>
      </div>

      <!-- Forgot Password Link -->
      <div class="form-options">
        <a href="#" class="forgot-password">Forgot Password?</a>
      </div>

      <!-- Submit Button -->
      <button type="submit">Login</button>

      <!-- Sign Up Link -->
      <div class="signup-link">
        Don't have an account? <a href="register.jsp">Sign Up</a>
      </div>
    </form>
  </div>

  <script>
  function changeForm() {
	  const roleSelect = document.getElementById('role');
	  const hiddenRole = document.getElementById('hidden-role');
	  hiddenRole.value = roleSelect.value;
	  console.log("Selected Role:", roleSelect.value); // Debugging Log
	}


    // Initialize hidden role on page load
    window.onload = function() {
      changeForm();
    }
  </script>
</body>
</html>