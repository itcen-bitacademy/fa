package kr.co.itcen.fa.controller.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu25Service;

@Auth
@Controller
@RequestMapping("/api/deposit")
public class Menu25ApiController {
	
	@Autowired
	public Menu25Service menu25Service;
	
	@ResponseBody
	@RequestMapping("/gets")
	public Map<String, Object> gets(@RequestParam("depositNo") String depositNo) {
		System.out.println("gets");
		
		Map<String, Object> data = menu25Service.gets(depositNo);
		data.put("success", true);
		return data;
	}
	
}

