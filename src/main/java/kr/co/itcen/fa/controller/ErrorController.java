package kr.co.itcen.fa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorController {

	@RequestMapping("/500")
	public String _500() {
		return "error/500";
	}

	@RequestMapping("/403")
	public String _403() {
		return "error/403";
	}

	@RequestMapping("/404")
	public String _404() {
		return "error/404";
	}
}
