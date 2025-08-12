<%@ page contentType="text/html; charset=UTF-8" language="java"%>

<%@ page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> Admin Profile </title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://cdn.tailwindcss.com"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="abc.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
.subtitle-heading {
	padding: 10px;
}

.subttle-container {
	border: 2px solid black;
	margin: 10px 5px;
	padding: 10px;
	width: 280px;
}

.flex-flex-flex {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 20px;
}

.sub-logo {
	width: 40px;
}

 /* Form Styles */
        .form-container {
            max-width: 800px;
            margin: 0 auto;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #4b5563;
        }
        .profile-card .text-center {
    		text-align: center; /* Center the text and image */
		}

		.avatar {
    		width: 100px;
    		height: 100px;
    		border-radius: 50%;
    		margin: 0 auto; /* Center the image */
		}
        
        .form-input {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #d1d5db;
            border-radius: 0.375rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }
        
        .form-input:focus {
            border-color: #3b82f6;
            outline: 0;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.25);
        }
        
        .form-submit {
            background-color: #3b82f6;
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 0.375rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.15s ease-in-out;
            width: 100%;
            margin-top: 1rem;
        }
        
        .form-submit:hover {
            background-color: #2563eb;
        }
        
        .form-row {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
        }
        
        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
            }
        }
        
        .form-title {
            color: #3b82f6;
            text-align: center;
            margin-bottom: 2rem;
            font-size: 1.5rem;
            font-weight: 600;
        }
        body {
            background-color: #f4f7f6;
            font-family: Arial, sans-serif;
            background: url('https://www.transparenttextures.com/patterns/cubes.png');
        }
        .profile-container {
            max-width: 960px;
            
            padding: 20px;
            margin: 10px auto;
        }
        .sidebar {
            animation: slideIn 0.5s ease-in-out;
            position: fixed;
            height : 100vh;
            background: linear-gradient(to bottom, #3b82f6 150px, white 150px);
        }
        .profile-card {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            margin-top: 10px;
        }
        .avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
        }
        .social-links a {
            margin: 0 8px;
            color: #555;
            font-size: 18px;
            transition: color 0.3s;
        }
        .social-links a:hover {
            color: #007bff;
        }
        .progress {
            height: 8px;
            border-radius: 4px;
        }
        .header {
            background-color: #e9ecef;
            padding: 12px 20px;
            border-radius: 8px;
            font-size: 14px;
            margin-bottom: 20px;
        }
        .btn-edit {
            padding: 6px 20px;
        }
        h5, h6 {
            margin-bottom: 10px;
        }
        .project-status p, .skills-section p, .certification-section p {
            margin-bottom: 6px;
            font-weight: 500;
        }
</style>
</head>
<body>

	<!-- Sidebar -->
	<div class="bg-white w-64 p-4 shadow-lg sidebar mt-4 ml-4 rounded-lg"
		id="sidebar">
		<div class="flex flex-col items-center space-y-2 p-2 mb-5">
			<img alt="User profile picture"
				class="w-16 h-16 rounded-full cursor-pointer"
				src="images/Profile.png" />
			<div class="relative">
				<button
					class="font-semibold text-lg focus:outline-none dropdown-toggle">
					ZEAL Scheduler <i class="fas fa-chevron-down ml-2"></i>
				</button>
				<ul class="dropdown-menu mt-2">
					<li class="p-2 hover:bg-gray-100"><i
						class="fas fa-user-circle mr-2 text-blue-500"></i> <a
						href="User_Profile.jsp" class="text-gray-700">View Profile</a></li>
					<li class="p-2 hover:bg-gray-100"><i
						class="fas fa-sign-out-alt mr-2 text-blue-500"></i> <a
						href="logout.jsp" class="text-gray-700">Logout</a></li>
				</ul>
			</div>
		</div>
		<nav>
			<ul>
				<!-- ADD Option -->
				<li>
						<button id="viewToggle"
							class="flex items-center p-2 text-gray-700 hover:bg-gray-100 rounded-lg w-full">
							<i class="fas fa-eye mr-2 text-blue-500"></i> View <i
								class="fas fa-chevron-down ml-auto text-gray-400"></i>
						</button>
					</li>
					<!-- Collapsible View Menu -->
					<div id="viewMenu" class="hidden ml-6 space-y-1">
						<li class="p-2 hover:bg-gray-100 rounded-lg"><a href="departmentInfo.jsp"
							class="text-gray-700"><i class="fa-solid fa-building-user" style="color: #3B82F6;"></i>  Department</a></li>
						<li class="p-2 hover:bg-gray-100 rounded-lg"><a href="#"
							class="text-gray-700"><i class="fa-solid fa-graduation-cap" style="color: #3B82F6;"></i>  Classes</a></li>
						<li class="p-2 hover:bg-gray-100 rounded-lg"><a href="#"
							class="text-gray-700"><i class="fa-solid fa-layer-group" style="color: #3B82F6;"></i>  Division</a></li>
						<li class="p-2 hover:bg-gray-100 rounded-lg"><a href="#"
							class="text-gray-700"><i class="fa-solid fa-person-chalkboard" style="color: #3B82F6;"></i> Faculty</a></li>
						<li class="p-2 hover:bg-gray-100 rounded-lg"><a href="#"
							class="text-gray-700"><i class="fa-solid fa-book-open-reader" style="color: #3B82F6;"></i> Subject</a></li>
						<li class="p-2 hover:bg-gray-100 rounded-lg"><a href="#"
							class="text-gray-700"><i class="fa-solid fa-calendar-days"  style="color: #3B82F6;"></i> Time Table</a></li>
					</div>
				<!-- Generate Time Table Option -->
				<li class="mb-2"><a
					class="flex items-center p-2 text-gray-700 hover:bg-gray-100 rounded-lg"
					href="Faculty.jsp"> <i
						class="fas fa-calendar-alt mr-2 text-blue-500"></i> Default Time
						Table
				</a></li>
				<li class="mb-2"><a
					class="flex items-center p-2 text-gray-700 hover:bg-gray-100 rounded-lg"
					href="AddSubject.jsp"> <i
						class="fas fa-calendar-alt mr-2 text-blue-500"></i> Add Subjects
				</a></li>
				<li class="mb-2"><a
					class="flex items-center p-2 text-gray-700 hover:bg-gray-100 rounded-lg"
					href="CLassTimeTable.jsp"> <i
						class="fas fa-calendar-alt mr-2 text-blue-500"></i> Class Time
						Table
				</a></li>
			</ul>
		</nav>
	</div>
	<!-- Main Content -->
	<div class="profile-container">
    
    <!-- Breadcrumb Header -->
    <div class="header">
        <a href="Admin.jsp" class="text-decoration-none">Home</a> / <span class="text-muted">Admin Profile</span>
    </div>

    <div class="row g-4">
        <!-- Left Profile Info -->
        <div class="col-md-4 d-flex align-items-stretch">
            <div class="profile-card w-100">
                <div class="text-center">
                    <img src="https://lms.project-bsafe.eu/wp-content/uploads/2018/05/avatar-369-456321.png" alt="User Avatar" class="avatar mb-3">
                    <h4 class="mb-1">Dr. Rupali Kalekar</h4>
                    <p class="text-muted mb-1">Associate Professor</p>
                    <p class="text-muted">Narhe, Pune-411046</p>
                    <a href="Edit_User_Profile.jsp">
                        <button class="btn btn-outline-primary btn-edit mt-2">Edit</button>
                    </a>
                    <div class="social-links mt-3">
                        <a href="#"><i class="fab fa-github"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-facebook"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Side: Details, Project Status, Languages & Certifications -->
        <div class="col-md-8">
            <!-- User Info -->
            <div class="profile-card mb-4">
                <h5><strong>Full Name:</strong> Dr. Rupali Kalekar</h5>
                <h5><strong>Email:</strong> repali.kalekar@gmail.com</h5>
                <h5><strong>Mobile:</strong> 9922497957</h5>
                <h5><strong>Address:</strong> Narhe, Pune-411046</h5>
            </div>

            <div class="row g-3">
                <!-- Project Status -->
                <div class="col-md-6">
                    <div class="profile-card project-status">
                        <h6>Languages Known</h6>
                        <p>FrontEnd Languages</p>
                        <div class="progress mb-3">
                            <div class="progress-bar bg-primary" style="width: 60%;"></div>
                        </div>
                        <p>Backend Languages</p>
                        <div class="progress">
                            <div class="progress-bar bg-success" style="width: 90%;"></div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="profile-card project-status">
                        <h6>Expert In</h6>
                        <p>One Page Applications</p>
                        <div class="progress mb-3">
                            <div class="progress-bar bg-warning" style="width: 90%;"></div>
                        </div>
                        <p>Mobile Template</p>
                        <div class="progress">
                            <div class="progress-bar bg-danger" style="width: 70%;"></div>
                        </div>
                    </div>
                </div>

                <!-- Language Skills -->
                <div class="col-md-6">
                    <div class="profile-card skills-section">
                        <h6>Teaching Subjects</h6>
                        <p>Java</p>
                        <div class="progress mb-3">
                            <div class="progress-bar bg-info" style="width: 85%;"></div>
                        </div>
                        <p>Python</p>
                        <div class="progress mb-3">
                            <div class="progress-bar bg-secondary" style="width: 70%;"></div>
                        </div>
                        <p>JavaScript</p>
                        <div class="progress mb-3">
                            <div class="progress-bar bg-success" style="width: 75%;"></div>
                        </div>
                    </div>
                </div>

                <!-- Certifications -->
                <div class="col-md-6">
                    <div class="profile-card certification-section">
                        <h6>Certifications</h6>
                        <ul class="mb-0 ps-3">
                            <li>Java - Scaler Academy</li>
                            <li>Python - Coursera</li>
                            <li>Web Development - Great Learning</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
	
	
	
	
	
	
					<!-- End modal -->
					<script>
  function updateClasses() {
            var department = document.getElementById("department").value;
            var classDropdown = document.getElementById("class");
            var semesterDropdown = document.getElementById("semester");
            semesterDropdown.innerHTML = "";
            // Clear previous options
            classDropdown.innerHTML = "";
            if (department === "MCA") {
                var mcaClasses = ["Select Class","MCA 1", "MCA 2"];
                mcaClasses.forEach(function(cls) {
                    var option = document.createElement("option");
                    option.value = cls;
                    option.text = cls;
                    classDropdown.appendChild(option);
                });
            } else if (department === "MBA") {
                var mbaClasses = ["Select Class","MBA 1", "MBA 2"];
                mbaClasses.forEach(function(cls) {
                    var option = document.createElement("option");
                    option.value = cls;
                    option.text = cls;
                    classDropdown.appendChild(option);
                });
            } else {
                var option = document.createElement("option");
                option.value = "";
                option.text = "Select Department First";
                classDropdown.appendChild(option);
            }
        }
  
  function updateSemesters() {
	  var classDropdown = document.getElementById("class");
      var semesterDropdown = document.getElementById("semester");

	  var classs = document.getElementById("class").value;
      semesterDropdown.innerHTML = "";
      //   
      if (classs === "MCA 1" || classs === "MBA 1") {
          var mcaClasses = [1, 2];
          mcaClasses.forEach(function(cls) {
              var option = document.createElement("option");
              option.value = cls;
              option.text = cls;
              semesterDropdown.appendChild(option);
          });
      } else if (classs === "MCA 2" || classs === "MBA 2") {
          var mbaClasses = ["Semester 3", "Semester 4"];
          mbaClasses.forEach(function(cls) {
              var option = document.createElement("option");
              option.value = cls;
              option.text = cls;
              semesterDropdown.appendChild(option);
          });
      } else {
          var option = document.createElement("option");
          option.value = "";
          option.text = "Select Class First";
          semesterDropdown.appendChild(option);
      }
  }
    </script>
    
    </script>
	<script>
    const toggleBtn = document.getElementById('viewToggle');
    const viewMenu = document.getElementById('viewMenu');

    toggleBtn.addEventListener('click', () => {
        viewMenu.classList.toggle('hidden');
    });
</script>
					
				</div>
			</div>
		</div>
	</div>
	<script>
        $(document).ready(function () {
            $(".btn-danger").click(function () {
                $(this).closest("tr").remove();
            });
        });
    </script>
	<script>
    document.querySelectorAll('.dropdown-toggle').forEach(button => {
        button.addEventListener('click', function(event) {
            event.stopPropagation();
            const dropdownMenu = this.nextElementSibling;
            dropdownMenu.classList.toggle('show');
        });
    });

    // Close dropdowns when clicking outside
    window.addEventListener('click', function(){
        document.querySelectorAll('.dropdown-menu').forEach(menu => {
            menu.classList.remove('show');
        });
    });
</script>
	<script>
    const menuButton = document.getElementById('menu-button');
    const sidebar = document.getElementById('sidebar');
    
    menuButton.addEventListener('click', () => {
        sidebar.classList.toggle('hidden');
    });

    document.querySelectorAll('.dropdown-toggle').forEach(button => {
        button.addEventListener('click', function(event) {
            event.stopPropagation();
            const dropdownMenu = this.nextElementSibling;
            dropdownMenu.classList.toggle('hidden');
        });
    });

    window.addEventListener('click', function() {
        document.querySelectorAll('.dropdown-menu').forEach(menu => {
            menu.classList.add('hidden');
        });
    });
</script>


	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>


</body>
</html>