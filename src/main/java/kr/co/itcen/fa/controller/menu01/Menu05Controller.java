package kr.co.itcen.fa.controller.menu01;


import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu05Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.CardVo;


/**
 * 
 * @author 김승곤
 * 카드관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu05Controller.MAINMENU)
public class Menu05Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "05";

	@Autowired
	private Menu05Service menu05Service;

	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		List<CardVo> list = menu05Service.list();
		
		model.addAttribute("list", list);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// Create
	@ResponseBody
	@RequestMapping(value="/" + SUBMENU + "/create")
	public Map<String, Object> create(@ModelAttribute CardVo vo, @AuthUser UserVo uvo
			, @RequestParam("validityMM") String validityMM, @RequestParam("validityYY") String validityYY,
			@RequestParam("limitation") Optional<Integer> limitation) {
		String validity = validityMM + "/"+ validityYY ;
		vo.setValidity(validity);
		vo.setInsertUserId(uvo.getName());
		vo.setCardNoOld(null);
		vo.setLimitation(limitation.get());
		
		
		Map<String, Object> result = menu05Service.create(vo);
		
		return result;
	}
	
	// Read
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/read")
	public Map<String, Object> read(@ModelAttribute CardVo vo) {
		
		Map<String, Object> result = menu05Service.read(vo);
		return result;
	}
	
	// Update
	@ResponseBody
	@RequestMapping(value="/" + SUBMENU + "/update")
	public Map<String, Object> update(@ModelAttribute CardVo vo, @AuthUser UserVo uvo, 
			@RequestParam("validityMM") String validityMM, @RequestParam("validityYY") String validityYY,
			@RequestParam("limitation") Optional<Integer> limitation, @RequestParam("cardNoOld") String cardNoOld
			) {
		String validity = validityMM + "/"+ validityYY ;				//두자 고정으로
		vo.setValidity(validity);
		vo.setUpdateUserId(uvo.getName());
		vo.setLimitation(limitation.get());
		
		Map<String, Object> result = menu05Service.update(vo);
		
		return result;
	}
	
	// Delete
	@ResponseBody
	@RequestMapping(value="/" + SUBMENU + "/delete")
	public Map<String, Object> remove(@ModelAttribute CardVo vo) {
		
		Map<String, Object> result =menu05Service.delete(vo);
		result.put("success", true);
		return result;
	}
		
	
	
	
}