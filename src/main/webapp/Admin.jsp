<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%
String name = (String) session.getAttribute("username");
String role = (String) session.getAttribute("role");
if (name == null || (!role.equals("admin"))) {
	response.sendRedirect("index.jsp");
}
%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ include file="/BackEnd/config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Generate Time Table <%=role%></title>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
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
					<a href="logout.jsp" class="text-gray-700"><li
						class="p-2 hover:bg-gray-100"><i
							class="fas fa-sign-out-alt mr-2 text-blue-500"></i> Logout</li></a>
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
					<li class="p-2 hover:bg-gray-100 rounded-lg"><a
						href="Show_Time_Table.jsp" class="text-gray-700"><i
							class="fa-solid fa-calendar-days" style="color: #3B82F6;"></i>
							Time Table</a></li>
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
							Welcome :
							<%=name%></h2>
						<h1 class="text-2xl font-semibold text-white">Dashboard
							Analytics</h1>
					</div>

					<div class="flex items-center space-x-4 ml-4">
						<i class="fas fa-user-circle text-white"></i>
					</div>
				</div>
			</div>
			<!-- WOrking Page -->
			<div>
				<div class="container">
					<h1 class="text-center fs-1 ">Generate Time Table</h1>
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
          var mbaClasses = [3, 4];
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
					<script>
    const toggleBtn = document.getElementById('viewToggle');
    const viewMenu = document.getElementById('viewMenu');

    toggleBtn.addEventListener('click', () => {
        viewMenu.classList.toggle('hidden');
    });
</script>
					<!-- Selection Section -->
					<form action="Admin.jsp " method="post">
						<div class="row mb-4 flex-flex-flex">
							<div class="col-md-3 subttle-container">
								<div class="flex-flex-flex">
									<img src="images/department.png" alt="Profile" class="sub-logo">
									<h2 class="subtitle-heading">Department</h2>
								</div>
								<select class="form-select" id="department" name="department"
									onchange="updateClasses()">
									<option selected>Select Department</option>
									<option>MCA</option>
									<option>MBA</option>
								</select>
							</div>
							<div class="col-md-3 subttle-container">
								<div class="flex-flex-flex">
									<img src="images/Class.png" alt="Profile" class="sub-logo">
									<h2 class="subtitle-heading ">Class</h2>
								</div>
								<select class="form-select" id="class"
									onchange="updateSemesters()" name="classs">
									<option selected>Select Class</option>
									<option>Class A</option>
									<option>Class B</option>
								</select>
							</div>
							<div class="col-md-3 subttle-container">
								<div class="flex-flex-flex">
									<img src="images/Division,png.png" alt="Profile"
										class="sub-logo">
									<h2 class="subtitle-heading">Division</h2>
								</div>
								<select class="form-select" id="division" name="division">
									<option selected>Select Division</option>
									<option value="A">Div A</option>
									<option value="B">Div B</option>
								</select>
							</div>
							<div class="col-md-3 subttle-container">
								<div class="flex-flex-flex">
									<img src="images/semester.png" alt="Profile" class="sub-logo">
									<h2 class="subtitle-heading">Semester</h2>
								</div>
								<select class="form-select" id="semester" name="semester">
									<option selected>Select Semester</option>
									<option value=1>Semester 1</option>
									<option value=2>Semester 2</option>
								</select>
							</div>
						</div>

						<div class="text-center mt-4 mb-4">
							<button type="submit" class="btn btn-primary px-4 py-2">Get
								Subjects</button>
						</div>
					</form>
					<form action="GenerateServlet" method="post">
						<div class="card shadow">
							<table class="table table-bordered text-center">
								<thead class="table-dark">
									<tr>
										<th>Sr No</th>
										<th>Subject Code</th>
										<th>Subject Name</th>
										<th>Credit Points</th>
										<th>Faculty</th>
										<th>Profile</th>
										<th>Actions</th>
									</tr>
								</thead>
								<tbody>

									<%
									class Faculty {
										String identifier, role, name, mobile, email, password, course, year, designation;

										public Faculty(String name) {
											this.name = name;
										}
									}

									List<String> subjectCodes = new ArrayList<>();
									List<String> subjectNames = new ArrayList<>();
									List<String> creditPoints = new ArrayList<>();
									String nn = "";
									String aa = "";
									String bb = "";
									Statement stmt = null;
									List<Faculty> facultyList = new ArrayList<>();
									%>

									<%
									try {
										String department = request.getParameter("department");
										String semester = request.getParameter("semester");
										String url = "SELECT * FROM subjects WHERE department = ? AND semester = ?";
										PreparedStatement pst = conn.prepareStatement(url);
										pst.setString(1, department);
										pst.setString(2, semester);

										ResultSet rs = pst.executeQuery(); // <- Store the result set here

										while (rs.next()) {
											// Access data from each row
											String courseTitle = rs.getString("course_title");
											String courseCode = rs.getString("course_code");
											int cp = rs.getInt("cp");
											subjectCodes.add(courseCode);
											subjectNames.add(courseTitle);
											creditPoints.add(String.valueOf(cp));
										}
										department = request.getParameter("department");
										semester = request.getParameter("semester");
										String division = request.getParameter("division");
										String classs = request.getParameter("classs");
										url = "SELECT * FROM subjects WHERE department = ? AND semester = ?";
										pst = conn.prepareStatement(url);
										pst.setString(1, department);
										pst.setString(2, semester);

										rs = pst.executeQuery(); // <- Store the result set here

										int i = 0;

										while (rs.next()) {
											// Access data from each row
											String courseTitle = rs.getString("course_title");
											String courseCode = rs.getString("course_code");
											int cp = rs.getInt("cp");
											//out.println("Course: " + courseTitle + " | Code: " + courseCode + "<br>");
											//for (int i = 0; i < subjectCodes.size(); i++) {
									%>
									<!-- Subjects Table -->
									<tr>
										<td><%=i + 1%></td>
										<%
										nn = subjectCodes.get(i);
										%>
										<input type="hidden" name="subject_code[]" value="<%=nn%>" />
										<td><%=courseCode%></td>
										<%
										nn = subjectNames.get(i);
										%>
										<input type="hidden" name="subject_name[]" value="<%=aa%>" />
										<td><%=courseTitle%></td>
										<%
										bb = creditPoints.get(i);
										%>
										<input type="hidden" name="credit_points[]" value="<%=bb%>" />
										<td><%=cp%></td>
										<input type="hidden" name="department" value="<%=department%>" />
										<input type="hidden" name="semester" value="<%=semester%>" />
										<input type="hidden" name="division" value="<%=division%>" />
										<input type="hidden" name="classs" value="<%=classs%>" />
										<td><select class="form-select" name="faculty[]">
												<option selected>Select Faculty</option>
												<%
												PreparedStatement ps = conn.prepareStatement("SELECT * FROM Users WHERE ROLE = 'faculty'");
												ResultSet rss = ps.executeQuery();
												while (rss.next()) {
													String fname = rss.getString("name");
													String f_id = rss.getString("IDENTIFIER");
												%>
												<option value="<%=f_id%>"><%=fname%></option>
												<%
												}
												%>
										</select></td>
										<td><img src="images/profiles.png" alt="Profile"></td>
										<td>
											<button type="submit">Assign</button>
										</td>
									</tr>

									<%
									//}
									i++;
									}
									} catch (Exception e) {
									e.printStackTrace();
									} finally {
									System.out.println("done");
									System.out.println("Couser : " + subjectCodes);
									System.out.println("Couser Name: " + subjectNames);
									System.out.println("Couser : " + creditPoints);
									}
									%>
								</tbody>
							</table>
							<button class="btn btn-primary w-100" id="sem_1">Generate</button>
						</div>
					</form>
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
	<script>
    const toggleBtn2 = document.getElementById('addToggle');
    const addMenu = document.getElementById('addMenu');

    toggleBtn2.addEventListener('click', () => {
        addMenu.classList.toggle('hidden');
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