package kr.co.itcen.fa.controller.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.security.Auth;

import kr.co.itcen.fa.service.menu12.Menu55Service;
import kr.co.itcen.fa.vo.menu12.CurrentSituationVo;

/**
 * 
 * @author 곽세연
 * 품목별매입매출현황
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu15Controller.MAINMENU)
public class Menu55Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "55";

	@Autowired
	private Menu55Service menu55Service;
	
	//@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/list" })
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model,CurrentSituationVo vo, 
			@RequestParam(value="itemname",required=false) String itemname,
			@RequestParam(value="searchdate",required=false) String searchdate) {
		
		List<CurrentSituationVo> iname = menu55Service.getitemcode(itemname);
		model.addAttribute("itemname",iname);
		List<CurrentSituationVo> list = menu55Service.getList(vo);
		vo.setSearchdate(searchdate);
		model.addAttribute("list",list);
		System.out.println(list);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	
}

