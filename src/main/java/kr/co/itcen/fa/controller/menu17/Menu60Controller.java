package kr.co.itcen.fa.controller.menu17;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.NoAuth;
import kr.co.itcen.fa.service.menu17.Menu59Service;
import kr.co.itcen.fa.service.menu17.Menu60Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu17.AccountManagementVo;

/**
 * 
 * @author 이성훈
 * 재무제표계정현황조회
 */

@Auth
@Controller
@RequestMapping("/" + Menu60Controller.MAINMENU)
public class Menu60Controller {
	
	public static final String MAINMENU = "17";
	public static final String SUBMENU = "60";
	
	@Autowired
	private Menu60Service menu60Service;
	
	@Autowired
	private Menu59Service menu59Service;
	
	//재무제표 계정관리 조회
	@NoAuth
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(@ModelAttribute AccountManagementVo accountManagement,
					  @RequestParam(value = "accountUsedyear", defaultValue = "2020") String accountUsedyear,
					  @RequestParam(value = "accountOrder", defaultValue = "") Long accountOrder,
					  @RequestParam(value = "selectedAccountStatementType", defaultValue = "B") String type,
					  @RequestParam(value = "selectedAccount", defaultValue = "") Long accountNo,
					  @RequestParam(defaultValue = "1") int page,
					  Model model,
					  HttpSession session) {
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		if(authUser == null) {
			return "redirect:/" + MAINMENU + "/" + SUBMENU;
		}

		//조회할 값들 셋팅
		accountManagement.setAccountUsedyear(accountUsedyear);
		accountManagement.setAccountStatementType(type);
		accountManagement.setInsertUserid(authUser.getName());		
		if(accountNo != null) {
			accountManagement.setAccountNo(accountNo);
		}

		System.out.println(accountManagement);

		//input부분 셋팅
		model.addAttribute("accountUsedyear", accountUsedyear);
		model.addAttribute("accountOrder", accountOrder);
		model.addAttribute("selectedAccountStatementType", type);
		model.addAttribute("selectedAccount", accountNo);
		model.addAttribute("accountList", menu59Service.getAllAccountList());
		
		//테이블부분 셋팅
		model.addAttribute("dataResult", menu59Service.getList(accountManagement, page));
		
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
