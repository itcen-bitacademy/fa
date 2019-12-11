package kr.co.itcen.fa.controller.menu08;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu08.Menu09Service;
import kr.co.itcen.fa.service.menu08.Menu10Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu08.LandVo;

/**
 * 
 * @author 정의돈
 * 
 *         토지현황조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu10Controller.MAINMENU)
public class Menu10Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "10";

	@Autowired
	private Menu09Service menu09Service;

	@Autowired
	private Menu10Service menu10Service;

	// /08 / 10 , /08/10/list
	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model,
			@RequestParam(value="id", required=false, defaultValue = "") String id,
			@RequestParam(value="page", required=false, defaultValue = "1") int page) {
		/* menu10Service.test(); */

		
		//dataresult 생성, 모델
		DataResult<LandVo> dataResult = menu09Service.list(id, page); 
		model.addAttribute("dataResult",dataResult);
		model.addAttribute("page" , page);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//대분류코드 select box
		List<SectionVo> list = menu09Service.getSectionList();
		
		model.addAttribute("sectionList2", list);
		System.out.println(menu09Service.getSectionList());
		
		//조회 기본 리스트 가져오기
		map.putAll(menu10Service.selectList());
		model.addAllAttributes(map);
		

		return MAINMENU + "/" + SUBMENU + "/list";
	}

	@ResponseBody
	@RequestMapping({ "/" + SUBMENU + "/search" })
	public Map<String, Object> search(Model model, @ModelAttribute LandVo landVo,
									 @RequestParam(value="payDate", required=false) String payDate) {
		menu10Service.test();
		String startDate = null;
		String endDate = null;
		
		System.out.println("asdfasdf" + payDate);
		
		String[] date = payDate.split(" - ");
		startDate = date[0];	
		endDate = date[1];
		System.out.println(landVo);
		System.out.println("startDate :" + startDate);
		System.out.println("endDate :" +endDate);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.putAll(menu10Service.getList(landVo, startDate, endDate));
		

		return map;
	}

}