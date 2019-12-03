package kr.co.itcen.fa.controller.menu08;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu08.Menu41Service;
import kr.co.itcen.fa.vo.menu08.StaffVo;
import kr.co.itcen.fa.vo.menu08.VehicleVo;


/**
 * 
 * @author 권영미
 * 
 * 차량관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu41Controller.MAINMENU)
public class Menu41Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "41";
	
	
	@Autowired
	private Menu41Service menu41Service;
	
	
	//               /08   /   41     , /08/41/add
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String list(Model model,@ModelAttribute VehicleVo vehicleVo ) {
		//menu41Service.test();
		/*
		 *   JSP
		 *   08/41/add.jsp
		 * 
		 */
		
		System.out.println(vehicleVo.getId());
		//조회기능
		
			Map<String, Object> map = new HashMap<>();
			map.putAll(menu41Service.selectList(vehicleVo));
			model.addAllAttributes(map);
		
			//대분류 select box
			map.putAll(menu41Service.getSection());
			model.addAllAttributes(map);
					
			//직급 select box
			map.putAll(menu41Service.getName());
			model.addAllAttributes(map);
		
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	

	//등록기능
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/add" }, method = RequestMethod.POST)
	public String insert(@ModelAttribute VehicleVo vehicleVo){
		vehicleVo.setId("e"+vehicleVo.getId());
		menu41Service.insert(vehicleVo);
	
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU  + "/add";
	}
		
	//수정기능
	 @RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/update" }, method =RequestMethod.POST) 
	 public String update(@ModelAttribute VehicleVo vehicleVo ){ 
		menu41Service.update(vehicleVo); 
		return "redirect:/" + MAINMENU + "/" + SUBMENU + "/update"; 
	  }
	
	//삭제기능
//	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/add" }, method = RequestMethod.POST)
//	public String delete(@ModelAttribute VehicleVo vehicleVo ) {
//		menu41Service.delete(vehicleVo);
//		return "redirect:/" + MAINMENU + "/" + SUBMENU  + "/add";
//	}
	  
	//조회기능
	 @RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/search" }, method =RequestMethod.POST) 
	 public String search(@ModelAttribute VehicleVo vehicleVo ){ 
		menu41Service.search(vehicleVo); 
		return "redirect:/" + MAINMENU + "/" + SUBMENU + "/search"; 
	  }
	
}
