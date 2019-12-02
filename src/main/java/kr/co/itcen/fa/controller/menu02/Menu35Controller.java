package kr.co.itcen.fa.controller.menu02;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu35Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu02.CustomerVo;

/**
 * 
 * @author 이지은
 * 매입거래처관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu35Controller.MAINMENU)
public class Menu35Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "35";
	
	@Autowired
	private Menu35Service menu35Service;

	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		List<CustomerVo> customerVo = menu35Service.list();
		model.addAttribute("customerVo", customerVo);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@RequestMapping({"/" + SUBMENU + "/insert" })
	public String insert(@ModelAttribute CustomerVo vo, HttpSession session) {
		UserVo sessionVo = (UserVo) session.getAttribute("authUser");
		String userNo = sessionVo.getId();
		vo.setInsertUserid(userNo);
		
		menu35Service.insert(vo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU + "/list";
	}
}
