<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>
<html>
<head>
<title>Employee Management & Monitoring System</title>
<link rel="stylesheet" href="<c:url value='/static/css/style.css'/>" />
<script src="<c:url value='/static/js/LoginHomeSlideshow.js'/>"></script>
</head>
<body>
	<!-- HEADER -->
	<div class="header">
		<div class="right">
			<div class="nav">
				<a href="<c:url value='/EmployeePortal'/>"
					class="login-btn">Login as Employee</a> 
				<a href="<c:url value='/HRPortal'/>" 
					class="login-btn">Loginas HR</a> 
				<a href="<c:url value='/AdminPortal'/>"
					class="login-btn">Login as Admin</a>
			</div>

		</div>
	</div>

	<!-- SLIDESHOW -->
	<div class="slideshow-container">
    <c:forEach var="img" items="${images}" varStatus="status">
        <img class="mySlides"
             src="<c:url value='/images/${img}'/>"
             style="${status.index == 0 ? '' : 'display:none'}" />
    </c:forEach>
</div>
</body>
</html>
