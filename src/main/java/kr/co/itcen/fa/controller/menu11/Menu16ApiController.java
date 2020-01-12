package kr.co.itcen.fa.controller.menu11;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.service.menu11.Menu16Service;
import kr.co.itcen.fa.vo.menu11.BankVo;



@RestController("Menu16ApiController")
@RequestMapping("/" + Menu16Controller.MAINMENU)
public class Menu16ApiController {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "16";
	
	@Autowired
	private Menu16Service menu16Service;
	
	@ResponseBody
	@RequestMapping("/"+SUBMENU+"/api/checkcode")
	public JSONResult checkCode(@RequestParam(value="code", required=true, defaultValue="") String code) {
		BankVo bankvo = menu16Service.existCode(code);
        return JSONResult.success(bankvo);
	}
	
	
	
}
