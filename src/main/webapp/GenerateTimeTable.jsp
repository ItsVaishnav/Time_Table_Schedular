<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%
String name = (String) session.getAttribute("username");
String role = (String) session.getAttribute("role");
if (name == null && role != "Admin") {
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
<title>Generate Time Table</title>
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
</style>
</head>
<body>
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

			<div>
				<div class="container">
					<h1 class="text-center fs-1 ">Generate Time Table</h1>
	<script>
    const toggleBtn = document.getElementById('viewToggle');
    const viewMenu = document.getElementById('viewMenu');

    toggleBtn.addEventListener('click', () => {
        viewMenu.classList.toggle('hidden');
    });
</script>
					<!-- Selection Section -->
					<%
					String dep = request.getParameter("dep");
					String cls = request.getParameter("cls");
					String sem = request.getParameter("sem");
					String div = request.getParameter("div");
					%>
						<div class="row mb-4 flex-flex-flex">
							<div class="col-md-3 subttle-container">
								<div class="flex-flex-flex">
									<img src="images/department.png" alt="Profile" class="sub-logo">
									<h2 class="subtitle-heading">Department</h2>
								</div>
								<div>
								<h2 class="text-center"><%= dep %></h2>
								</div>
							</div>
							<div class="col-md-3 subttle-container">
								<div class="flex-flex-flex">
									<img src="images/Class.png" alt="Profile" class="sub-logo">
									<h2 class="subtitle-heading ">Class</h2>
								</div>
								<div>
								<h2 class="text-center"><%= cls %></h2>
								</div>
							</div>
							<div class="col-md-3 subttle-container">
								<div class="flex-flex-flex">
									<img src="images/Division,png.png" alt="Profile"
										class="sub-logo">
									<h2 class="subtitle-heading">Division</h2>
								</div>
								<div>
								<h2 class="text-center">Division : <%= div %></h2>
								</div>
							</div>
							<div class="col-md-3 subttle-container">
								<div class="flex-flex-flex">
									<img src="images/semester.png" alt="Profile" class="sub-logo">
									<h2 class="subtitle-heading">Semester</h2>
								</div><div>
								<h2 class="text-center"> Semester : <%= sem %></h2>
								</div>
							</div>
						</div>
						<%
							String cs = cls.contains("MCA") ? "TimeTableDisplay.jsp" : "TimeTableDisplayMBA.jsp"; 
						%>
						<form action="<%= cs %>" method="post">
					<input type="hidden" name="dep" value="<%=dep %>">
					<input type="hidden" name="cls" value="<%=cls %>">
					<input type="hidden" name="div" value="<%=div %>">
					<input type="hidden" name="sem" value="<%=sem %>">
					<div class="card shadow">
						<table class="table table-bordered text-center">
							<thead class="table-dark">
								<tr>
									<th>Sr No</th>
									<th>Subject Code</th>
									<th>Credit Points</th>
									<th>Faculty Code</th>
									<th>Allocated Lectures</th>
								</tr>
							</thead>
							<tbody>
								<%
								int i = 0;
								String faculty_name = "xxx";
								PreparedStatement pstmt = null;
								try {
									String department = request.getParameter("department");
									String semester = request.getParameter("semester");
									String url = "SELECT * FROM assign_faculty WHERE AS_SEM = ? AND AS_CLASS = ? AND AS_DIVISION = ?";
									PreparedStatement pst = conn.prepareStatement(url);
									pst.setString(1, sem);
									pst.setString(2, cls);
									pst.setString(3,div);

									ResultSet rs = pst.executeQuery(); // <- Store the result set here
									
									while (rs.next()) {
										// Access data from each row
										String cp = rs.getString("as_cp");
										String courseCode = rs.getString("as_course_code");
										String faculty_code = rs.getString("as_faculty_code");
										String available_lec = rs.getString("as_available_lec");
								%>
								<!-- Subjects Table -->
								<tr>
									<td><%=i+1%></td>
									<td><%= courseCode %> </td>
									<td><%= cp %></td>
									
									<%
									try{
									pstmt = conn.prepareStatement("SELECT * FROM Users WHERE IDENTIFIER = ? AND ROLE = 'faculty'");
									pstmt.setString(1,faculty_code);
									ResultSet rsf = pstmt.executeQuery();
									while(rsf.next()){
										faculty_name = rsf.getString("name");
									}
									}catch(Exception e){
										out.println("Error : "+e);
									}
									%>
									<td><%= faculty_name %></td>
									<td> <%= available_lec %></td>
								</tr>
											
								<%
								//}
								i++;
								}
								} catch (Exception e) {
								e.printStackTrace();
								} finally {
								System.out.println("done : "+i);
								}
								%>
							</tbody>
						</table>
						<button class="btn btn-primary w-100">Generate</button>
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


	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>


</body>
</html>