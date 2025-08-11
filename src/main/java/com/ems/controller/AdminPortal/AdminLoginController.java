package com.ems.controller.AdminPortal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ems.dao.AdminPortal.AdminLoginDao;
import com.ems.model.AdminPortal.AdminLogin;
@Controller
public class AdminLoginController 
{
	@Autowired
	 private AdminLoginDao adminLoginDao;

	    @PostMapping("/AdminPortalLogin")
	    public ModelAndView adminLogin(@ModelAttribute AdminLogin adminlogin) {
	        ModelAndView mv = new ModelAndView();

	        // Validate inputs of username
	        if (adminlogin.getUsername() == null || adminlogin.getUsername().trim().isEmpty()) 
	        {
	            mv.addObject("error", "Username cannot be blank.");
	            mv.setViewName("HomeLogin"); // reload popup
	            return mv;
	        }
	        if (adminlogin.getPassword() == null || adminlogin.getPassword().trim().isEmpty()) 
	        {
	            mv.addObject("error", "Password cannot be blank.");
	            mv.setViewName("HomeLogin");
	            return mv;
	        }

	        // DB authentication
	        int count = adminLoginDao.validateAdmin(adminlogin.getUsername(), adminlogin.getPassword());
	        if (count == 0) 
	        {
	        	mv.addObject("error", "Invalid username or password.");
	            mv.setViewName("HomeLogin");
	            
	        } 
	        else 
	        {
	        	mv.setViewName("AdminHome"); // success
	        }
	        return mv;
	    }
}
