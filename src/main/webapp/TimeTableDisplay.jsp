<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="/BackEnd/config.jsp" %>
<%
String name = (String) session.getAttribute("username");
String role = (String) session.getAttribute("role");
if (name == null && !role.equals("Admin")) {
	response.sendRedirect("index.jsp");
}
%>
<%@ page import="java.sql.*, java.util.*, java.util.stream.*"%>
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
					Map<Integer, String> nameMapp = new HashMap<>();
					%>
					<div class="row mb-4 flex-flex-flex">
						<div class="col-md-3 subttle-container">
							<div class="flex-flex-flex">
								<img src="images/department.png" alt="Profile" class="sub-logo">
								<h2 class="subtitle-heading">Department</h2>
							</div>
							<div>
								<h2 class="text-center"><%=dep%></h2>
							</div>
						</div>
						<div class="col-md-3 subttle-container">
							<div class="flex-flex-flex">
								<img src="images/Class.png" alt="Profile" class="sub-logo">
								<h2 class="subtitle-heading ">Class</h2>
							</div>
							<div>
								<h2 class="text-center"><%=cls%></h2>
							</div>
						</div>
						<div class="col-md-3 subttle-container">
							<div class="flex-flex-flex">
								<img src="images/Division,png.png" alt="Profile"
									class="sub-logo">
								<h2 class="subtitle-heading">Division</h2>
							</div>
							<div>
								<h2 class="text-center">
									Division :
									<%=div%></h2>
							</div>
						</div>
						<div class="col-md-3 subttle-container">
							<div class="flex-flex-flex">
								<img src="images/semester.png" alt="Profile" class="sub-logo">
								<h2 class="subtitle-heading">Semester</h2>
							</div>
							<div>
								<h2 class="text-center">
									Semester :
									<%=sem%></h2>
							</div>
						</div>
					</div>
					
<%
	Map<Integer, String> nameMap = new HashMap<>();
	if(sem.equals("1")  || sem.equals("2")){	
%>
	<%!int[][] matrixx = new int[6][6];
	List<Integer> valuess = new ArrayList<>();

	boolean tryGeneratee() {
		int[][] temp = new int[6][6];

		// Fix last row
		temp[5][2] = 11;
		temp[5][3] = 11;
		temp[5][4] = 0;
		temp[5][5] = 0;

		// Pick 6 unique 1–6 for first column
		List<Integer> firstColl = new ArrayList<>(Arrays.asList(1, 2, 3, 4, 5, 6));
		Collections.shuffle(firstColl);
		for (int i = 0; i < 6; i++) {
			temp[i][0] = firstColl.get(i);
		}

		// Remove from pooll
		List<Integer> pooll = new ArrayList<>(valuess);
		for (int i = 0; i < 6; i++) {
			pooll.remove((Integer) temp[i][0]);
		}

		for (int i = 0; i < 6; i++) {
			Set<Integer> usedd = new HashSet<>();
			usedd.add(temp[i][0]);

			for (int j = 1; j < 6; j++) {
				if (i == 5 && j >= 2)
					continue;

				boolean placedd = false;
				for (int k = 0; k < pooll.size(); k++) {
					int val = pooll.get(k);
					if (!usedd.contains(val)) {
						temp[i][j] = val;
						usedd.add(val);
						pooll.remove(k);
						placedd = true;
						break;
					}
				}
				if (!placedd)
					return false;
			}
		}

		// copy to matrixx
		for (int i = 0; i < 6; i++) {
			System.arraycopy(temp[i], 0, matrixx[i], 0, 6);
		}
		return true;
	}

	void generatematrixxx() {
		Map<Integer, Integer> freqq = new LinkedHashMap<>();

		for (int i = 1; i <= 6; i++)
			freqq.put(i, 4);
		freqq.put(7, 3);
		freqq.put(8, 3);
		freqq.put(9, 1);
		freqq.put(10, 1);

		valuess.clear();
		for (Map.Entry<Integer, Integer> entry : freqq.entrySet()) {
			for (int i = 0; i < entry.getValue(); i++) {
				valuess.add(entry.getKey());
			}
		}

		// remove 11s (will be placedd manually)
		valuess.remove((Integer) 11);
		valuess.remove((Integer) 11);

		while (!tryGeneratee()) {
			Collections.shuffle(valuess);
		}
	}%>
								<%
								generatematrixxx();
								%>
								<%
								//Map<Integer, String> nameMapp = new HashMap<>();
								for (int i = 1; i <= 11; i++) {
									nameMapp.put(i, ""); // initialize with empty strings
								}
								PreparedStatement pstmtt = null;
								ResultSet rss = null;
								PreparedStatement spstmt = null;
								ResultSet srs = null;
								try {
									String sql = "SELECT * FROM assign_faculty WHERE as_sem = ? AND as_division = ? AND as_class = ?";
									pstmtt = conn.prepareStatement(sql);
									pstmtt.setString(1, sem);
									pstmtt.setString(2, div);
									pstmtt.setString(3, cls);
									rss = pstmtt.executeQuery();

									int cp3Index = 1; // for keys 1 to 6
									int cp2Index = 7; // for keys 7 to 8
									int cp1Index = 9; // for keys 9 to 10
									StringBuilder extraSubjects = new StringBuilder(); // for key 11

									while (rss.next()) {
										String code = rss.getString("AS_COURSE_CODE");

										String sqls = "SELECT * FROM subjects WHERE course_code = ?";
										spstmt = conn.prepareStatement(sqls);
										spstmt.setString(1, code);
										srs = spstmt.executeQuery();

										if (srs.next()) {
									int cp = srs.getInt("cp");
									String acronym = srs.getString("acronym");

									if (code != null && code.toUpperCase().contains("ITC")) {
										// ITC code subjects go to key 11
										if (extraSubjects.length() > 0)
											extraSubjects.append(", ");
										extraSubjects.append(acronym);
									} else if (cp == 3 && cp3Index <= 6) {
										nameMapp.put(cp3Index++, acronym);
									} else if (cp == 2 && cp2Index <= 8) {
										nameMapp.put(cp2Index++, acronym);
									} else if (cp == 1 && cp1Index <= 10) {
										nameMapp.put(cp1Index++, acronym);
									} else {
										// If none of the above fit, put in key 11
										if (extraSubjects.length() > 0)
											extraSubjects.append(", ");
										extraSubjects.append(acronym);
									}
										}

										srs.close();
										spstmt.close();
									}

									// Put the collected ITC and extra subjects in key 11
									nameMapp.put(11, extraSubjects.toString());

									//for (Map.Entry<Integer, String> entry : nameMapp.entrySet()) {
									//    out.println(entry.getKey() + " : " + entry.getValue() + "____||____");
									//}

								} catch (Exception e) {
									out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
								} finally {
									try {
										if (rss != null)
									rss.close();
									} catch (Exception e) {
									}
									try {
										if (pstmtt != null)
									pstmtt.close();
									} catch (Exception e) {
									}
								}
								%>
								<div class="my-5 card shadow">
						<table class="table table-bordered text-center">
							<thead class="table-dark">
								<tr>
									<th>Day/Time</th>
									<th>8:00 - 9:00 AM</th>
									<th>9:00 - 10:00 AM</th>
									<th>10:00 - 10:30 AM</th>
									<th>10:30 - 11:30 AM</th>
									<th>11:30 - 12:30 PM</th>
									<th>12:30 - 1:15 PM</th>
									<th>1:15 - 2:15 PM</th>
									<% 
										if(sem.equals("1") || sem.equals("2")){
											out.println("<th>2:15 - 3:15 PM</th>");
										}
									%>
								</tr>
							</thead>
							<tbody>
								<%
								boolean shouldReload = false;
								for (int i = 0; i < 6; i++) {
								    out.println("<tr>");
								    out.println("<td style='background-color: #e0e0e0;'><strong>");
								    String[] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
								    out.print(days[i]);
								    out.println("</strong></td>");

								    for (int j = 0; j < 6; j++) {
								        int value = matrixx[i][j];
								        String acronym = nameMapp.getOrDefault(value, "N/A");

								        String sub_code_new = "", fac = "", new_fac = "";
								        boolean flag = false;

								        try {
								            // 1. Get subject code by acronym
								            String get_new_subject_code = "SELECT COURSE_CODE FROM subjects WHERE SEMESTER = ? AND ACRONYM = ?";
								            PreparedStatement gnsc = conn.prepareStatement(get_new_subject_code);
								            gnsc.setString(1, sem);
								            gnsc.setString(2, acronym);
								            ResultSet rsgnsc = gnsc.executeQuery();
								            if (rsgnsc.next()) {
								                sub_code_new = rsgnsc.getString("COURSE_CODE");
								            }
								            rsgnsc.close();
								            gnsc.close();

								            // 2. Get previous faculty code from generated_time_table
								            String get_previous_subject_code = "SELECT FACULTY_CODE FROM generated_time_table WHERE DAY_NUMBER = ? AND PERIOD_NUMBER = ?";
								            PreparedStatement gpsc = conn.prepareStatement(get_previous_subject_code);
								            gpsc.setInt(1, i);
								            gpsc.setInt(2, j);
								            ResultSet rsgpsc = gpsc.executeQuery();
								            if (rsgpsc.next()) {
								                fac = rsgpsc.getString("FACULTY_CODE");
								            }
								            rsgpsc.close();
								            gpsc.close();

								            // 3. Get new faculty code
								            String get_new_faculty_code = "SELECT AS_FACULTY_CODE FROM assign_faculty WHERE AS_SEM = ? AND AS_DIVISION = ? AND AS_COURSE_CODE = ?";
								            PreparedStatement gnfc = conn.prepareStatement(get_new_faculty_code);
								            gnfc.setString(1, sem);
								            gnfc.setString(2, div);
								            gnfc.setString(3, sub_code_new);
								            ResultSet rsgnfc = gnfc.executeQuery();
								            if (rsgnfc.next()) {
								                new_fac = rsgnfc.getString("AS_FACULTY_CODE");
								            }
								            rsgnfc.close();
								            gnfc.close();

								            // 4. Compare
								            if (fac != null && fac.equals(new_fac)) {
								                flag = true;
								            }

								        } catch (Exception e) {
								            out.println("<td style='color:red;'>Err: " + e.getMessage() + "</td>");
								            e.printStackTrace();
								            continue;
								        }

								        if (!acronym.equals("MP") && flag) {
								            shouldReload = true;
								        }

								        String display = (value == 0) ? "Mentor Mentee" : acronym;
								        out.println("<td>" + display + "</td>");

								        if (j == 1) {
								            out.println("<td style='background-color: #e0e0e0;'><strong>Short Break</strong></td>");
								        }
								        if (j == 3) {
								            out.println("<td style='background-color: #e0e0e0;'><strong>Lunch Break</strong></td>");
								        }
								    }
								    out.println("</tr>");
								}
							}else{
								%>		
<%! 
int[][] matrix = new int[6][5]; // CHANGED from 6x6 to 6x5
List<Integer> values = new ArrayList<>();

boolean tryGenerate() {
	int[][] temp = new int[6][5];

	// Place fixed 8s at Saturday (row 5), columns 2 and 3
	temp[5][2] = 8;
	temp[5][3] = 8;

	// Random unique 1–5 for first column (rows 0 to 4)
	List<Integer> firstCol = new ArrayList<>(Arrays.asList(1, 2, 3, 4, 5));
	Collections.shuffle(firstCol);
	for (int i = 0; i < 5; i++) {
		temp[i][0] = firstCol.get(i);
	}
	temp[5][0] = firstCol.get(new Random().nextInt(5)); // Random 1–5 for Saturday row

	// Prepare pool
	List<Integer> pool = new ArrayList<>(values);
	// Remove first-column values from pool
	for (int i = 0; i < 6; i++) {
		pool.remove((Integer) temp[i][0]);
	}

	for (int i = 0; i < 6; i++) {
		Set<Integer> used = new HashSet<>();
		used.add(temp[i][0]);

		for (int j = 1; j < 5; j++) {
			// Saturday logic
			if (i == 5) {
				if (j == 2 || j == 3) continue; // already set to 8
				if (j == 4) {
					temp[5][4] = 0; // last col must be 0
					continue;
				}
				// Saturday col 1: fill from pool
				if (j == 1) {
					boolean placed = false;
					Iterator<Integer> iterator = pool.iterator();
					while (iterator.hasNext()) {
						int val = iterator.next();
						if (!used.contains(val)) {
							temp[i][j] = val;
							used.add(val);
							iterator.remove();
							placed = true;
							break;
						}
					}
					if (!placed) return false;
					continue;
				}
			}

			// Normal row & column
			boolean placed = false;
			Iterator<Integer> iterator = pool.iterator();
			while (iterator.hasNext()) {
				int val = iterator.next();
				if (!used.contains(val)) {
					temp[i][j] = val;
					used.add(val);
					iterator.remove();
					placed = true;
					break;
				}
			}
			if (!placed) return false;
		}
	}

	// Copy to matrix
	for (int i = 0; i < 6; i++) {
		System.arraycopy(temp[i], 0, matrix[i], 0, 5);
	}
	return true;
}

void generateMatrix() {
	Map<Integer, Integer> freq = new LinkedHashMap<>();

	freq.put(1, 4);
	freq.put(2, 4);
	freq.put(3, 4);
	freq.put(4, 4);
	freq.put(5, 4);
	freq.put(6, 3);
	freq.put(7, 3);
	freq.put(8, 2); // we'll place two 8s manually
	freq.put(9, 1);

	values.clear();
	for (Map.Entry<Integer, Integer> entry : freq.entrySet()) {
		for (int i = 0; i < entry.getValue(); i++) {
			values.add(entry.getKey());
		}
	}

	// Remove manually placed 8s for Saturday col 2 and 3
	values.remove((Integer) 8);
	values.remove((Integer) 8);

	while (!tryGenerate()) {
		Collections.shuffle(values);
	}
}

%>
<%
generateMatrix();
%>
<%

if (sem == null || div == null || cls == null || matrix == null) {
    out.println("<p style='color:red;'>Session attributes missing. Cannot proceed.</p>");
    return;
}

// Initialize nameMap
//Map<Integer, String> nameMap = new HashMap<>();
for (int i = 1; i <= 9; i++) {
    nameMap.put(i, "");
}

PreparedStatement pstmtt = null, spstmt = null;
ResultSet rss = null, srs = null;

try {
    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "Vaishnav");
    String sql = "SELECT * FROM assign_faculty WHERE as_sem = ? AND as_division = ? AND as_class = ?";
    pstmtt = conn.prepareStatement(sql);
    pstmtt.setString(1, sem);
    pstmtt.setString(2, div);
    pstmtt.setString(3, cls);
    rss = pstmtt.executeQuery();

    int cp3Index = 1, cp2NormalIndex = 6;
    boolean cp2RPAdded = false, cp1Added = false;

    while (rss.next()) {
        String code = rss.getString("AS_COURSE_CODE");
        if (code == null) continue;

        String subjectQuery = "SELECT * FROM subjects WHERE course_code = ?";
        spstmt = conn.prepareStatement(subjectQuery);
        spstmt.setString(1, code);
        srs = spstmt.executeQuery();

        if (srs.next()) {
            int cp = srs.getInt("cp");
            String acronym = srs.getString("acronym");
            String courseCode = srs.getString("COURSE_CODE").toUpperCase();

            if (cp == 3 && cp3Index <= 5) {
                nameMap.put(cp3Index++, acronym);
            } else if (cp == 2 && cp2NormalIndex <= 7) {
                nameMap.put(cp2NormalIndex++, acronym);
            } else if (cp == 2 && courseCode.contains("RP") && !cp2RPAdded) {
                nameMap.put(8, acronym);
                cp2RPAdded = true;
            } else if (cp == 1 && !cp1Added) {
                nameMap.put(9, acronym);
                cp1Added = true;
            }
        }
        srs.close();
        spstmt.close();
    }

    //Display nameMap for debugging
    //out.println("<h4>Subject Mappings:</h4><ul>");
    //for (int i = 1; i <= 9; i++) {
      //  out.println("<li>nameMap[" + i + "] = " + nameMap.get(i) + "</li>");
    //}
    //out.println("</ul>");

} catch (Exception e) {
    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    e.printStackTrace();
} finally {
    try {
        if (rss != null) rss.close();
        if (pstmtt != null) pstmtt.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Cleanup Error: " + e.getMessage() + "</p>");
    }
}

// Render timetable
String[] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
%>
<div class="my-5 card shadow">
						<table class="table table-bordered text-center">
							<thead class="table-dark">
								<tr>
									<th>Day/Time</th>
									<th>8:00 - 9:00 AM</th>
									<th>9:00 - 10:00 AM</th>
									<th>10:00 - 10:30 AM</th>
									<th>10:30 - 11:30 AM</th>
									<th>11:30 - 12:30 PM</th>
									<th>12:30 - 1:15 PM</th>
									<th>1:15 - 2:15 PM</th>
									<% 
										if(sem.equals("1") || sem.equals("2")){
											out.println("<th>2:15 - 3:15 PM</th>");
										}
									%>
								</tr>
							</thead>
							<tbody>
<%
for (int day = 0; day < 6; day++) {
    out.println("<tr>");
    out.println("<td style='background-color: #f0f0f0;'><strong>" + days[day] + "</strong></td>");

    for (int slot = 0; slot < 5; slot++) {
        int value = matrix[day][slot];
        String acronym = nameMap.getOrDefault(value, "N/A");

        String sub_code_new = "", fac = "", new_fac = "";
        boolean flag = false;

        try {
            // Get subject code by acronym
            String get_new_subject_code = "SELECT COURSE_CODE FROM subjects WHERE SEMESTER = ? AND ACRONYM = ?";
            PreparedStatement gnsc = conn.prepareStatement(get_new_subject_code);
            gnsc.setString(1, sem);
            gnsc.setString(2, acronym);
            ResultSet rsgnsc = gnsc.executeQuery();
            if (rsgnsc.next()) {
                sub_code_new = rsgnsc.getString("COURSE_CODE");
            }
            rsgnsc.close();
            gnsc.close();

            // Get previous faculty code from generated table
            String get_previous_subject_code = "SELECT FACULTY_CODE FROM generated_time_table WHERE DAY_NUMBER = ? AND PERIOD_NUMBER = ?";
            PreparedStatement gpsc = conn.prepareStatement(get_previous_subject_code);
            gpsc.setInt(1, day);
            gpsc.setInt(2, slot);
            ResultSet rsgpsc = gpsc.executeQuery();
            while(rsgpsc.next()) {
                fac = rsgpsc.getString("FACULTY_CODE");
            }
            rsgpsc.close();
            gpsc.close();

            // Get current faculty code from assign_faculty
            String get_new_faculty_code = "SELECT AS_FACULTY_CODE FROM assign_faculty WHERE AS_SEM = ? AND AS_DIVISION = ? AND AS_COURSE_CODE = ?";
            PreparedStatement gnfc = conn.prepareStatement(get_new_faculty_code);
            gnfc.setString(1, sem);
            gnfc.setString(2, div);
            gnfc.setString(3, sub_code_new);
            ResultSet rsgnfc = gnfc.executeQuery();
            if (rsgnfc.next()) {
                new_fac = rsgnfc.getString("AS_FACULTY_CODE");
            }
            rsgnfc.close();
            gnfc.close();

            // Compare
            if ((fac != "" && fac.equals(new_fac)) && new_fac != "") {
            	System.out.println(fac+""+new_fac);
            	flag = true;
            	
            }

        } catch (Exception e) {
            out.println("<td style='color:red;'>Err</td>");
            e.printStackTrace();
            continue;
        }
		
        if(!acronym.contains("RP") && flag){
        	%>
        	<script>
        	location.reload();
        	</script>
        	<%
        }
        
        // Show subject or mentor session
        String display = (value == 0) ? "Mentor Mentee" : acronym+" "+flag;
        out.println("<td>" + display + "</td>");

        // Breaks
        if (slot == 1)
            out.println("<td style='background-color: #e0e0e0;'><strong>Short Break</strong></td>");
        if (slot == 3)
            out.println("<td style='background-color: #e0e0e0;'><strong>Lunch Break</strong></td>");
    }
    out.println("</tr>");
}
}
%>

</tbody>
</table>
</div>
<div class="card shadow text-center flex justify-content-center flex-row align-items-center gap-3 mb-5">
		<form action="saveTimetable.jsp" method="post">
			<input type="hidden" name="matrixData" value="<%=encodeMatrixWithLabels(matrix, nameMap)%>">
			<input type="hidden" name="cls" value="<%=cls%>">
			<input type="hidden" name="div" value="<%=div%>">
			<input type="hidden" name="sem" value="<%=sem%>">
			<button type="submit" class="btn btn-primary">Save Time Table</button>
		</form>
		<button onclick="refreshPage()" class="btn btn-primary">Refresh Time Table</button>
</div>
					<form action="TimeTableDisplay.jsp" method="post">
						<input type="hidden" name="dep" value="<%=dep%>"> <input
							type="hidden" name="cls" value="<%=cls%>"> <input
							type="hidden" name="div" value="<%=div%>"> <input
							type="hidden" name="sem" value="<%=sem%>">
						<div class="card shadow">
							<table class="table table-bordered text-center">
								<thead class="table-dark">
									<tr>
										<th>Sr No</th>
										<th>Subject Code</th>
										<th>Credit Points</th>
										<th>Faculty Name</th>
										<th>Allocated Lectures</th>
									</tr>
								</thead>
								<tbody>
									<%
									int i = 0;
									String faculty_name = "";
									try {
										Class.forName("oracle.jdbc.driver.OracleDriver");
										conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "Vaishnav");
										String department = request.getParameter("department");
										String semester = request.getParameter("semester");
										String url = "SELECT * FROM assign_faculty WHERE AS_SEM = ? AND AS_CLASS = ? AND AS_DIVISION = ?";
										PreparedStatement pst = conn.prepareStatement(url);
										pst.setString(1, sem);
										pst.setString(2, cls);
										pst.setString(3, div);

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
										<td><%=i + 1%></td>
										<td><%=courseCode%></td>
										<td><%=cp%></td>
										<%
										String query = "SELECT * FROM facultys WHERE IDENTIFIER = ?";
										PreparedStatement pstmt = conn.prepareStatement(query);
										pstmt.setString(1, faculty_code);
										ResultSet rsf = pstmt.executeQuery();
										while (rsf.next()) {
											faculty_name = rsf.getString("name");
										}
										%>
										<td><%=faculty_name%></td>
										<td><%=available_lec%></td>
									</tr>

									<%
									//}
									i++;
									}
									} catch (Exception e) {
									e.printStackTrace();
									} finally {
									System.out.println("done : " + i);
									}
									%>
								</tbody>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%!String[] timeSlots = {"08:00 AM - 09:00 AM", "09:00 AM - 10:00 AM", "10:00 AM - 11:00 AM", "11:00 AM - 12:00 PM",
			"12:00 PM - 01:00 PM", "01:00 PM - 02:00 PM"};

	String[] periodLabels = {"1st", "2nd", "3rd", "4th", "5th", "6th"};

	// You can pass this map from main servlet/JSP page
	public String encodeMatrixWithLabels(int[][] matrix, Map<Integer, String> nameMap) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < matrix.length; i++) {
			for (int j = 0; j < matrix[i].length; j++) {
				int subjectCode = matrix[i][j];
				String subjectName = nameMap.getOrDefault(subjectCode, "Unknown");
				sb.append(subjectCode).append("|").append(periodLabels[j]).append("|").append(timeSlots[j]).append("|")
						.append(subjectName); // append subject name
				if (j < matrix[i].length - 1) {
					sb.append(",");
				}
			}
			sb.append(";");
		}
		return sb.toString();
	}%>


	<script type="text/javascript">
        function refreshPage() {
            // Refresh the current page
            location.reload();
        }
    </script>
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