package kr.co.itcen.fa.controller.menu08;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu08.Menu43Service;
import kr.co.itcen.fa.vo.menu08.IntangibleAssetsVo;

/**
 * 
 * @author 김유진
 * 
 *         무형자산관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu43Controller.MAINMENU)
public class Menu43Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "43";

	@Autowired
	private Menu43Service menu43Service;

	// main page
	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String list(Model model) {
		List<IntangibleAssetsVo> list = menu43Service.getList();
		model.addAttribute("list", list);
		return MAINMENU + "/" + SUBMENU + "/add";
	}

	// 무형자산 등록
	@RequestMapping(value = { "/" + SUBMENU + "/add" }, method=RequestMethod.POST)
	public String insert(@ModelAttribute IntangibleAssetsVo intangibleAssetsVo) {
		System.out.println(intangibleAssetsVo);
		menu43Service.insert(intangibleAssetsVo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}

	// 무형자산 항목 수정
	@RequestMapping(value = { "/" + SUBMENU + "/update" }, method=RequestMethod.POST)
	public String update(@ModelAttribute IntangibleAssetsVo intangibleAssetsVo) {
		menu43Service.update(intangibleAssetsVo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	// 무형자산 항목 삭제
	@RequestMapping(value= {"/" + SUBMENU + "/delete"}, method=RequestMethod.POST)
	public String delete(@RequestParam(value="id", required=false) String id) {
		menu43Service.delete(id);
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}

}
