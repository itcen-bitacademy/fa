package kr.co.itcen.fa.controller.menu11;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.vo.menu11.RepayVo;

@RestController
@RequestMapping("/api/" + Menu66Controller.MAINMENU + "/" + Menu66Controller.SUBMENU)
public class Menu66ApiController {
	
	@RequestMapping("/search")
	public JSONResult search(RepayVo repayVo) {
		return paging(repayVo, 1);
	}
	
	@RequestMapping("/paging")
	public JSONResult paging(RepayVo repayVo, 
			@RequestParam(value="page", required=true)int page) {
		return null;
	}
}
