

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registration</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
  <style>

    body {
    font-family: Arial, sans-serif;
    background: linear-gradient(to right, #7DE2FC, #B9B6E5);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.registration-container {
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    width: 400px;
    text-align: center;
}

h1 {
    color: #0066FF;
    font-size: 24px;
    margin-bottom: 10px;
}

.input-group {
    display: flex;
    align-items: center;
    background: #f1f1f1;
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
}

.input-group i {
    margin-right: 10px;
    color: #333;
}

.input-group input,
.input-group select {
    border: none;
    background: none;
    outline: none;
    flex: 1;
    font-size: 16px;
}

button {
    background: #0066FF;
    color: white;
    border: none;
    padding: 12px;
    width: 100%;
    font-size: 18px;
    cursor: pointer;
    border-radius: 5px;
}

button:hover {
    background: #0052cc;
}

.terms {
    text-align: left;
    font-size: 14px;
    margin: 10px 0;
}

.terms input {
    margin-right: 5px;
}

a {
    color: #0066FF;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}
    
  </style>
</head>
<body>

  <div class="registration-container">
    <h1>Create Your Account!</h1>
   
    <form id="registration-form" action="/TimeTable/BackEnd/Register_Backend.jsp" method="post">
    
    
    
      <div class="input-group">
        <label for="role">Select Role:</label>
        <select id="role" name="role" onchange="changeForm()">
          <option value="Admin">Admin</option>
          <option value="student">Student</option>
          <option value="faculty">Faculty</option>
        </select>
      </div>

      <div class="input-group"><i class="fas fa-id-card"></i><input type="text" name="identifier" placeholder="Admin ID / Roll No / Faculty ID" required></div>
      <div class="input-group"><i class="fas fa-user"></i><input type="text" name="name" placeholder="Name" required></div>
      <div class="input-group"><i class="fas fa-phone"></i><input type="text" name="mobile" placeholder="Mobile Number" required></div>
      <div class="input-group"><i class="fas fa-envelope"></i><input type="email" name="email" placeholder="Email ID" required></div>
      <div class="input-group"><i class="fas fa-lock"></i><input type="password" name="password" placeholder="Password" required></div>
      <div class="input-group"><i class="fas fa-lock"></i><input type="password" name="repassword" placeholder="Re-enter Password" required></div>

      <div id="student-fields" style="display: none;">
        <div class="input-group"><i class="fas fa-book"></i><input type="text" name="course" placeholder="Course"></div>
        <div class="input-group"><i class="fas fa-calendar"></i><input type="text" name="year" placeholder="Course Year"></div>
      </div>

      <div id="faculty-fields" style="display: none;">
        <div class="input-group"><i class="fas fa-user-tie"></i>
          <select name="designation">
            <option value="">Select Designation</option>
            <option value="HOD">HOD</option>
            <option value="Professor">Professor</option>
            <option value="Assistant Professor">Assistant Professor</option>
          </select>
        </div>
      </div>

      <div class="terms"><input type="checkbox" name="terms" required> I accept the terms and conditions</div>
      <button type="submit" >Register</button>
    <div class="signup-link mt-2">
        Don't have an account? <a href="index.jsp">Login </a>
    </div>
    </form>	
  </div>

  <script>
    function changeForm() {
       // document.getElementById('admin-fields').style.display = (document.getElementById('role').value === 'student') ? 'block' : 'none';
       
      document.getElementById('student-fields').style.display = (document.getElementById('role').value === 'student') ? 'block' : 'none';
      document.getElementById('faculty-fields').style.display = (document.getElementById('role').value === 'faculty') ? 'block' : 'none';
    }
  </script>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
</body>
</html>
