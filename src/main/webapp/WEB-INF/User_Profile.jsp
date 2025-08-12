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
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <!-- Profile Sidebar -->
            <div class="col-md-4 text-center profile-card">
                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Avatar" class="avatar">
                <h3>John Doe</h3>
                <p>Full Stack Developer</p>
                <p>Bay Area, San Francisco, CA</p>
                <button class="btn btn-primary">Follow</button>
                <button class="btn btn-secondary">Message</button>
                <div class="social-links mt-3">
                    <a href="#"><i class="fab fa-github"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-facebook"></i></a>
                </div>
            </div>
            <!-- Profile Details -->
            <div class="col-md-8">
                <div class="profile-card">
                    <h4>Full Name: <span>Kenneth Valdez</span></h4>
                    <h4>Email: <span>fip@jukmuh.al</span></h4>
                    <h4>Phone: <span>(239) 816-9029</span></h4>
                    <h4>Mobile: <span>(320) 380-4539</span></h4>
                    <h4>Address: <span>Bay Area, San Francisco, CA</span></h4>
                </div>
                <div class="row mt-4">
                    <div class="col-md-6">
                        <div class="profile-card">
                            <h5>Project Status</h5>
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
                            <h5>Project Status</h5>
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
