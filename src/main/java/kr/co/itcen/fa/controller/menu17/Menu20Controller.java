package kr.co.itcen.fa.controller.menu17;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu17.Menu20Service;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;

/**
 * 
 * @author 김재원
 * 마감현황관리
 */

@Auth
@Controller
@RequestMapping("/" + Menu20Controller.MAINMENU)
public class Menu20Controller {
	
	public static final String MAINMENU = "17";
	public static final String SUBMENU = "20";
	
	@Autowired
	private Menu20Service menu20Service;
	
	/**
	 * 년도별 마감현황 관리 페이지
	 */
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String closinStateManagementPage(Model model, String year) {
		List<String> closingYearList = menu20Service.selectClosingYear();
		model.addAttribute("closingYearList", closingYearList);
		
		if (year == null && closingYearList != null && closingYearList.size() > 0) {
			year = closingYearList.get(0);
		}
		
		model.addAttribute("year", year);

		List<ClosingDateVo> closingDateList = menu20Service.selectClosingDateByYear(year);
		model.addAttribute("closingDateList", closingDateList);

		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
