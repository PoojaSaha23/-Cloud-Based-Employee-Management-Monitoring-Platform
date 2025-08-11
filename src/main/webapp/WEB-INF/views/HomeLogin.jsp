<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<html>
<head>
    <title>Employee Management System</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
<div class="container">
    <!-- Sidebar -->
    <div class="home-sidebar">
        <div class="sidebar-content">
            <h1>Employee Management System</h1>
            <p>
                This project manages employees, HR, and admins in real-time. 
                Admins can manage employee records, HR can handle recruitment and payroll, 
                and employees can view and update their profiles.
            </p>
        </div>
    </div>

    <!-- Main area -->
    <div class="main-area">
        <header>
            <div class="top-right">
                <button onclick="openPopup('Employee')">Login as Employee</button>
                <button onclick="openPopup('HR')">Login as HR</button>
                <button onclick="openPopup('Admin')">Login as Admin</button>
            </div>
        </header>

        <!-- Popup -->
        <div id="popup" class="popup-overlay">
            <div class="popup-box">
                <span class="popup-close" onclick="closePopup()">&times;</span>
                <h2 id="popup-title"></h2>

                <c:if test="${not empty error}">
                    <div class="error-message">${error}</div>
                </c:if>

                <form id="loginForm" method="post">
                    <input type="text" name="username" placeholder="Username" required>
                    <input type="password" name="password" placeholder="Password" required>
                    <button type="submit" class="popup-btn primary">Login</button>
                    <button type="button" class="popup-btn secondary" onclick="closePopup()">Cancel</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // Function to open popup for specific role
    function openPopup(role) {
        document.getElementById("popup-title").innerText = "Login as " + role;
        document.getElementById("loginForm").action = "${pageContext.request.contextPath}/" + role + "PortalLogin";
        document.getElementById("popup").style.display = "flex";
    }

    // Close popup
    function closePopup() {
        document.getElementById("popup").style.display = "none";
    }

    // Auto-open popup if error exists (to show error message)
    window.onload = function () {
        <c:if test="${not empty error}">
            document.getElementById("popup").style.display = "flex";
        </c:if>
    }
</script>
</body>
</html>
