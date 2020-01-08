package kr.co.itcen.fa.controller.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu08.Menu39Service;
import kr.co.itcen.fa.vo.menu08.BuildingVo;

@Auth
@Controller
@RequestMapping("/" + Menu39Controller.MAINMENU)
public class Menu39APIController {
	
	@Autowired
	Menu39Service menu39Service;

	//건물코드 중복확인
	@ResponseBody
	@RequestMapping("/" + Menu39Controller.SUBMENU + "/checkId")
	public JSONResult checkId(@RequestParam(value = "id"/* , required=true, defaultValue="" */) String id ) {
		System.out.println("!!!!!중복확인!!!!!");
		BuildingVo vo = menu39Service.checkId(id);
		return JSONResult.success(vo);
	}
}

