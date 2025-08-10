<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>

<div class="login-container">
    <h2>Admin Login</h2>
    
    <c:if test="${not empty errorMessage}">
        <div class="error-msg">${errorMessage}</div>
    </c:if>
    
    <form action="AdminLoginServlet" method="post">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" placeholder="Enter admin username" required autofocus />
        
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter password" required />
        
        <input type="submit" value="Login" />
    </form>
</div>

</body>
</html>
