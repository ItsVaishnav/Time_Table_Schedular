<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    
    <%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    String[] subjects = new String[7]; // For 7 subjects

    try {
    	Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "system", "Vaishnav");
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT * FROM subjects");

        int i = 0;
        while (rs.next() && i < 7) {
            subjects[i] = rs.getString("COURSE_TITLE"); // Use correct column name
            i++;
        }
    } catch (Exception e) {
        out.println("Error: " + e);
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    }
%>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Dashboard Analytics</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <style>
    
    	.main-body{
    		margin-left : 260px;
    		
    	}
    	
        .sidebar {
            animation: slideIn 0.5s ease-in-out;
            position: fixed;
            height : 100vh;
            background: linear-gradient(to bottom, #3b82f6 150px, white 150px);
        }

        @keyframes slideIn {
            from {
                transform: translateX(-100%);
            }
            to {
                transform: translateX(0);
            }
        }

        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        body {
            background: url('https://www.transparenttextures.com/patterns/cubes.png');
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            z-index: 1000;
            background: white;
            border: 1px solid #e5e7eb;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.3s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .dropdown-menu.show {
            display: block;
        }

        .dropdown-menu li {
            padding: 8px 12px;
            transition: background 0.2s ease;
        }

        .dropdown-menu li:hover {
            background: #f3f4f6;
        }

        .notification-icon {
            position: relative;
        }

        .notification-icon .badge {
            position: absolute;
            top: -5px;
            right: -10px;
            background: red;
            color: white;
            border-radius: 50%;
            padding: 2px 5px;
            font-size: 0.75rem;
        }

        @media (max-width: 768px) {
            .sidebar-text {
                display: none;
            }
            .sidebar {
                width: 64px;
            }
            .sidebar .dropdown-toggle {
                justify-content: center;
            }
        }
        
        
         .timeTable {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 20px;
            padding: 0;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin: 20px 0;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th {
            background-color: #1da0f2;  /* Primary Blue */
            color: white;
            padding: 12px;
            text-transform: uppercase;
            font-weight: bold;
        }

        td {
            background-color: #E3F2FD;  /* Light Blue */
            color: #0D47A1;            /* Dark Blue Text */
            padding: 10px;
            text-align: center;
            transition: background-color 0.3s ease;
        }

        td:hover {
            background-color: #D0E7FF;  /* Hover Effect */
        }

        @media (max-width: 768px) {
            table, th, td {
                font-size: 14px;
                padding: 8px;
            }
        }

        .controls {
            text-align: center;
            margin-bottom: 20px;
        }

        .controls button {
            background-color: #1da0f2;;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 5px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .controls button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body class="bg-gray-100">
<div class="flex h-screen">
    <!-- Sidebar -->
    <div class="bg-white w-64 p-4 shadow-lg sidebar mt-4 ml-4 rounded-lg">
        <div class="flex flex-col items-center space-y-2 p-2 mb-5">
            <img alt="User profile picture" class="w-16 h-16 rounded-full cursor-pointer" src="images/Profile.png"/>
            <div class="relative">
                <button class="font-semibold text-lg focus:outline-none dropdown-toggle">
                    ZEAL Scheduler
                    <i class="fas fa-chevron-down ml-2"></i>
                </button>
                <ul class="dropdown-menu mt-2">
                    <li class="p-2 hover:bg-gray-100">
                        <i class="fas fa-user-circle mr-2 text-blue-500"></i>
                        <a href="#" class="text-gray-700">View Profile</a>
                    </li>
                    <li class="p-2 hover:bg-gray-100">
                        <i class="fas fa-sign-out-alt mr-2 text-blue-500"></i>
                        <a href="#" class="text-gray-700">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
        <nav>
            <ul>
                <!-- ADD Option -->
                <li class="mb-2">
                    <div class="relative">
                        <button class="flex items-center p-2 text-gray-700 hover:bg-gray-100 rounded-lg w-full dropdown-toggle">
                            <i class="fas fa-plus mr-2 text-blue-500"></i>
                            ADD
                            <i class="fas fa-chevron-down ml-auto text-gray-400"></i>
                        </button>
                        <ul class="dropdown-menu mt-2">
                            <li class="p-2 hover:bg-gray-100">
                                <a href="#" class="text-gray-700">Department</a>
                            </li>
                            <li class="p-2 hover:bg-gray-100">
                                <a href="#" class="text-gray-700">Classes</a>
                            </li>
                            <li class="p-2 hover:bg-gray-100">
                                <a href="#" class="text-gray-700">Division</a>
                            </li>
                            <li class="p-2 hover:bg-gray-100">
                                <a href="#" class="text-gray-700">Subject</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <!-- View Option -->
                <!-- Generate Time Table Option -->
                <li class="mb-2">
                    <a class="flex items-center p-2 text-gray-700 hover:bg-gray-100 rounded-lg" href="Faculty.jsp">
                        <i class="fas fa-calendar-alt mr-2 text-blue-500"></i>
                        Default Time Table
                    </a>
                </li>
                <li class="mb-2">
                    <a class="flex items-center p-2 text-gray-700 hover:bg-gray-100 rounded-lg" href="CLassTimeTable.jsp">
                        <i class="fas fa-calendar-alt mr-2 text-blue-500"></i>
                        Class Time Table 
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    <!-- Main Content -->
     <div class="main-body">
    <div class="flex-1 p-6">
        <div class="bg-blue-500 p-4 rounded-lg mb-6 navnav">
            <div class="flex justify-between items-center">
                <h1 class="text-2xl font-semibold text-white">Dashboard Analytics</h1>
                <div class="flex items-center space-x-4">
                    
                    <i class="fas fa-user-circle text-white"></i>
                </div>
            </div>
        </div>
        
        <div>
        <!-- Working page -->
        <div id="makepdf">
<div class="timeTable">

    <div class="controls">
        <button>Select Year</button>
        <button>Select Semester</button>
    </div>

    <table border="1">
        <tr>
            <th>Day/Time</th>
            <th>8:00 - 9:00 AM</th>
            <th>9:00 - 10:00 AM</th>
            <th>10:00 - 10:30 AM</th>
            <th>10:30 - 11:30 PM</th>
            <th>11:30 - 12:30 PM</th>
            <th>12:30 - 1:15 PM</th>
            <th>1:15 - 2:15 PM</th>
            <th>2:15 - 3:15 PM</th>
        </tr>
      <tr>
        <td>Monday</td>
        <td><%= subjects[0] != null ? subjects[0] : "Free" %></td>
        <td><%= subjects[1] != null ? subjects[1] : "Free" %></td>
        <td>Short Break</td>
        <td><%= subjects[2] != null ? subjects[2] : "Free" %></td>
        <td><%= subjects[3] != null ? subjects[3] : "Free" %></td>
        <td>Lunch Break</td>
        <td><%= subjects[4] != null ? subjects[4] : "Free" %></td>
        <td><%= subjects[5] != null ? subjects[5] : "Free" %></td>
    </tr>
         <tr>
        <td>Tuesday</td>
        <td><%= subjects[6] != null ? subjects[6] : "Free" %></td>
        <td><%= subjects[0] != null ? subjects[0] : "Free" %></td>
        <td>Short Break</td>
        <td><%= subjects[1] != null ? subjects[1] : "Free" %></td>
        <td><%= subjects[2] != null ? subjects[2] : "Free" %></td>
        <td>Lunch Break</td>
        <td><%= subjects[3] != null ? subjects[3] : "Free" %></td>
        <td><%= subjects[4] != null ? subjects[4] : "Free" %></td>
    </tr>
    
         <tr>
        <td>Wensday</td>
        <td><%= subjects[6] != null ? subjects[6] : "Free" %></td>
        <td><%= subjects[0] != null ? subjects[0] : "Free" %></td>
        <td>Short Break</td>
        <td><%= subjects[1] != null ? subjects[1] : "Free" %></td>
        <td><%= subjects[2] != null ? subjects[2] : "Free" %></td>
        <td>Lunch Break</td>
        <td><%= subjects[3] != null ? subjects[3] : "Free" %></td>
        <td><%= subjects[4] != null ? subjects[4] : "Free" %></td>
    </tr>
    
         <tr>
        <td>Thursday</td>
        <td><%= subjects[6] != null ? subjects[6] : "Free" %></td>
        <td><%= subjects[0] != null ? subjects[0] : "Free" %></td>
        <td>Short Break</td>
        <td><%= subjects[1] != null ? subjects[1] : "Free" %></td>
        <td><%= subjects[2] != null ? subjects[2] : "Free" %></td>
        <td>Lunch Break</td>
        <td><%= subjects[3] != null ? subjects[3] : "Free" %></td>
        <td><%= subjects[4] != null ? subjects[4] : "Free" %></td>
    </tr>
      <tr>
        <td>Friday</td>
        <td><%= subjects[6] != null ? subjects[6] : "Free" %></td>
        <td><%= subjects[0] != null ? subjects[0] : "Free" %></td>
        <td>Short Break</td>
        <td><%= subjects[1] != null ? subjects[1] : "Free" %></td>
        <td><%= subjects[2] != null ? subjects[2] : "Free" %></td>
        <td>Lunch Break</td>
        <td><%= subjects[3] != null ? subjects[3] : "Free" %></td>
        <td><%= subjects[4] != null ? subjects[4] : "Free" %></td>
    </tr>
    
          <tr>
        <td>Saturday</td>
        <td><%= subjects[6] != null ? subjects[6] : "Free" %></td>
        <td><%= subjects[0] != null ? subjects[0] : "Free" %></td>
        <td>Short Break</td>
        <td><%= subjects[1] != null ? subjects[1] : "Free" %></td>
        <td><%= subjects[2] != null ? subjects[2] : "Free" %></td>
        <td>Lunch Break</td>
        <td><%= subjects[3] != null ? subjects[3] : "Free" %></td>
        <td><%= subjects[4] != null ? subjects[4] : "Free" %></td>
    </tr>
    
    </table>
    
    </div>
<div>
    <div class="controls">
        <h1>Faculty Allocation</h1>
    </div>

    <table border="1">
        <tr>
            <th>Course Code</th>
            <th>Acronym</th>
            <th>Name of Course</th>
            <th>Credit Points</th>
            <th>Name of Course Coordinator</th>
        </tr>
        <tr>
            <td>IT12</td>
            <td>JP</td>
            <td>Java Programming</td>
            <td>3</td>
            <td>Dr.Rupali Kalekar (RK)</td>
        </tr>
        <tr>
            <td>IT12</td>
            <td>JP</td>
            <td>Java Programming</td>
            <td>3</td>
            <td>Dr.Rupali Kalekar (RK)</td>
        </tr>
        <tr>
            <td>IT12</td>
            <td>JP</td>
            <td>Java Programming</td>
            <td>3</td>
            <td>Dr.Rupali Kalekar (RK)</td>
        </tr>
        <tr>
            <td>IT12</td>
            <td>JP</td>
            <td>Java Programming</td>
            <td>3</td>
            <td>Dr.Rupali Kalekar (RK)</td>
        </tr>
        <tr>
            <td>IT12</td>
            <td>JP</td>
            <td>Java Programming</td>
            <td>3</td>
            <td>Dr.Rupali Kalekar (RK)</td>
        </tr>
        <tr>
            <td>IT12</td>
            <td>JP</td>
            <td>Java Programming</td>
            <td>3</td>
            <td>Dr.Rupali Kalekar (RK)</td>
        </tr>
    </table>
    <button id="button">Print</button>
    </div>
  </div> 
        </div>
        
        </div>
    </div>
</div>
</div>
<script>
    document.querySelectorAll('.dropdown-toggle').forEach(button => {
        button.addEventListener('click', function(event) {
            event.stopPropagation();
            const dropdownMenu = this.nextElementSibling;
            dropdownMenu.classList.toggle('show');
        });
    });

    // Close dropdowns when clicking outside
    window.addEventListener('click', function() {
        document.querySelectorAll('.dropdown-menu').forEach(menu => {
            menu.classList.remove('show');
        });
    });
</script>
</body>
</html>