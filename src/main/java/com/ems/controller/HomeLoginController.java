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
    @GetMapping("/")
    public String homePage(Model model) 
    {
        return "HomeLogin";  // JSP file name
    }
}
