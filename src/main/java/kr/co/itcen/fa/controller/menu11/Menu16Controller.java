package kr.co.itcen.fa.controller.menu11;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu11.Menu16Service;
import kr.co.itcen.fa.vo.menu11.BankVo;

/**
 * 
 * @author 이지수
 * 은행코드관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu16Controller.MAINMENU)
public class Menu16Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "16";
	
	@Autowired
	private Menu16Service menu16Service;
	
	// /11  /11/16, /11/16/add
	@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/add" })
		public String list(  
				@RequestParam(value="page", required=false,defaultValue = "1") int page,
				@RequestParam(value="code", required=false,defaultValue = "") String code,
				Model model) {
		System.out.println(code);
		DataResult<BankVo> dataResult = menu16Service.list(code, page);
		model.addAttribute("dataResult",dataResult);
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/list" }, method = RequestMethod.POST)
	public String list(@RequestParam(value="page", required=false,defaultValue = "1") int page,	
	@RequestParam(value="code", required=false,defaultValue = "") String code ) {

	return "redirect:/" + MAINMENU + "/" + SUBMENU + "?page=" + page + "&code=" + code;
}
	
	@RequestMapping(value= "/" + SUBMENU + "/add" , method = RequestMethod.POST)
	public String add(@ModelAttribute @Valid BankVo vo,
					BindingResult result,
					Model model) {
		
		if(result.hasErrors()) {
			model.addAllAttributes(result.getModel());
			return "redirect:/" + MAINMENU + "/" + SUBMENU;
		}
		System.out.println(vo);
		vo.setAddress(vo.getRoadAddress() + vo.getDetailAddress());
		menu16Service.insert(vo);
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	@RequestMapping(value= "/" + SUBMENU + "/update" , method = RequestMethod.POST)
	public String update(BankVo vo) {
		System.out.println(vo);
		vo.setAddress(vo.getRoadAddress() + vo.getDetailAddress());
		menu16Service.update(vo);
		return"redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	@RequestMapping(value= "/" + SUBMENU + "/delete" , method = RequestMethod.POST)
	public String delete(BankVo vo) {
		System.out.println(vo);
		vo.setAddress(vo.getRoadAddress() + vo.getDetailAddress());
		menu16Service.delete(vo);
		return"redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	
}
