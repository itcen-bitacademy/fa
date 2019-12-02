package kr.co.itcen.fa.controller.menu17;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu17.Menu20Service;
import kr.co.itcen.fa.service.menu17.Menu61Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;

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
	public String settlementStateManagementPage(Model model, String year) {
		List<String> closingYearList = menu20Service.selectClosingYear();
		model.addAttribute("closingYearList", closingYearList);
		
		if (year == null && closingYearList != null && closingYearList.size() > 0) {
			year = closingYearList.get(0);
		}
		
		model.addAttribute("year", year);

//		List<ClosingDateVo> closingDateList = menu20Service.selectClosingDateByYear(year);
//		model.addAttribute("closingDateList", closingDateList);
		
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
}
