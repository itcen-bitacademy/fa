package kr.co.itcen.fa.controller.menu11;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.itcen.fa.service.menu11.Menu50Service;
import kr.co.itcen.fa.vo.menu11.PdebtVo;

@RestController("Menu50ApiController")
@RequestMapping("/" + Menu50Controller.MAINMENU + "/" + Menu50Controller.SUBMENU + "api/selectone")
public class Menu50ApiController {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "50";
	
	@Autowired
	private Menu50Service menu50Service;
	
	@ResponseBody
	@RequestMapping("/getpdebtInfo")
	public PdebtVo adminCategoryInsert(
			@RequestParam("debtcode") String debtcode) {
		PdebtVo pdebtVo = menu50Service.selectOnePdebtInfo(debtcode);
        return pdebtVo;
	}
}
