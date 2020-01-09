package kr.co.itcen.fa.controller.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.NoAuth;
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
	
	@NoAuth
	// 대분류를 가져오기 위한 코드
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model ,
			@ModelAttribute("vo") CurrentSituationVo vo,
			@RequestParam(value="page",required = false, defaultValue = "1")int page,
			@RequestParam(value="searchdate", required=false)String searchdate,
			@RequestParam(value = "sectioncode",required = false)String sectioncode,
			@RequestParam(value="itemcode",required=false)String itemcode) {
		
		
		if(vo.getItemcode() == null || "".equals(vo.getItemcode()))
			vo.setItemcode("");
		if(vo.getSearchdate() == null || "".equals(vo.getSearchdate()))
			vo.setSearchdate("");

		
		//전체 리스트를 가져오기 위한 코드  , page
		DataResult<CurrentSituationVo> dataResult = menu56Service.getList(page, vo);
		
		model.addAttribute("dataResult",dataResult);
		
		
		// 대분류 목록을 보여주기 위한 코드
		List<SectionVo> maincategory = menu56Service.getCategory();
		model.addAttribute("gcategory",maincategory);
		
		//품목 목록을 보여주기 위한 코드
		List<CurrentSituationVo> subcategory = menu56Service.getItemname(vo.getSectioncode());
		model.addAttribute("subcategory",subcategory);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	//대분류명을 선택하였을 때 품목명들이 따라오는 코드
	@NoAuth
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/api")
	public JSONResult list(@RequestParam("sectioncode")String sectioncode) {

		List<CurrentSituationVo> subcategory = menu56Service.getItemname(sectioncode);
		
		return JSONResult.success(subcategory);
		
	}
	
	
	
	
}