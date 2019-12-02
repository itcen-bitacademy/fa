package kr.co.itcen.fa.controller.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu11.Menu46Service;

@Auth
@Controller
@RequestMapping("/" + Menu46Controller.MAINMENU)
public class Menu46ApiController {
	
	@Autowired
	Menu46Service menu46Service;
	
	//배열로 넘어온거는 '[]' 붙여줘야한다.
	@ResponseBody
	@RequestMapping("/" + Menu46Controller.SUBMENU + "/deleteChecked")
	public JSONResult deleteChecked(@RequestParam(value="sendData[]", required=true) List<Long> noList) {
		menu46Service.deleteChecked(noList);
		return JSONResult.success("success");
	}
}
