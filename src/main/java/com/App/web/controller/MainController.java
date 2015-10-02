package com.App.web.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.App.users.dao.UserDao;
import com.App.users.model.User;
import com.App.users.service.UserService;



@Controller
public class MainController {
	
	private UserService userService;
	private final Logger logger = LoggerFactory.getLogger(MainController.class);

	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public  ModelAndView defaultPage() {

		ModelAndView model = new ModelAndView();
		
		model.setViewName("home");
		return model;

	}

	

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This page is for ROLE_ADMIN only!");
		model.setViewName("admin");

		return model;

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;

	}
	 @RequestMapping(value="/logout", method = RequestMethod.GET)
	    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	        if (auth != null){    
	            new SecurityContextLogoutHandler().logout(request, response, auth);
	        }
	        return "redirect:/login?logout";
	    }
	 
	private String getErrorMessage(HttpServletRequest request, String key) {

		Exception exception = (Exception) request.getSession().getAttribute(key);

		String error = "";
		if (exception instanceof BadCredentialsException) {
			error = "Invalid username and password!";
		} else if (exception instanceof LockedException) {
			error = exception.getMessage();
		} else {
			error = "Invalid username and password!";
		}

		return error;
	}
   
	//for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();
		
		//check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
		
			model.addObject("username", userDetail.getUsername());
			
		}
		
		model.setViewName("403");
		return model;

	}

	
	

	@Secured({"ROLE_USER","ROLE_ADMIN"})
	@RequestMapping(value="/common", method = RequestMethod.GET)
	public String common(ModelMap model) {
	 
	return "common_page";
	 
	}
	
	

	
	// list page
	
	  UserDao userdao;
		@RequestMapping(value = "/listUsers", method = RequestMethod.GET)
		public ModelAndView showAllUsers() throws Exception  {
			//map.put("user", new User());
			//map.put("userList", userService.listUser());
			List <User> users =   userdao.listUser();
			//return "/user/listUsers";
			return new ModelAndView("/user/listUsers","userList",users);


		}
		@RequestMapping("/get/{userId}")
		public String getUser(@PathVariable Integer userId, Map<String, Object> map) {

			User user = userService.getUser(userId);

			map.put("user", user);

			return "/user/userForm";
		}

		@RequestMapping(value = "/save", method = RequestMethod.POST)
		public String saveUser(@ModelAttribute("user") User user,
				BindingResult result) {

			userService.saveUser(user);

			/*
			 * Note that there is no slash "/" right after "redirect:" So, it
			 * redirects to the path relative to the current path
			 */
			return "redirect:listUsers";
		}

		@RequestMapping("/delete/{userId}")
		public String deleteUser(@PathVariable("userId") Integer id) {

			userService.deleteUser(id);

			/*
			 * redirects to the path relative to the current path
			 */
			// return "redirect:../listUsers";

			/*
			 * Note that there is the slash "/" right after "redirect:" So, it
			 * redirects to the path relative to the project root path
			 */
			return "redirect:/user/listUsers";
		}

}