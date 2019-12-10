package kr.co.itcen.fa.controller.menu08;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu08.Menu44Service;
import kr.co.itcen.fa.vo.menu08.IntangibleAssetsVo;


/**
 * 
 * @author 김유진
 * 
 * 무형자산조회 
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu44Controller.MAINMENU)
public class Menu44Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "44";
	
	
	@Autowired
	private Menu44Service menu44Service;
	
	
	// main page
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(IntangibleAssetsVo intangibleAssetsVo,
			Model model,
			@RequestParam(value = "kwd", required = false, defaultValue = "") String kwd,
			@RequestParam(defaultValue = "1") int page) {
		
		// 대분류코드, 거래처명 리스트
		Map<String, Object> map = new HashMap<>();
		map.putAll(menu44Service.getSection());
		model.addAllAttributes(map);
		
		// 삭제포함 버튼 확인
		if(intangibleAssetsVo.getIsChecked() == null) {
			DataResult<IntangibleAssetsVo> dataResult = menu44Service.getList(page, intangibleAssetsVo);
			model.addAttribute("dataResult", dataResult);
			model.addAttribute("intangibleAssetsVo", dataResult.getDatas());
			
			return MAINMENU + "/" + SUBMENU + "/list";
		} else {
			DataResult<IntangibleAssetsVo> dataResult = menu44Service.getAllList(page, intangibleAssetsVo);
			model.addAttribute("dataResult", dataResult);
			model.addAttribute("intangibleAssetsVo", dataResult.getDatas());
			
			return MAINMENU + "/" + SUBMENU + "/list";
		}
	}
	
}
