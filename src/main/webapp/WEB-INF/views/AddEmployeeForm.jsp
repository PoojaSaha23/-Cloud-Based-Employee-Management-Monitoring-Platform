<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false"%>

<h2>Add Employee</h2>

<c:if test="${not empty error}">
    <div class="error-message">${error}</div>
</c:if>

<c:if test="${not empty success}">
    <div class="success-message">${success}</div>
</c:if>

<form id="AddEmployeeForm" action="${pageContext.request.contextPath}/addEmployee" method="post">
    <label>Employee ID:</label>
    <input type="text" name="employeeId" required><br>

    <label>Employee Name:</label>
    <input type="text" name="employeeName" required><br>

    <label>Email:</label>
    <input type="email" name="email" required><br>

    <label>Phone Number:</label>
    <input type="text" name="phoneNumber" required><br>

    <label>Joining Date (dd/mm/yyyy):</label>
    <input type="text" name="joiningDate" required><br>

    <label>Department:</label>
    <input type="text" name="department" required><br>

    <label>Location:</label>
    <input type="text" name="location" required><br>

    <label>Salary:</label>
    <input type="text" name="salary" required><br>

    <button type="submit">Add Employee</button>
</form>
