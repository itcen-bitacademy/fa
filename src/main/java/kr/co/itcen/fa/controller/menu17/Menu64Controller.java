package kr.co.itcen.fa.controller.menu17;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.annotation.JacksonInject.Value;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.NoAuth;
import kr.co.itcen.fa.service.menu17.Menu62Service;
import kr.co.itcen.fa.service.menu17.Menu64Service;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
import kr.co.itcen.fa.vo.menu17.Menu17SearchForm;

/**
 * 
 * @author 유지훈
 * 손익계산서조회
 */

@Auth
@Controller
@RequestMapping("/" + Menu64Controller.MAINMENU)
public class Menu64Controller {
	
	public static final String MAINMENU = "17";
	public static final String SUBMENU = "64";
	
	@Autowired
	private Menu62Service menu62Service;
	@Autowired
	private Menu64Service menu64Service;

	@NoAuth
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model, Menu17SearchForm menu17SearchForm) {
		
		// closingDateList(year-month) selectBox list
		List<ClosingDateVo> closingDateList = menu62Service.selectAllClosedDate();
		model.addAttribute("closingDateList", closingDateList);
		 
		if (menu17SearchForm.getClosingDateNo() == null && closingDateList != null && closingDateList.size() > 0) {
			menu17SearchForm.setClosingDateNo((closingDateList.get(0).getNo()));
		}
		model.addAttribute("closingDateNo", menu17SearchForm.getClosingDateNo());
		
		// 선택된 ClosingDateNo로  손익계산서를 view로 전달 (처음에 열릴땐 가장 최근 마감일자의 손익계산서 조회)
		model.addAllAttributes(menu64Service.get(menu17SearchForm.getClosingDateNo()));
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
}
