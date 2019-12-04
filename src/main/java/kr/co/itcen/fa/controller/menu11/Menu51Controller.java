package kr.co.itcen.fa.controller.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu11.Menu51Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;

/**
 * 
 * @author 박준호 사채현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu51Controller.MAINMENU)
public class Menu51Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "51";

	@Autowired
	private Menu51Service menu51Service;

	// /11/51, /11/51/list
	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(
			Model model, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, 
			@RequestParam(value="sort", required=false) String sort,
			PdebtVo pdebtVo) {
		System.out.println("사채현황조회 page : " + page);
		
		DataResult<PdebtVo> dataResult = menu51Service.list(page, pdebtVo);
//		if(dataResult.getPagination().getPageIndex() < 1) {
//			dataResult.getPagination().set;
//		}
		List<SectionVo> sectionlist = menu51Service.selectSection();
		System.out.println("dataResult : " + dataResult);
		System.out.println("sectionlist : " + sectionlist);
		model.addAttribute("dataResult", dataResult);
		model.addAttribute("sectionlist", sectionlist);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
