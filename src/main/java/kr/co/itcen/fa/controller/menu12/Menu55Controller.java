package kr.co.itcen.fa.controller.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
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
	public String list(Model model,
			@ModelAttribute CurrentSituationVo vo,
			@RequestParam(value="page",required = false,defaultValue = "1")int page) {
		
		if(vo.getSearchdate()==null || "".equals(vo.getSearchdate()))
			vo.setSearchdate("");
		if(vo.getItemcode() == null || "".equals(vo.getItemcode()))
			vo.setItemcode("");
		
		
		
		//전체 리스트를 가져오기 위한 코드, page
		DataResult<CurrentSituationVo> dataResult = menu55Service.getList(page,vo);
		model.addAttribute("dataResult",dataResult);

		//품목 을 가져 오기위한 코드		
		List<CurrentSituationVo> iname = menu55Service.getitemcode(vo.getItemcode());
		model.addAttribute("itemname",iname);

		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	
}

