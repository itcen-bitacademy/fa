package kr.co.itcen.fa.controller.menu02;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu33Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.UserVo;
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
	public String main(@ModelAttribute PurchaseitemVo purchaseitemVo,
					   Model model) {
		List<SectionVo> sectionList = menu33Service.getSectionList();
		
		System.out.println(sectionList);
		
		model.addAttribute("sectionList", sectionList);
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/searchsection")
	public List<SectionVo> search_section(@RequestParam(value="sectionname", required=false) String sectionname) {
		List<SectionVo> searchsectionList = menu33Service.getsearchSectionList(sectionname);
		
		return searchsectionList;
	}
	
	@ResponseBody
	@RequestMapping(value="/" + SUBMENU + "/search", method=RequestMethod.GET)
	public Map<String, Object> search(@RequestParam(value="itemcode", required=false) String no) {
		PurchaseitemVo searchpurchaseitemVo = menu33Service.searchpurchaseitem(no);
		//FactoryVo searchfactoryVo = menu33Service.searchfactory(purchaseitemVo.getFactory_code());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("name", searchpurchaseitemVo.getName());
		
		String name = searchpurchaseitemVo.getName();
		System.out.println(name);
		
		return map;
	}
	
	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.POST)
	public String add(@ModelAttribute PurchaseitemVo purchaseitemVo,
					  @ModelAttribute FactoryVo factoryVo,
					  @RequestParam(value="factory_name", required=false) String factory_name,
					  @RequestParam(value="factory_address1", required=false) String factory_address1,
					  @RequestParam(value="factory_address2", required=false) String factory_address2,
					  @RequestParam(value="factory_address3", required=false) String factory_address3,
					  HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session != null && session.getAttribute("authUser") != null) {
			UserVo userVo = (UserVo)session.getAttribute("authUser");
			
			if(purchaseitemVo.getNo() != null && purchaseitemVo.getNo() != "" && purchaseitemVo.getProduce_date() != "") {
				System.out.println(purchaseitemVo.getSection_code());
				factoryVo.setName(factory_name);
				factoryVo.setAddress(factory_address1 + " " + factory_address2 + " " + factory_address3);
				purchaseitemVo.setInsert_userid(userVo.getId());
				factoryVo.setInsert_userid(userVo.getId());
				
				menu33Service.add(purchaseitemVo, factoryVo);
			}
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
	public String delete(@ModelAttribute PurchaseitemVo purchaseitemVo,
						 @ModelAttribute FactoryVo factoryVo) {
		
		if(purchaseitemVo.getNo() != null && purchaseitemVo.getNo() != "") {
			
			menu33Service.delete(purchaseitemVo, factoryVo);
		}
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
}







