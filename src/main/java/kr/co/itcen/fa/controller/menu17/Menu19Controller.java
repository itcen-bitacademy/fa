package kr.co.itcen.fa.controller.menu17;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu17.ClosingDate;


/**
 * 
 * @author 김재원
 * 마감일자관리
 */

@Auth
@Controller
@RequestMapping("/" + Menu19Controller.MAINMENU)
public class Menu19Controller {

	public static final String MAINMENU = "17";
	public static final String SUBMENU = "19";
	
	@Autowired
	private Menu19Service menu19Service;
	
	@RequestMapping({"", "/" + SUBMENU + "/list", "/" + SUBMENU })
	public String closingDateListPage(Model model) {
		List<ClosingDate> list = menu19Service.selectAllClosingDate();
		
		model.addAttribute("closingDateList", list);

		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@PostMapping("/" + SUBMENU + "/add")
	public String addClosingDate(ClosingDate closingDate, HttpSession session) {
		UserVo userVo = (UserVo) session.getAttribute("authUser");
		
		closingDate.setInsertUserid(userVo.getId());
		
		
		menu19Service.insertClosingDate(closingDate);
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
}
