<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>Admin Portal</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
    <script>
        // JS to toggle submenu display
        function showSubmenu(feature) {
            const submenuPanels = {
                'EmployeeManagement': [
                    { name: 'Add Employee', url: '${pageContext.request.contextPath}/AddEmployee' },
                    { name: 'Edit Employee', url: '${pageContext.request.contextPath}/EditEmployee' },
                    { name: 'View Employees', url: '${pageContext.request.contextPath}/ViewEmployees' },
                    { name: 'Delete Employee', url: '${pageContext.request.contextPath}/DeleteEmployee' }
                ],
                'HRAdminManagement': [
                    { name: 'Add HR', url: '${pageContext.request.contextPath}/AddHR' },
                    { name: 'Edit HR', url: '${pageContext.request.contextPath}/EditHR' }
                ],
                'LeaveAttendance': [
                    { name: 'View Leave Requests', url: '${pageContext.request.contextPath}/ViewLeaveRequests' },
                    { name: 'Approve Leave', url: '${pageContext.request.contextPath}/ApproveLeave' }
                ],
                'SalaryPayroll': [
                    { name: 'View Payroll', url: '${pageContext.request.contextPath}/ViewPayroll' },
                    { name: 'Edit Payroll', url: '${pageContext.request.contextPath}/EditPayroll' }
                ],
                'ReportsAnalytics': [
                    { name: 'Generate Report', url: '${pageContext.request.contextPath}/GenerateReport' }
                ],
                'SecurityAudit': [
                    { name: 'View Logs', url: '${pageContext.request.contextPath}/ViewLogs' }
                ]
            };

            const submenuDiv = document.getElementById('submenu-panel');
            const submenuList = submenuDiv.querySelector('ul');
            submenuList.innerHTML = ''; // Clear old submenu

            if (submenuPanels[feature]) {
                submenuPanels[feature].forEach(item => {
                    const li = document.createElement('li');
                    const a = document.createElement('a');
                    a.href = item.url;
                    a.textContent = item.name;
                    li.appendChild(a);
                    submenuList.appendChild(li);
                });
                submenuDiv.style.display = 'block';
            } else {
                submenuDiv.style.display = 'none';
            }
        }
    </script>
</head>
<body>
<div class="admin-layout">
    <!-- Sidebar -->
    <div class="admin-sidebar">
        <h2>Admin Portal</h2>
        <hr>
        <ul class="menu">
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Help</a></li>
        </ul>
    </div>

    <!-- Header Bar with main features -->
    <div class="header-bar">
        <ul class="main-features">
            <li onclick="showSubmenu('EmployeeManagement')">Employee Management</li>
            <li onclick="showSubmenu('HRAdminManagement')">HR & Admin Management</li>
            <li onclick="showSubmenu('LeaveAttendance')">Leave & Attendance</li>
            <li onclick="showSubmenu('SalaryPayroll')">Salary & Payroll</li>
            <li onclick="showSubmenu('ReportsAnalytics')">Reports & Analytics</li>
            <li onclick="showSubmenu('SecurityAudit')">Security & Audit</li>
        </ul>
    </div>

    <!-- Submenu panel -->
    <div class="submenu-panel" id="submenu-panel" style="display:none;">
        <ul class="submenu"></ul>
    </div>

    <!-- Main content area -->
    <div class="main-content">
        <h2>Welcome to Admin Dashboard</h2>
        <p>Select a main feature from the header above to see options.</p>
    </div>
</div>
</body>
</html>
