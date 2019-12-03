package kr.co.itcen.fa.controller.menu17;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu17.Menu20Service;
import kr.co.itcen.fa.service.menu17.Menu61Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
import kr.co.itcen.fa.vo.menu17.Menu17SearchForm;

/**
 * 
 * @author 최웅
 * 결산작업
 */

@Auth
@Controller
@RequestMapping("/" + Menu61Controller.MAINMENU)
public class Menu61Controller {
	
	public static final String MAINMENU = "17";
	public static final String SUBMENU = "61";
	
	@Autowired
	private Menu20Service menu20Service;
	
	@Autowired
	private Menu61Service menu61Service;
	
	
	/**
	 * 결산작업 페이지
	 */
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String settlementStateManagementPage(Model model, Menu17SearchForm menu17SearchForm) {
		List<String> closingYearList = menu20Service.selectClosingYear();
		model.addAttribute("closingYearList", closingYearList);
		
		if (menu17SearchForm.getYear() == null && closingYearList != null && closingYearList.size() > 0) {
			menu17SearchForm.setYear(closingYearList.get(0));
		}
		
		model.addAttribute("year", menu17SearchForm.getYear());

		model.addAttribute("dataResult", menu20Service.selectClosingDateByYear(menu17SearchForm));
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	/**
	 * 결산작업 실행
	 */
	@PostMapping("/" + SUBMENU + "/settlement")
	public String executeSettlement(HttpSession session, ClosingDateVo closingDateVo) {
		UserVo userVo = (UserVo) session.getAttribute("authUser");
		
		closingDateVo.setUpdateUserid(userVo.getId());
		
		menu61Service.executeSettlement(closingDateVo);
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU + "/list";
	}
	
	
	@PostMapping("/" + SUBMENU + "/test")
	@ResponseBody
	public String testSettlement() {
		menu61Service.testSettlement();
		
		return "abc";
	}
}
