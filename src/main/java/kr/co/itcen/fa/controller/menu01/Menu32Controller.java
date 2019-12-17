package kr.co.itcen.fa.controller.menu01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu32Service;
import kr.co.itcen.fa.service.menu17.Menu59Service;
import kr.co.itcen.fa.vo.menu01.AccountCustomerLedgerVo;

/**
 * 
 * @author 이종윤 계정거래처원장조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu32Controller.MAINMENU)
public class Menu32Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "32";

	@Autowired
	private Menu32Service menu32Service;

	@Autowired // 계정조회를 사용할 것임...
	private Menu59Service menu59Service;

	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "accountNo", required = false, defaultValue = "") Long accountNo,
			@RequestParam(value = "datepicker1", required = true, defaultValue = "") String datepicker1,
			@RequestParam(value = "datepicker2", required = true, defaultValue = "") String datepicker2,
			@RequestParam(value = "customerNo", required = true, defaultValue = "All") String customerNo,
			AccountCustomerLedgerVo aclVo) {
		model.addAttribute("accountList", menu59Service.getAllAccountList());// 계정코드가져오기~
		menu32Service.test();
		DataResult<AccountCustomerLedgerVo> dataResult=menu32Service.list(/*page,*/aclVo,accountNo,datepicker1,datepicker2,customerNo);
		model.addAttribute("dataResult", dataResult);

		return MAINMENU + "/" + SUBMENU + "/list";
	}

}
