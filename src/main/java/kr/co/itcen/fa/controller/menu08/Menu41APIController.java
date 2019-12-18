package kr.co.itcen.fa.controller.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu08.Menu41Service;

@Auth
@Controller
@RequestMapping("/" + Menu41Controller.MAINMENU)
public class Menu41APIController {
	
	@Autowired
	Menu41Service menu41Service;

	//차량코드 중복확인
	@ResponseBody
	@RequestMapping("/" + Menu41Controller.SUBMENU + "/checkId")
	public JSONResult checkId(@RequestParam(value = "id"/* , required=true, defaultValue="" */) String id ) {
		
		System.out.println("중복확인 해보자");
		boolean check = menu41Service.checkId(id);
		return JSONResult.success(check);
	}
}

