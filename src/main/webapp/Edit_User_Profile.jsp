<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Settings</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f7f6;
        }
        .container {
            max-width: 1100px;
            margin: auto;
            padding: 20px;
        }
        .profile-card {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            margin-bottom: 10px;
        }
        .btn-save {
            background-color: #6a0dad;
            color: white;
            width: 100%;
        }
        .breadcrumb-container {
            background: #eceff1;
            padding: 10px 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="breadcrumb-container">
            <nav>
                <a href="Admin.jsp" class="text-primary">Home</a> / <a href="User_Profile.jsp" class="text-primary">User Profile</a> / User Profile Edit
            </nav>
        </div>
        <div class="row">
            <div class="col-md-3 text-center profile-card">
                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Avatar" class="avatar">
                <h4>Edogaru</h4>
                <p>edogaru@mail.com.my</p>
            </div>
            <div class="col-md-6">
                <div class="profile-card">
                    <h4>Profile Settings</h4>
                    <form action="/Zeal_TimeTable/src/main/webapp/Update_student.jsp" method="post">
                    
                        <div class="row">
                            <div class="col-md-6">
                                <label>Name</label>
                                <input type="text" class="form-control" placeholder="first name" name="fname">
                            </div>
                            <div class="col-md-6">
                                <label>Surname</label>
                                <input type="text" class="form-control" placeholder="surname" name="lname">
                            </div>
                        </div>
                        <label class="mt-2">Mobile Number</label>
                        <input type="text" class="form-control" placeholder="enter phone number" name="mobile">
                        <label class="mt-2">Address Line </label>
                        <input type="text" class="form-control" placeholder="enter address line 1" name="address">
                      
                     
                        <label class="mt-2">Email ID</label>
                        <input type="email" class="form-control" placeholder="enter email id" name="email">
                       
                      
                        <button type="submit" class="btn btn-save mt-3">Save Profile</button>
                    </form>
                </div>
            </div>
          
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>




