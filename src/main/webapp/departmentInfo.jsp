<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%
String name = (String) session.getAttribute("username");
String role = (String) session.getAttribute("role");
if (name == null || (!role.equals("admin"))) {
	response.sendRedirect("index.jsp");
}
%>
<%@ page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Generate Time Table </title>
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

/* New styles for department cards */
.department-cards {
    display: flex;
    justify-content: center;
    gap: 30px;
    margin-top: 50px;
    flex-wrap: wrap;
}

.department-card {
    width: 300px;
    height: 350px;
    perspective: 1000px;
    cursor: pointer;
    transition: transform 0.3s;
}

.department-card:hover {
    transform: translateY(-10px);
}

.card-inner {
    width: 100%;
    height: 100%;
    position: relative;
    transform-style: preserve-3d;
    transition: transform 0.8s;
    border-radius: 15px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

.department-card:hover .card-inner {
    transform: rotateY(180deg);
}

.card-front, .card-back {
    position: absolute;
    width: 100%;
    height: 100%;
    backface-visibility: hidden;
    border-radius: 15px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 20px;
    box-sizing: border-box;
}

.card-front {
    background: linear-gradient(135deg, #3B82F6, #1D4ED8);
    color: white;
}

.card-back {
    background: white;
    color: #1E3A8A;
    transform: rotateY(180deg);
    border: 2px solid #3B82F6;
    text-align: center;
}

.department-icon {
    font-size: 60px;
    margin-bottom: 20px;
}

.card-front h3 {
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 10px;
}

.card-front p {
    text-align: center;
    opacity: 0.9;
}

.card-back h4 {
    font-size: 20px;
    font-weight: 600;
    margin-bottom: 15px;
    color: #3B82F6;
}

.card-back p {
    margin-bottom: 15px;
    font-size: 14px;
}

/* MBA card colors */
.mba .card-front {
    background: linear-gradient(135deg, #10B981, #047857);
}

.mba .card-back h4 {
    color: #10B981;
}

.mba .card-back {
    border-color: #10B981;
}

/* Engineering card colors */
.engineering .card-front {
    background: linear-gradient(135deg, #F59E0B, #D97706);
}

.engineering .card-back h4 {
    color: #F59E0B;
}

.engineering .card-back {
    border-color: #F59E0B;
}

/* Animation for page load */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

.department-card {
    animation: fadeIn 0.5s ease-out forwards;
}

.department-card:nth-child(1) {
    animation-delay: 0.1s;
}

.department-card:nth-child(2) {
    animation-delay: 0.3s;
}

.department-card:nth-child(3) {
    animation-delay: 0.5s;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .department-cards {
        flex-direction: column;
        align-items: center;
    }
    
    .department-card {
        width: 280px;
        margin-bottom: 20px;
    }
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
				<li class="mb-2"><a href="Admin.jsp"
					class="flex items-center p-2 text-gray-700 hover:bg-gray-100 rounded-lg w-full">
						<i class="fas fa-home mr-2 text-blue-500"></i> Home
				</a></li>
				<!-- ADD OPTION -->
				<li>
					<button id="addToggle"
						class="flex items-center p-2 text-gray-700 hover:bg-gray-100 rounded-lg w-full">
						<i class="fas fa-plus-circle mr-2 text-blue-500"></i> Add <i
							class="fas fa-chevron-down ml-auto text-gray-400"></i>
					</button>
				</li>
				<!-- Collapsible Add Menu -->
				<div id="addMenu" class="hidden ml-6 space-y-1">
					<li class="p-2 hover:bg-gray-100 rounded-lg"><a
						href="addDepartment.jsp" class="text-gray-700"><i
							class="fa-solid fa-building-user" style="color: #3B82F6;"></i>
							Add Department</a></li>
					<li class="p-2 hover:bg-gray-100 rounded-lg"><a
						href="A_AddSubjects.jsp" class="text-gray-700"><i
							class="fa-solid fa-book-open-reader" style="color: #3B82F6;"></i>
							Add Subject</a></li>
					<li class="p-2 hover:bg-gray-100 rounded-lg"><a
						href="Admin.jsp" class="text-gray-700"><i
							class="fa-solid fa-calendar-days" style="color: #3B82F6;"></i>
							Add Time Table</a></li>
				</div>
				<!-- ADD Option -->
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
					<li class="p-2 hover:bg-gray-100 rounded-lg"><a
						href="departmentInfo.jsp" class="text-gray-700"><i
							class="fa-solid fa-building-user" style="color: #3B82F6;"></i>
							Department</a></li>
					<li class="p-2 hover:bg-gray-100 rounded-lg"><a
						href="view_faculty.jsp" class="text-gray-700"><i
							class="fa-solid fa-person-chalkboard" style="color: #3B82F6;"></i>
							Faculty</a></li>
					<li class="p-2 hover:bg-gray-100 rounded-lg"><a
						href="view_subject.jsp" class="text-gray-700"><i
							class="fa-solid fa-book-open-reader" style="color: #3B82F6;"></i>
							Subject</a></li>
					<li class="p-2 hover:bg-gray-100 rounded-lg"><a href="Show_Time_Table.jsp"
						class="text-gray-700"><i class="fa-solid fa-calendar-days"
							style="color: #3B82F6;"></i> Time Table</a></li>
				</div>
				<!-- Generate Time Table Option -->
				<li class="mb-2"><a
					class="flex items-center p-2 text-gray-700 hover:bg-gray-100 rounded-lg"
					href="Show_Time_Table.jsp"> <i
						class="fas fa-calendar-alt mr-2 text-blue-500"></i> Default Time
						Table
				</a></li>
				<li class="mb-2"><a
					class="flex items-center p-2 text-gray-700 hover:bg-gray-100 rounded-lg"
					href="A_AddSubjects.jsp"> <i
						class="fas fa-calendar-alt mr-2 text-blue-500"></i> Add Subjects
				</a></li>
			</ul>
		</nav>
	</div>
	<!-- Main Content -->
	<div class="main-body">
		<div class="flex-1 p-6">
			<div class="bg-blue-500 p-4 rounded-lg mb-6 navnav">
				<div class="flex justify-between items-center">
					<img src="images/menu-button.png" alt="Menu" class="menu-button">

					<!-- Wrap Welcome and Dashboard in a full-width container -->
					<div class="flex justify-between items-center w-full ml-4">
						<h2 class="text-white">
							Welcome : <%= name %>
							</h2>
						<h1 class="text-2xl font-semibold text-white">Dashboard
							Analytics</h1>
					</div>

					<div class="flex items-center space-x-4 ml-4">
						<i class="fas fa-user-circle text-white"></i>
					</div>
				</div>
			</div>
			<!-- Edit Modal -->

			<div class="modal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Modal title</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<p>Modal body text goes here.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
				</div>
			</div>

			<!-- End Edit Modal -->
			<!-- WOrking Page -->

			<div>
				<div class="container">
					
					<!-- modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-scrollable">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">New message</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form>
										<div class="mb-3">
											<label for="recipient-name" class="col-form-label">Recipient:</label>
											<input type="text" class="form-control" id="recipient-name">
										</div>
										<div class="mb-3">
											<label for="message-text" class="col-form-label">Message:</label>
											<textarea class="form-control" id="message-text"></textarea>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Send
										message</button>
								</div>
							</div>
						</div>
					</div>
					
			<!-- Department Cards Section -->
			<div class="department-cards">
			    <!-- MCA Card -->
			    <div class="department-card" onclick="showDepartmentInfo('MCA')">
			        <div class="card-inner">
			            <div class="card-front">
			                <i class="fas fa-laptop-code department-icon"></i>
			                <h3>MCA Department</h3>
			                <p>Master of Computer Applications</p>
			            </div>
			            <div class="card-back">
			                <h4>MCA Department</h4>
			                <p>The MCA program focuses on advanced computing concepts, software development, and IT management.</p>
			                <p><strong>Duration:</strong> 2 Years</p>
			                <p><strong>Intake:</strong> 60 Students</p>
			                <button class="btn btn-primary mt-2">View Details</button>
			            </div>
			        </div>
			    </div>
			    
			    <!-- MBA Card -->
			    <div class="department-card mba" onclick="showDepartmentInfo('MBA')">
			        <div class="card-inner">
			            <div class="card-front">
			                <i class="fas fa-chart-line department-icon"></i>
			                <h3>MBA Department</h3>
			                <p>Master of Business Administration</p>
			            </div>
			            <div class="card-back">
			                <h4>MBA Department</h4>
			                <p>The MBA program emphasizes business management, leadership, and entrepreneurial skills.</p>
			                <p><strong>Duration:</strong> 2 Years</p>
			                <p><strong>Intake:</strong> 60 Students</p>
			                <button class="btn btn-success mt-2">View Details</button>
			            </div>
			        </div>
			    </div>
			    
			    <!-- Engineering Card -->
			    <div class="department-card engineering" onclick="showDepartmentInfo('Engineering')">
			        <div class="card-inner">
			            <div class="card-front">
			                <i class="fas fa-cogs department-icon"></i>
			                <h3>Engineering</h3>
			                <p>Bachelor of Technology</p>
			            </div>
			            <div class="card-back">
			                <h4>Engineering Department</h4>
			                <p>Our engineering programs offer specializations in Computer, Mechanical, and Civil engineering.</p>
			                <p><strong>Duration:</strong> 4 Years</p>
			                <p><strong>Intake:</strong> 120 Students</p>
			                <button class="btn btn-warning mt-2">View Details</button>
			            </div>
			        </div>
			    </div>
			</div>
			
			<!-- Department Information Display Area -->
			<div id="departmentInfoDisplay" class="mt-8 p-6 bg-white rounded-lg shadow-lg hidden">
			    <h2 class="text-2xl font-bold mb-4" id="deptTitle">Department Information</h2>
			    <div id="deptContent"></div>
			</div>
		</div>
	</div>
	
	<script>
	    function showDepartmentInfo(dept) {
	        const displayArea = document.getElementById('departmentInfoDisplay');
	        const title = document.getElementById('deptTitle');
	        const content = document.getElementById('deptContent');
	        
	        // Remove hidden class to show the display area
	        displayArea.classList.remove('hidden');
	        
	        // Set title
	        title.textContent = `${dept} Department Information`;
	        
	        // Set content based on department
	        let htmlContent = '';
	        if (dept === 'MCA') {
	            htmlContent = `
	                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
	                    <div>
	                        <h3 class="text-xl font-semibold mb-3">About MCA</h3>
	                        <p class="mb-4">The Master of Computer Applications (MCA) is a three-year professional post-graduate programme for candidates wanting to delve deeper into the world of computer application development with the help of learning modern programming language.</p>
	                        <p>The programme is a blend of both theoretical and practical knowledge. An MCA degree endows students' an opportunity to work with tools meant to develop better and faster applications.</p>
	                    </div>
	                    <div>
	                        <h3 class="text-xl font-semibold mb-3">Program Details</h3>
	                        <ul class="list-disc pl-5 space-y-2">
	                            <li><strong>Duration:</strong> 2 Years</li>
	                            <li><strong>Intake Capacity:</strong> 60 Students</li>
	                            <li><strong>Eligibility:</strong> Graduation in any discipline with Mathematics</li>
	                            <li><strong>Specializations:</strong> Cloud Computing, Data Science, Cyber Security</li>
	                            <li><strong>Lab Facilities:</strong> 3 State-of-the-art computer labs</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="mt-6">
	                    <h3 class="text-xl font-semibold mb-3">Faculty Information</h3>
	                    <p>Our MCA department has 10 highly qualified faculty members with expertise in various domains of computer applications.</p>
	                </div>
	            `;
	        } else if (dept === 'MBA') {
	            htmlContent = `
	                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
	                    <div>
	                        <h3 class="text-xl font-semibold mb-3">About MBA</h3>
	                        <p class="mb-4">The Master of Business Administration (MBA) is a two-year postgraduate programme that provides high quality business education with a curriculum that responds to the needs of the industry and the economy.</p>
	                        <p>The programme aims to transform students into competent and confident professionals capable of handling the challenges of the corporate world.</p>
	                    </div>
	                    <div>
	                        <h3 class="text-xl font-semibold mb-3">Program Details</h3>
	                        <ul class="list-disc pl-5 space-y-2">
	                            <li><strong>Duration:</strong> 2 Years</li>
	                            <li><strong>Intake Capacity:</strong> 60 Students</li>
	                            <li><strong>Eligibility:</strong> Graduation in any discipline</li>
	                            <li><strong>Specializations:</strong> Marketing, Finance, HR, Operations</li>
	                            <li><strong>Facilities:</strong> Business lab with simulation software</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="mt-6">
	                    <h3 class="text-xl font-semibold mb-3">Faculty Information</h3>
	                    <p>Our MBA department has 12 experienced faculty members with both academic and industry experience.</p>
	                </div>
	            `;
	        } else if (dept === 'Engineering') {
	            htmlContent = `
	                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
	                    <div>
	                        <h3 class="text-xl font-semibold mb-3">About Engineering</h3>
	                        <p class="mb-4">Our Bachelor of Technology (B.Tech) programme is a four-year undergraduate course that provides students with a strong foundation in engineering principles along with specialized knowledge in their chosen branch.</p>
	                        <p>The curriculum is designed to develop technical expertise along with problem-solving and innovation skills.</p>
	                    </div>
	                    <div>
	                        <h3 class="text-xl font-semibold mb-3">Program Details</h3>
	                        <ul class="list-disc pl-5 space-y-2">
	                            <li><strong>Duration:</strong> 4 Years</li>
	                            <li><strong>Intake Capacity:</strong> 120 Students</li>
	                            <li><strong>Eligibility:</strong> 10+2 with Physics, Chemistry, Mathematics</li>
	                            <li><strong>Branches:</strong> Computer, Mechanical, Civil, Electronics</li>
	                            <li><strong>Labs:</strong> 8 Well-equipped laboratories</li>
	                        </ul>
	                    </div>
	                </div>
	                <div class="mt-6">
	                    <h3 class="text-xl font-semibold mb-3">Faculty Information</h3>
	                    <p>Our Engineering department has 25 highly qualified faculty members with expertise in various engineering disciplines.</p>
	                </div>
	            `;
	        }
	        
	        content.innerHTML = htmlContent;
	        
	        // Scroll to the display area
	        displayArea.scrollIntoView({ behavior: 'smooth' });
	    }
	</script>
			

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
    const addToggle = document.getElementById('addToggle');
    const addMenu = document.getElementById('addMenu');

    toggleBtn.addEventListener('click', () => {
        viewMenu.classList.toggle('hidden');
    });
    
    addToggle.addEventListener('click', () => {
        addMenu.classList.toggle('hidden');
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