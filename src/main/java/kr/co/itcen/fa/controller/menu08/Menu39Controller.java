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
import kr.co.itcen.fa.service.menu08.Menu39Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu08.BuildingVo;


/**
 * 
 * @author 김민준
 * 
 * 건물관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu39Controller.MAINMENU)
public class Menu39Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "39";
	
	
	@Autowired
	private Menu39Service menu39Service;
	
	
	//               /08   /   39     , /08/39/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String list(Model model, @RequestParam(value="id", required = false, defaultValue = "") String id) {
		//menu39Service.test();
		/*
		 *   JSP
		 *   08/39/list.jsp
		 * 
		 */
		
		//List 생성
		List<BuildingVo> list = menu39Service.list(id); 
		
		model.addAttribute("list", list);
		menu39Service.list(id);
		
		//map 생성
		Map<String, Object> map = new HashMap<>();
		
		//대분류
		map.putAll(menu39Service.getSection());
		model.addAllAttributes(map);
		
		//대분류
		map.putAll(menu39Service.getCustomer());
		model.addAllAttributes(map);
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	//등록(C)
	@RequestMapping(value = "/" + SUBMENU + "/create" , method = RequestMethod.POST)
	public String add(@ModelAttribute BuildingVo vo, @AuthUser UserVo uservo){
		vo.setInsertUserid(uservo.getId());
		menu39Service.add(vo);
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	//조회(R)
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/search" }, method = RequestMethod.POST)
	public String list(@RequestParam(value="id", required = false, defaultValue = "") String id){
		return "redirect:/" + MAINMENU + "/" + SUBMENU + "?id=" + id;
	}
	
	//수정(U)
	@RequestMapping(value = "/" + SUBMENU + "/update" , method = RequestMethod.POST)
	public String update(@ModelAttribute BuildingVo vo, @AuthUser UserVo uservo){
		vo.setUpdateUserid(uservo.getId());
		menu39Service.modify(vo);
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	//삭제(D)
	@RequestMapping(value = "/" + SUBMENU + "/delete" , method = RequestMethod.POST)
	public String delete(@RequestParam(value="id", required = false, defaultValue = "") String id){
		menu39Service.delete(id);
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
}
