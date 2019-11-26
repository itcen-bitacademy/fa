package kr.co.itcen.fa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "user/login";
	}

	@RequestMapping(value="/auth", method=RequestMethod.POST)
	public void auth() {
	}

	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public void logout() {
	}	
}
