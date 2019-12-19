package kr.co.itcen.fa.controller.menu01;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu32Service;
import kr.co.itcen.fa.service.menu17.Menu59Service;
import kr.co.itcen.fa.vo.menu01.AccountCustomerLedgerVo;


/**
 * 
 * @author 임성주
 * 계정별원장조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu31Controller.MAINMENU)
public class Menu31Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "31";

	@Autowired
	private Menu32Service menu32Service;
	
	@Autowired
	private Menu59Service menu59Service;

	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model,
			@RequestParam(defaultValue = "1") int page,
			@ModelAttribute AccountCustomerLedgerVo aclVo) {
		model.addAttribute("accountList", menu59Service.getAllAccountList());
		DataResult<AccountCustomerLedgerVo> dataResult=menu32Service.list(aclVo, page);
		model.addAttribute("dataResult", dataResult);

		return MAINMENU + "/" + SUBMENU + "/list";
	}
}