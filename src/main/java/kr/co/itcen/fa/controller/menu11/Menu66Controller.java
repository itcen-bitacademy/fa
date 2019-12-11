package kr.co.itcen.fa.controller.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu11.Menu66Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;

/**
 * 
 * @author 박준호 상환내역관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu66Controller.MAINMENU)
public class Menu66Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "66";

	@Autowired
	private Menu66Service menu66Service;

	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String list(
			Model model,
			@RequestParam(value = "code", required = false, defaultValue = "") String code,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		DataResult<RepayVo> dataResult = menu66Service.list(page, code);
		//List<SectionVo> sectionlist = menu66Service.selectSection();
		model.addAttribute("dataResult", dataResult);
		//model.addAttribute("sectionlist", sectionlist);
		model.addAttribute("contentsCount", dataResult.getPagination().getTotalCnt()); // 게시물 수
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/list" },method = RequestMethod.POST)
	public String list(
			@RequestParam(value="code",required = false, defaultValue = "") String code,
			@RequestParam(value="page", required=false,defaultValue = "1") int page) {
		
		return "redirect:/"+MAINMENU+"/"+SUBMENU + "?code="+code+"&page"+page;
	}
	
}
