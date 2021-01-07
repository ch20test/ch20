package com.controller.before;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.Buser;
import com.service.before.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@RequestMapping("/register")
	public String register(@Valid @ModelAttribute Buser buser,BindingResult result, Model model, HttpSession session, String code) {
		if(result.hasErrors()){
			return "before/register";
		}
		return userService.register(buser, model, session, code);
	}
	@RequestMapping("/login")
	public String login(@ModelAttribute Buser buser,Model model, HttpSession session, String code) {
		return userService.login(buser, model, session, code);
	}
	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		session.invalidate();
		return "forward:/before";
	}
}
