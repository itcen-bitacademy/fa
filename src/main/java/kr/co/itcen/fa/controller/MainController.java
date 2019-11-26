package kr.co.itcen.fa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcen.fa.security.Auth;


@Auth
@Controller
public class MainController {

	@RequestMapping(value="/", method=RequestMethod.GET)
	public String main() {
		return "main/index";
	}


}