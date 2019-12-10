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
					   @RequestParam(value="page", required=false, defaultValue="1") int page,
					   @RequestParam(value="page_group", required=false, defaultValue="0") int page_group,
					   Model model) {
		
		List<PurchaseitemVo> purchaseitemList = menu33Service.getPurchaseitemList(page_group);
		List<PurchaseitemVo> purchaseitemListall = menu33Service.getPurchaseitemListall();
		List<SectionVo> sectionList = menu33Service.getSectionList();
		List<SectionVo> factoryList = menu33Service.getFactorysectionList();
		List<PurchaseitemVo> pagepurchaseitemList = menu33Service.getpagePurchaseitemList(page);
		
		model.addAttribute("purchaseitemListall", purchaseitemListall); //모든 데이터
		model.addAttribute("purchaseitemList", purchaseitemList); //5페이지씩 데이터 55개
		model.addAttribute("pagepurchaseitemList", pagepurchaseitemList); //한페이지 데이터 11개
		model.addAttribute("sectionList", sectionList);
		model.addAttribute("factoryList", factoryList);
		model.addAttribute("cur_page", page);
		model.addAttribute("page_group", page_group);
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/paging")
	public Map<String, Object> paging(@RequestParam(value="page", required=false, defaultValue="1") int page,
									  @RequestParam(value="page_group", required=false, defaultValue="0") int page_group,
									  Model model) {
		System.out.println(page);
		List<PurchaseitemVo> pagepurchaseitemList = menu33Service.getpagePurchaseitemList(page);
		List<PurchaseitemVo> purchaseitemList = menu33Service.getPurchaseitemList(page_group);
		List<PurchaseitemVo> purchaseitemListall = menu33Service.getPurchaseitemListall();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("purchaseitemListall", purchaseitemListall);
		map.put("purchaseitemList", purchaseitemList);
		map.put("pagepurchaseitemList", pagepurchaseitemList);
		map.put("cur_page", page);
		map.put("page_group", page_group);
		
		return map;
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
		System.out.println(no);
		
		PurchaseitemVo searchpurchaseitemVo = menu33Service.searchpurchaseitem(no);
		FactoryVo searchfactoryVo = menu33Service.searchfactory(searchpurchaseitemVo.getNo(), searchpurchaseitemVo.getFactorycode());
		SectionVo searchsectionVo = menu33Service.searchsection(searchpurchaseitemVo.getSectioncode());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("no", searchpurchaseitemVo.getNo());
		map.put("section_name", searchsectionVo.getClassification());
		map.put("factory_name", searchfactoryVo.getName());
		map.put("postaddress", searchfactoryVo.getPostaddress());
		map.put("roadaddress", searchfactoryVo.getRoadaddress());
		map.put("detailaddress", searchfactoryVo.getDetailaddress());
		map.put("standard", searchpurchaseitemVo.getStandard());
		map.put("price", searchpurchaseitemVo.getPrice());
		
		map.put("name", searchpurchaseitemVo.getName());
		map.put("section_code", searchpurchaseitemVo.getSectioncode());
		map.put("factory_code", searchfactoryVo.getNo());
		map.put("manager_name", searchfactoryVo.getManagername());
		map.put("produce_date", searchpurchaseitemVo.getProducedate());
		map.put("purpose", searchpurchaseitemVo.getPurpose());
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/" + SUBMENU + "/add")
	public String add(@ModelAttribute PurchaseitemVo purchaseitemVo,
					  @ModelAttribute FactoryVo factoryVo,
					  @RequestParam(value="factoryname", required=false) String factory_name,
					  HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		
		if(session != null && session.getAttribute("authUser") != null) {
			UserVo userVo = (UserVo)session.getAttribute("authUser");
			
			if(purchaseitemVo.getNo() != null && purchaseitemVo.getNo() != "") {
				factoryVo.setName(factory_name);
				factoryVo.setNo(purchaseitemVo.getFactorycode());
				factoryVo.setPurchaseitemcode(purchaseitemVo.getNo());
				purchaseitemVo.setInsertuserid(userVo.getId());
				factoryVo.setInsertuserid(userVo.getId());
				
				System.out.println(purchaseitemVo);
				System.out.println(factoryVo);
				
				menu33Service.add(purchaseitemVo, factoryVo);
			}
		}
		
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value="/" + SUBMENU + "/update")
	public List<PurchaseitemVo> update(@ModelAttribute PurchaseitemVo purchaseitemVo,
						  			   @ModelAttribute FactoryVo factoryVo,
						  			   @RequestParam(value="factoryname", required=false) String factory_name,
						  			   @RequestParam(value="page", required=false, defaultValue="1") int page,
						  			   HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session != null && session.getAttribute("authUser") != null) {
			UserVo userVo = (UserVo)session.getAttribute("authUser");
			
			if(purchaseitemVo.getNo() != null && purchaseitemVo.getNo() != "") {
				factoryVo.setName(factory_name);
				factoryVo.setNo(purchaseitemVo.getFactorycode());
				factoryVo.setPurchaseitemcode(purchaseitemVo.getNo());
				purchaseitemVo.setUpdateuserid(userVo.getId());
				factoryVo.setUpdateuserid(userVo.getId());
				
				System.out.println(purchaseitemVo);
				System.out.println(factoryVo);
				
				menu33Service.update(purchaseitemVo, factoryVo);
			}
		}
		
		List<PurchaseitemVo> pagepurchaseitemList = menu33Service.getpagePurchaseitemList(page);
		
		return pagepurchaseitemList;
	}
	
	@ResponseBody
	@RequestMapping(value="/" + SUBMENU + "/delete")
	public Map<String, Object> delete(@ModelAttribute PurchaseitemVo purchaseitemVo,
 			 			 			  @ModelAttribute FactoryVo factoryVo,
 			 			 			  @RequestParam(value="factoryname", required=false) String factory_name,
 			 			 			  @RequestParam(value="page", required=false, defaultValue="1") int page,
 			 			 			  HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session != null && session.getAttribute("authUser") != null) {
			UserVo userVo = (UserVo)session.getAttribute("authUser");
			
			if(purchaseitemVo.getNo() != null && purchaseitemVo.getNo() != "") {
				factoryVo.setName(factory_name);
				factoryVo.setNo(purchaseitemVo.getFactorycode());
				factoryVo.setPurchaseitemcode(purchaseitemVo.getNo());
				purchaseitemVo.setUpdateuserid(userVo.getId());
				factoryVo.setUpdateuserid(userVo.getId());
				
				System.out.println(purchaseitemVo);
				System.out.println(factoryVo);
				menu33Service.delete(purchaseitemVo, factoryVo);
			}
		}
		
		List<PurchaseitemVo> purchaseitemListall = menu33Service.getPurchaseitemListall();
		
		int page_max = ((purchaseitemListall.size()-1) / 11) + 1;
		
		if(page_max < page) {
			page--;
		}
		
		int page_group = (page-1) / 5;
		
		List<PurchaseitemVo> pagepurchaseitemList = menu33Service.getpagePurchaseitemList(page);
		List<PurchaseitemVo> purchaseitemList = menu33Service.getPurchaseitemList(page_group);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("page_num", page);
		map.put("page_group", page_group);
		map.put("purchaseitemListall", purchaseitemListall);
		map.put("pagepurchaseitemList", pagepurchaseitemList);
		map.put("purchaseitemList", purchaseitemList);
		
		System.out.println("gdgd");
		
		return map;
	}
}







