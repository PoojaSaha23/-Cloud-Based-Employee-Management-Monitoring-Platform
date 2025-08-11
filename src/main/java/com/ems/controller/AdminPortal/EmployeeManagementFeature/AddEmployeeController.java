package com.ems.controller.AdminPortal.EmployeeManagementFeature;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ems.dao.AdminPortal.EmployeeManagementFeature.AddEmployeeDao;
import com.ems.model.AdminPortal.EmployeeManagementFeature.AddEmployee;

@Controller
public class AddEmployeeController 
{
	@Autowired
	private AddEmployeeDao addEmployeeDao;
	@GetMapping("/loadAddEmployeeForm")
	public String loadAddEmployeeForm() 
	{
	    // Return the JSP fragment (form only, no <html> or <body> tags)
	    return "AddEmployeeForm";  
	}


	@PostMapping("/addEmployee")
	public ModelAndView addEmployee(@ModelAttribute AddEmployee emp) 
	{
	    ModelAndView mv = new ModelAndView("AddEmployeeForm");

	    // Validation
	    if (!emp.getEmployeeName().matches("^[A-Za-z ]+$")) 
	    {
	        mv.addObject("error", "Employee Name must contain only alphabets.");
	        return mv;
	    }
	    if (!emp.getEmail().contains("@")) 
	    {
	        mv.addObject("error", "Invalid email format.");
	        return mv;
	    }
	    if (!emp.getPhoneNumber().matches("\\d{10}")) 
	    {
	        mv.addObject("error", "Phone Number must be 10 digits.");
	        return mv;
	    }
//	    if (!emp.getSalary().toString().matches("\\d+(\\.\\d+)?")) 
//	    {
//	        mv.addObject("error", "Salary must be numeric.");
//	        return mv;
//	    }
	    if (addEmployeeDao.isEmployeeIdExists(emp.getEmployeeId())) 
	    {
	        mv.addObject("error", "Employee ID already exists.");
	        return mv;
	    }
	    if (!addEmployeeDao.isDepartmentExists(emp.getDepartment())) 
	    {
	        mv.addObject("error", "Department does not exist.");
	        return mv;
	    }

	    // Save to DB
	    addEmployeeDao.addEmployee(emp.getEmployeeId(), emp.getEmployeeName(), emp.getEmail(), emp.getPhoneNumber(), emp.getJoiningDate(), emp.getDepartment(), emp.getLocation(), emp.getSalary());

	    mv.addObject("success", "Employee added successfully!");
	    return mv;
	}
}
