package kr.co.itcen.fa.controller.menu01;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu24Service;
import kr.co.itcen.fa.vo.menu01.CardVo;


/**
 * 
 * @author 김승곤
 * 카드현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu24Controller.MAINMENU)
public class Menu24Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "24";

	@Autowired
	private Menu24Service menu24Service;

	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model,
			@RequestParam(value="page", required=false,defaultValue = "1") int page,
			@ModelAttribute CardVo vo) {
		if(vo.getDeleteFlag()==null) {
			vo.setDeleteFlag("N");
		}
		System.out.println(vo);
		DataResult<CardVo> dataResult = menu24Service.list(page,vo);
		
		model.addAttribute("dataResult",dataResult);
		
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	

}