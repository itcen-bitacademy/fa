package kr.co.itcen.fa.controller.menu01;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu26Service;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;


/**
 * 
 * @author 황슬기
 * 계좌조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu26Controller.MAINMENU)
public class Menu26Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "26";

	@Autowired
	private Menu26Service menu26Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model,
			@RequestParam(value = "page", required=false, defaultValue = "1")int page,
			BankAccountVo bavo) {
		DataResult<BankAccountVo> dataResult = menu26Service.defaultRead(page, bavo);
		model.addAttribute("dataResult", dataResult);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	
}