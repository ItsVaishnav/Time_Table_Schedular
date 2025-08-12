<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%
String name = (String) session.getAttribute("username");
String role = (String) session.getAttribute("role");
if (name == null || (!role.equals("student"))) {
	response.sendRedirect("index.jsp");
}
%>
<%@ page import="java.sql.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Time Table</title>
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

@media ( max-width : 768px) {
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
				<li class="mb-2"><a href="Student.jsp"
					class="flex items-center p-2 text-gray-700 hover:bg-gray-100 rounded-lg w-full">
						<i class="fas fa-home mr-2 text-blue-500"></i> Home
				</a></li>
				<li class="mb-2"><a
					class="flex items-center p-2 text-gray-700 hover:bg-gray-100 rounded-lg"
					href="Student.jsp"> <i
						class="fas fa-calendar-alt mr-2 text-blue-500"></i> Default Time
						Table
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
						<h2 class="text-white">Welcome : <%= name %></h2>
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


				<div >
					<form action="Student.jsp " method="post">
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
				</div>

					<%
					String url = "jdbc:oracle:thin:@localhost:1521:orcl";
					String user = "system";
					String pass = "Vaishnav";

					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;

					String[] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
					String[] timeSlots = {"8:00 - 9:00 AM", "9:00 - 10:00 AM", "10:00 - 10:30 AM", "10:30 - 11:30 AM", "11:30 - 12:30 PM",
							"12:30 - 1:15 PM", "1:15 - 2:15 PM", "2:15 - 3:15 PM"};

					// Mapping period_number to column index
					String[] periodMap = {"8:00 - 9:00 AM", "9:00 - 10:00 AM", "10:30 - 11:30 AM", "11:30 - 12:30 PM", "1:15 - 2:15 PM",
							"2:15 - 3:15 PM"};
					String sem = request.getParameter("semester");
					String classs = request.getParameter("classs");
					String div = request.getParameter("division");
					try {
						Class.forName("oracle.jdbc.driver.OracleDriver");
						conn = DriverManager.getConnection(url, user, pass);

						String query = "SELECT SUBJECT, DAY_NUMBER, PERIOD_NUMBER " + "FROM Generated_Time_Table "
						+ "WHERE SEMESTER = ? AND CLASS = ? AND DIVISION = ?";

						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, sem);
						pstmt.setString(2, classs);
						pstmt.setString(3, div);
						rs = pstmt.executeQuery();

						// Store subjects in [day][period]
						String[][] timetable = new String[6][6];
						while (rs.next()) {
							int day = rs.getInt("DAY_NUMBER");
							int period = rs.getInt("PERIOD_NUMBER");
							String subject = rs.getString("SUBJECT");

							if (day >= 0 && day < 6 && period >= 0 && period < 6) {
						timetable[day][period] = subject;
							}
						}
					%>

					<table>
						<tr>
							<th>DAY/TIME</th>
							<%
							for (String slot : timeSlots) {
							%>
							<th><%=slot%></th>
							<%
							}
							%>
						</tr>

						<%
						for (int d = 0; d < 6; d++) {
						%>
						<tr>
							<td class="day-col"><%=days[d]%></td>
							<%
							for (int t = 0; t < 8; t++) {
								if (t == 2) {
							%>
							<td class="break">Short Break</td>
							<%
							} else if (t == 5) {
							%>
							<td class="break">Lunch Break</td>
							<%
							} else {
							// Period index in table
							int periodIndex = (t < 2) ? t : (t < 5) ? t - 1 : t - 2;
							String subj = timetable[d][periodIndex];
							%>
							<td class="<%=(subj == null) ? "empty" : ""%>"><%=(subj != null) ? subj : "-"%></td>
							<%
							}
							}
							%>
						</tr>
						<%
						}
						%>
					</table>

					<%
					} catch (Exception e) {
					out.println("Error: " + e.getMessage());
					} finally {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
					}
					%>

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
					<script>
    const toggleBtn2 = document.getElementById('addToggle');
    const addMenu = document.getElementById('addMenu');

    toggleBtn2.addEventListener('click', () => {
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