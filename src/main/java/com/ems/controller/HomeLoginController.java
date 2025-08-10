package com.ems.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class HomeLoginController 
{
	@Value("${image.folder.path}")
    private String imageFolderPath;

    @GetMapping("/")
    public String homePage(Model model) 
    {
    	File folder = new File(imageFolderPath);
        List<String> imageList = new ArrayList<>();

        if (folder.exists() && folder.isDirectory()) 
        {
            File[] files = folder.listFiles((dir, name) -> 
            {
                String lowercase = name.toLowerCase();
                return lowercase.endsWith(".jpg") ||
                       lowercase.endsWith(".jpeg") ||
                       lowercase.endsWith(".png") ||
                       lowercase.endsWith(".gif");
            });

            if (files != null) 
            {
                Arrays.sort(files); // Optional: sort alphabetically
                for (File file : files) 
                {
                    // Skip logo and key icon from slideshow
                    if (!file.getName().equalsIgnoreCase("logo.png") &&
                        !file.getName().equalsIgnoreCase("key.jpg")) 
                    {
                        imageList.add(file.getName());
                    }
                }
            }
        }

        // 3. Pass only file names
        model.addAttribute("images", imageList);

        return "HomeLogin";  // JSP file name
    }

    @GetMapping("/AdminPortal")
    public String adminLogin() 
    {
        return "adminLogin";
    }

    @GetMapping("/HRPortal")
    public String hrLogin() 
    {
        return "hrLogin";
    }

    @GetMapping("/EmployeePortal")
    public String employeeLogin() 
    {
        return "employeeLogin";
    }

}
