package kr.co.itcen.fa.controller.menu17;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.NoAuth;
import kr.co.itcen.fa.service.menu17.Menu62Service;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
import kr.co.itcen.fa.vo.menu17.Menu17SearchForm;
import kr.co.itcen.fa.vo.menu17.TrialBalanceVo;

/**
 * 
 * @author 최웅
 * 합계잔액시산표조회
 */

@Auth
@Controller
@RequestMapping("/" + Menu62Controller.MAINMENU)
public class Menu62Controller {
	
	public static final String MAINMENU = "17";
	public static final String SUBMENU = "62";
	
	@Autowired
	private Menu62Service menu62Service;
	
	@NoAuth
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String trialBalanceView(Model model, Menu17SearchForm menu17SearchForm) {
		List<ClosingDateVo> closingDateList = menu62Service.selectAllClosedDate();
		model.addAttribute("closingDateList", closingDateList);
		
		if (menu17SearchForm.getClosingDateNo() == null && closingDateList != null && closingDateList.size() > 0) {
			menu17SearchForm.setClosingDateNo((closingDateList.get(0).getNo()));
		}
		
		model.addAttribute("closingDateNo", menu17SearchForm.getClosingDateNo());
		
		List<TrialBalanceVo> trialBalanceList = menu62Service.selectTrialBalanceByClosingDateNo(menu17SearchForm);
		
		model.addAttribute("trialBalanceList", trialBalanceList);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
