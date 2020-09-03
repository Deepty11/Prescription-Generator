package com.rehnuma.web.UserStories.controller;

import com.rehnuma.web.UserStories.model.Prescription;
import com.rehnuma.web.UserStories.model.User;
import com.rehnuma.web.UserStories.services.UserInfoDetails;
import com.rehnuma.web.UserStories.services.UserServices;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);


    public static User getLoggedInUser() {
        Authentication authentication= SecurityContextHolder.getContext().getAuthentication();
        if(authentication instanceof AnonymousAuthenticationToken){
            logger.error("Not logged in");
            return null;
        }
        UsernamePasswordAuthenticationToken auth = (UsernamePasswordAuthenticationToken)authentication;

        if (!(auth.getPrincipal() instanceof UserInfoDetails)) {
            throw new IllegalArgumentException("Principal cannot be null");
        }
        return ((UserInfoDetails) auth.getPrincipal()).getUser();

    }

    @Autowired
    private UserServices userServices;

    @GetMapping("/login")
    public String login(ModelMap model) {
        model.addAttribute("user", new User());
        return "index";
    }

    @PostMapping("/login")
    public void login(){
        System.out.println("Hi there!");
    }
    @RequestMapping("/logout")
    public String logout(){
        SecurityContextHolder.getContext().setAuthentication(null);
        return "redirect:/login";
    }


    @GetMapping("/home")
    public String home(HttpServletRequest request, Model model) {
        model.addAttribute("prescription", new Prescription());
        return "home";
    }


}
