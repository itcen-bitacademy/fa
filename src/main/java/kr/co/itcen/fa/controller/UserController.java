package kr.co.itcen.fa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcen.fa.security.NoAuth;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@NoAuth
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "user/login";
	}

	@NoAuth
	@RequestMapping(value="/auth", method=RequestMethod.POST)
	public void auth() {
	}

	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public void logout() {
	}	
}
