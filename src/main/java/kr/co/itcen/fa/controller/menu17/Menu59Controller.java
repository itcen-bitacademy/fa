package kr.co.itcen.fa.controller.menu17;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu17.Menu59Service;
import kr.co.itcen.fa.vo.menu17.AccountManagement;
import kr.co.itcen.fa.vo.UserVo;

/**
 * 
 * @author 이성훈
 * 재무제표계정관리
 */

@Auth
@Controller
@RequestMapping("/" + Menu59Controller.MAINMENU)
public class Menu59Controller {
	
	public static final String MAINMENU = "17";
	public static final String SUBMENU = "59";
	
	@Autowired
	private Menu59Service menu59Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String getList(@ModelAttribute AccountManagement vo,
						  Model model) {
		
		
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	

	//재무제표 계정관리 저장
	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.POST)
	public String add(@ModelAttribute AccountManagement accountManagement,
					  @RequestParam("accountStatementType") String type,
					  HttpSession session) {
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		
		if(authUser == null) {
			return "redirect:/" + MAINMENU + "/" + SUBMENU;
		}
		
	
		accountManagement.setAccountNo(1000000L); //우선 코드값 임의로  줌
		accountManagement.setAccountStatementType(type);
		accountManagement.setInsertUserid(authUser.getName());
		
		System.out.println(accountManagement);
		menu59Service.insert(accountManagement);
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	@RequestMapping(value="/" + SUBMENU + "/update", method=RequestMethod.POST)
	public String update(AccountManagement accountManagement) {
		System.out.println(accountManagement);
		
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	@RequestMapping(value="/" + SUBMENU + "/delete", method=RequestMethod.POST)
	public String delete(AccountManagement accountManagement) {
		System.out.println(accountManagement);
		

		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	
//	@ResponseBody
//	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/add" })
//	public String view(@ModelAttribute AccountManagement vo) {
//		
//		menu59Service.insert(vo);
//		return MAINMENU + "/" + SUBMENU + "/add";
//	}
	
}
