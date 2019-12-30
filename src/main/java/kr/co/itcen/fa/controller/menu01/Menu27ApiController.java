package kr.co.itcen.fa.controller.menu01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu27Service;
import kr.co.itcen.fa.vo.menu01.CustomerVo;

@Auth
@Controller("Menu27ApiController")
@RequestMapping("/" + Menu27Controller.MAINMENU)
public class Menu27ApiController {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "27";
	
	@Autowired
	private Menu27Service menu27Service;
	
	
	@ResponseBody
	@RequestMapping("/"+SUBMENU+"/checkno")
	public JSONResult checkNo(@RequestParam(value="no", required=true, defaultValue="") String no) {
		CustomerVo customerVo = menu27Service.existNo(no);
		System.out.println(customerVo);
        return JSONResult.success(customerVo);
	}
	
}
