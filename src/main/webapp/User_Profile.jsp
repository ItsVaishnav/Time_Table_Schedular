<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            background-color: #f4f7f6;
        }
        .profile-container {
            max-width: 900px;
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
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 10px;
        }
        .social-links a {
            margin: 0 10px;
            color: #555;
            font-size: 18px;
        }
        .progress {
            height: 8px;
            border-radius: 4px;
        }
        .btn-follow {
            background-color: #007bff;
            color: white;
        }
        .btn-message {
            background-color: #6c757d;
            color: white;
        }
        .header {
            background: #e9ecef;
            padding: 10px 20px;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <div class="header mb-3">
            <span> <a href="Admin.jsp">Home</a> / User Profile</span>
        </div>
        <div class="row">
            <div class="col-md-4 text-center profile-card">
                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Avatar" class="avatar">
                <h3>John Doe</h3>
                <p>Full Stack Developer</p>
                <p>Bay Area, San Francisco, CA</p>
                <a href="Edit_User_Profile.jsp"><button class="btn btn-outline-primary px-4">Edit</button>
                </a>
                <div class="social-links mt-3">
                    <a href="#"><i class="fab fa-github"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-facebook"></i></a>
                </div>
            </div>
            <div class="col-md-8">
                <div class="profile-card">
                    <h5><strong>Full Name:</strong> Kenneth Valdez</h5>
                    <h5><strong>Email:</strong> fip@jukmuh.al</h5>
                    <h5><strong>Phone:</strong> (239) 816-9029</h5>
                    <h5><strong>Mobile:</strong> (320) 380-4539</h5>
                    <h5><strong>Address:</strong> Bay Area, San Francisco, CA</h5>
                </div>
                <div class="row mt-4">
                    <div class="col-md-6">
                        <div class="profile-card">
                            <h6><strong>Project Status</strong></h6>
                            <p>Web Design</p>
                            <div class="progress">
                                <div class="progress-bar bg-primary" style="width: 80%;"></div>
                            </div>
                            <p>Website Markup</p>
                            <div class="progress">
                                <div class="progress-bar bg-success" style="width: 60%;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-card">
                            <h6><strong>Project Status</strong></h6>
                            <p>One Page</p>
                            <div class="progress">
                                <div class="progress-bar bg-warning" style="width: 50%;"></div>
                            </div>
                            <p>Mobile Template</p>
                            <div class="progress">
                                <div class="progress-bar bg-danger" style="width: 90%;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
    