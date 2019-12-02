package kr.co.itcen.fa.controller.menu02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu33Service;
import kr.co.itcen.fa.vo.menu02.FactoryVo;
import kr.co.itcen.fa.vo.menu02.PurchaseitemVo;

/**
 * 
 * @author 강민호 
 * 매입품목관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu33Controller.MAINMENU)
public class Menu33Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "33";
	
	@Autowired
	private Menu33Service menu33Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list"})
	public String main(@ModelAttribute PurchaseitemVo purchaseitemVo) {
		
		
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.POST)
	public String add(@ModelAttribute PurchaseitemVo purchaseitemVo,
					  @ModelAttribute FactoryVo factoryVo,
					  @RequestParam(value="section_name", required=false) String section_name,
					  @RequestParam(value="section_code", required=false) String section_code,
					  @RequestParam(value="factory_name", required=false) String factory_name,
					  @RequestParam(value="factory_address1", required=false) String factory_address1,
					  @RequestParam(value="factory_address2", required=false) String factory_address2) {

		if(purchaseitemVo.getNo() != null && purchaseitemVo.getNo() != "") {
			factoryVo.setName(factory_name);
			factoryVo.setAddress(factory_address1 + " " + factory_address2);
			
			menu33Service.add(purchaseitemVo, factoryVo);
		}
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@RequestMapping(value="/" + SUBMENU + "/update", method=RequestMethod.POST)
	public String update(@ModelAttribute PurchaseitemVo purchaseitemVo,
						 @ModelAttribute FactoryVo factoryVo,
						 @RequestParam(value="section_name", required=false) String section_name,
						 @RequestParam(value="section_code", required=false) String section_code,
						 @RequestParam(value="factory_name", required=false) String factory_name,
						 @RequestParam(value="factory_address1", required=false) String factory_address1,
						 @RequestParam(value="factory_address2", required=false) String factory_address2) {
		
		if(purchaseitemVo.getNo() != null && purchaseitemVo.getNo() != "") {
			factoryVo.setName(factory_name);
			factoryVo.setAddress(factory_address1 + " " + factory_address2);
			
			menu33Service.update(purchaseitemVo, factoryVo);
		}
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@RequestMapping(value="/" + SUBMENU + "/delete", method=RequestMethod.POST)
	public String delete() {
		
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
}







