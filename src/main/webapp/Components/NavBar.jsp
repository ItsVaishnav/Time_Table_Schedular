<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Dashboard Analytics</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <style>
        .sidebar {
            animation: slideIn 0.5s ease-in-out;
            position: relative;
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
                <li class="mb-2">
                    <div class="relative">
                        <button class="flex items-center p-2 text-gray-700 hover:bg-gray-100 rounded-lg w-full dropdown-toggle">
                            <i class="fas fa-eye mr-2 text-blue-500"></i>
                            View
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
                                <a href="#" class="text-gray-700">Faculty</a>
                            </li>
                            <li class="p-2 hover:bg-gray-100">
                                <a href="#" class="text-gray-700">Subject</a>
                            </li>
                            <li class="p-2 hover:bg-gray-100">
                                <a href="#" class="text-gray-700">Time Table</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <!-- Generate Time Table Option -->
                <li class="mb-2">
                    <a class="flex items-center p-2 text-gray-700 hover:bg-gray-100 rounded-lg" href="#">
                        <i class="fas fa-calendar-alt mr-2 text-blue-500"></i>
                        Generate Time Table
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    <!-- Main Content -->
    <div class="flex-1 p-6">
        <div class="bg-blue-500 p-4 rounded-lg mb-6">
            <div class="flex justify-between items-center">
                <h1 class="text-2xl font-semibold text-white">Dashboard Analytics</h1>
                <div class="flex items-center space-x-4">
                    
                    <i class="fas fa-user-circle text-white"></i>
                </div>
            </div>
        </div>
        <!-- Grid with 4 boxes per row -->
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6 mb-6">
            <!-- Card 1: Department -->
            <div class="bg-white p-6 rounded-lg shadow-lg card flex flex-col items-center justify-center">
                <img alt="Department icon" class="w-16 h-16 mb-4" src="images/department.png"/>
                <h2 class="text-xl font-semibold text-center">Department</h2>
            </div>
            <!-- Card 2: Class -->
            <div class="bg-white p-6 rounded-lg shadow-lg card flex flex-col items-center justify-center">
                <img alt="Class icon" class="w-16 h-16 mb-4" src="images/Class.png"/>
                <h2 class="text-xl font-semibold text-center">Class</h2>
            </div>
            <!-- Card 3: Division -->
            <div class="bg-white p-6 rounded-lg shadow-lg card flex flex-col items-center justify-center">
                <img alt="Division icon" class="w-16 h-16 mb-4" src="images/Division,png.png"/>
                <h2 class="text-xl font-semibold text-center">Division</h2>
            </div>
            <!-- Card 4: Faculty -->
            <div class="bg-white p-6 rounded-lg shadow-lg card flex flex-col items-center justify-center">
                <img alt="Faculty icon" class="w-16 h-16 mb-4" src="images/Teacher.png"/>
                <h2 class="text-xl font-semibold text-center">Faculty</h2>
            </div>
            <!-- Card 5: Subject -->
            <div class="bg-white p-6 rounded-lg shadow-lg card flex flex-col items-center justify-center">
                <img alt="Subject icon" class="w-16 h-16 mb-4" src="images/Books.png"/>
                <h2 class="text-xl font-semibold text-center">Subject</h2>
            </div>
            <!-- Card 6: Time Table -->
            <div class="bg-white p-6 rounded-lg shadow-lg card flex flex-col items-center justify-center">
                <img alt="Time Table icon" class="w-16 h-16 mb-4" src="images/TImeTable.png"/>
                <h2 class="text-xl font-semibold text-center">Time Table</h2>
            </div>
            <!-- Card 7: Attendance -->
            <div class="bg-white p-6 rounded-lg shadow-lg card flex flex-col items-center justify-center">
                <img alt="Attendance icon" class="w-16 h-16 mb-4" src="https://cdn-icons-png.flaticon.com/512/3135/3135755.png"/>
                <h2 class="text-xl font-semibold text-center">Labs</h2>
            </div>
            <!-- Card 8: Reports -->
            <div class="bg-white p-6 rounded-lg shadow-lg card flex flex-col items-center justify-center">
                <img alt="Reports icon" class="w-16 h-16 mb-4" src="images/Class.png"/>
                <h2 class="text-xl font-semibold text-center">Class Room</h2>
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