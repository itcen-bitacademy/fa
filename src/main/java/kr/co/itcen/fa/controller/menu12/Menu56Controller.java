package kr.co.itcen.fa.controller.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu12.Menu56Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu12.CurrentSituationVo;

/**
 * 
 * @author 곽세연
 * 품목대분류별매입매출현황
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu15Controller.MAINMENU)
public class Menu56Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "56";


	@Autowired
	private Menu56Service menu56Service;
	
	// 대분류를 가져오기 위한 코드
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model ,CurrentSituationVo vo) {
		
		if(vo.getItemcode() == null || "".equals(vo.getItemcode()))
			vo.setItemcode("");
		if(vo.getSearchdate() == null || "".equals(vo.getSearchdate()))
			vo.setSearchdate("");
		
		System.out.println("안녕"+vo);
		
		//포스트 지울려면
		//@path주는 거 지워
		List<CurrentSituationVo> list = menu56Service.getList(vo);
		model.addAttribute("list",list);
		
		// 대분류 목록을 보여주기 위한 코드
		List<SectionVo> maincategory = menu56Service.getCategory();
		model.addAttribute("gcategory",maincategory);
		
	
		
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/api")
	public JSONResult list(@RequestParam("sectioncode")String sectioncode) {

		List<CurrentSituationVo> subcategory = menu56Service.getItemname(sectioncode);
		
		
		
		return JSONResult.success(subcategory);
		
	}
	
	
	
	
}