package kr.co.itcen.fa.controller.menu08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu08.Menu43Service;
import kr.co.itcen.fa.vo.UserVo;
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
	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model,
			@RequestParam(value = "kwd", required = false, defaultValue = "") String kwd) {
		// 대분류코드, 거래처명 리스트
		Map<String, Object> map = new HashMap<>();
		map.putAll(menu43Service.getSection());
		map.putAll(menu43Service.getCustomer());
		model.addAllAttributes(map);
		
		//
		
		if(kwd != null) {
			List<IntangibleAssetsVo> list = menu43Service.getList(kwd);
			model.addAttribute("kwd", kwd);
			model.addAttribute("list", list);
			
			return MAINMENU + "/" + SUBMENU + "/add";
		}
		
		kwd = null;
		List<IntangibleAssetsVo> list = menu43Service.getList(kwd);
		model.addAttribute("kwd", kwd);
		model.addAttribute("list", list);
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}

	// 무형자산 등록 : C
	@RequestMapping(value = { "/" + SUBMENU + "/add" }, method = RequestMethod.POST)
	public String insert(@ModelAttribute IntangibleAssetsVo intangibleAssetsVo,
			@AuthUser UserVo user) {
		intangibleAssetsVo.setInsertUserId(user.getId()); // session값으로 사용자 id가져오기
		
		menu43Service.insert(intangibleAssetsVo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	// 무형자산 항목 수정 : U
	@RequestMapping(value = { "/" + SUBMENU + "/update" }, method = RequestMethod.POST)
	public String update(@ModelAttribute IntangibleAssetsVo intangibleAssetsVo,
			@AuthUser UserVo user) {
		intangibleAssetsVo.setUpdateUserId(user.getId()); // session값으로 사용자 id가져오기
		
		menu43Service.update(intangibleAssetsVo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}

	// 무형자산 항목 삭제 : D
	@RequestMapping(value = { "/" + SUBMENU + "/delete" }, method = RequestMethod.POST)
	public String delete(@RequestParam(value = "id", required = false) String id) {
		menu43Service.delete(id);
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}

}
