package com.ems.dao.AdminPortal.EmployeeManagementFeature;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AddEmployeeDao 
{
	@Autowired
    private JdbcTemplate jdbcTemplate;

    public boolean isEmployeeIdExists(String empId) 
    {
        String sql = "SELECT COUNT(*) FROM employees WHERE employee_id = ?";
        Integer count = jdbcTemplate.queryForObject(sql, new Object[]{empId}, Integer.class);
        return count != null && count > 0;
    }

    public boolean isDepartmentExists(String department) 
    {
        String sql = "SELECT COUNT(*) FROM departments WHERE department_name = ?";
        Integer count = jdbcTemplate.queryForObject(sql, new Object[]{department}, Integer.class);
        return count != null && count > 0;
    }

    public void addEmployee(String id, String name, String email, String phone, String date, String dept, String loc, double salary) 
    {
        String sql = "INSERT INTO employees (employee_id, employee_name, email, phone_number, joining_date, department, location, salary) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, id, name, email, phone, date, dept, loc, salary);
    }

}
