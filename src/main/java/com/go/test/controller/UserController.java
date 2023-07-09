package com.go.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.go.test.model.User;
import com.go.test.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserController {
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/")
	public String SignUpForm() {
		return "signUp";
	}

	@PostMapping("/userSignUp")
	@ResponseBody
	public String signUp(@RequestBody User user) {
		
		if(userService.findByUserId(user.getUserId())!=null) {
			return "fail";
			
		}
		String hashedPassword = passwordEncoder.encode(user.getUserPwd());
	    user.setUserPwd(hashedPassword);
		userService.signUp(user);
		
		return "success";
	}
	
	@PostMapping("/findByUserId")
	@ResponseBody
	public String findByUserId(@RequestParam("userId") String userId) {
	    if (userService.findByUserId(userId) != null) {
	        return "duplicate";
	    } else {
	        return "available";
	    }
	}
	
	@GetMapping("/userSignIn")
	public String signInForm() {
		return "signIn";
	}
	
	@PostMapping("/userSignIn") 
	@ResponseBody
	public String signIn (String userId, String userPwd, HttpSession session) {
		
		User user = userService.findByUserId(userId);
		String result = "no";
		if (user!=null) {
			if(passwordEncoder.matches(userPwd, user.getUserPwd())) {
				System.out.println(userPwd);
				session.setAttribute("cUser", user);
				
				result = "success";
			
			} else {
				System.out.println("fail일때");
				result = "fail";
			
			}
		}
		
		return result;
	}
	
	@GetMapping("/userSignOut") 
	public String signOut(HttpSession session) {
		session.removeAttribute("cUser");
		return "redirect:/";
	}
	
	@GetMapping("/userList")
	public String userList(Model model) {
		
		model.addAttribute("userList", userService.findAll());
		
		return "userList";
	}
	
	@GetMapping("/userUpdate/{userId}")
	public String userUpdate(@PathVariable("userId") String userId, Model model) {
	    model.addAttribute("user", userService.findByUserId(userId));
	    return "userUpdate";
	}
	
	@PostMapping("/userUpdate")
	@ResponseBody
	public String userUpdate(@RequestBody User user) {
		
		String hashedPassword = passwordEncoder.encode(user.getUserPwd());
	    user.setUserPwd(hashedPassword);
	    userService.userUpdate(user);
	      
		return "success";
	}
	
	@GetMapping("userDelete/{userCode}")
	public String userDelete (@PathVariable Long userCode) {
		userService.delete(userCode);
		return "redirect:/userList";
	}
	
}
