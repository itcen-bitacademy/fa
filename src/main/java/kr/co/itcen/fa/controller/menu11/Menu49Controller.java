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
import kr.co.itcen.fa.service.menu11.Menu49Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;

/**
 * 
 * @author 김준호
 * 장기차입금현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu49Controller.MAINMENU)
public class Menu49Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "49";
	
	@Autowired
	private Menu49Service menu49Service;
	
	                                   //   /11/49, /11/49/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model,
			@RequestParam(value="page", required=false,defaultValue = "1") int page,
		LTermdebtVo vo,
		@RequestParam(value="sort", required=false) String sort) {
		System.out.println(vo);
		
		DataResult<LTermdebtVo> dataResult = menu49Service.list(page,vo);
		List<SectionVo> sectionlist = menu49Service.selectSection();
		
		model.addAttribute("dataResult",dataResult);
		model.addAttribute("sectionlist",sectionlist);
		
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}

}
