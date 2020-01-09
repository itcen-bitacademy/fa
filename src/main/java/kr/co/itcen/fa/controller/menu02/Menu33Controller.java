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
	public String main(@RequestParam(value="itemcode", required=false, defaultValue = "") String no,
					   @RequestParam(value="page", required=false, defaultValue="1") int page,
					   @RequestParam(value="page_group", required=false, defaultValue="0") int page_group,
					   @RequestParam(value="section_page", required=false, defaultValue="1") int section_page,
					   @RequestParam(value="section_page_group", required=false, defaultValue="0") int section_page_group,
					   @RequestParam(value="search_sectiondata", required=false, defaultValue = "") String search_sectiondata,
					   @RequestParam(value="factory_page", required=false, defaultValue="1") int factory_page,
					   @RequestParam(value="factory_page_group", required=false, defaultValue="0") int factory_page_group,
					   @RequestParam(value="search_sectiondata", required=false, defaultValue = "") String search_factorydata,
					   Model model) {
		List<PurchaseitemVo> purchaseitemListall = menu33Service.getPurchaseitemListall(no);//모든 데이터
		List<PurchaseitemVo> purchaseitemList = menu33Service.getPurchaseitemList(page_group, no);//5페이지씩 데이터 55개
		List<PurchaseitemVo> pagepurchaseitemList = menu33Service.getpagePurchaseitemList(page, no);//한페이지 데이터 11개
		
		///////////////
		search_sectiondata = "%" + search_sectiondata + "%";
		List<SectionVo> sectionListall = menu33Service.getSectionListall(search_sectiondata);//모든 대분류데이터
		List<SectionVo> sectionList = menu33Service.getSectionList(section_page_group, search_sectiondata);//5페이지씩 데이터 6개
		List<SectionVo> pagesectionList = menu33Service.getpageSectionList(section_page, search_sectiondata);//한페이지 데이터 6개
		//////////////
		
		//////////////
		search_factorydata = "%" + search_factorydata + "%";
		List<SectionVo> factoryListall = menu33Service.getFactoryListall(search_factorydata);//모든 공장데이터
		List<SectionVo> factoryList = menu33Service.getFactoryList(factory_page_group, search_factorydata);//5페이지씩 데이터 6개
		List<SectionVo> pagefactoryList = menu33Service.getpageFactoryList(factory_page, search_factorydata);//한페이지 데이터 6개
		//////////////
		
		model.addAttribute("purchaseitemListall", purchaseitemListall);
		model.addAttribute("purchaseitemList", purchaseitemList);
		model.addAttribute("pagepurchaseitemList", pagepurchaseitemList);
		model.addAttribute("cur_page", page);
		model.addAttribute("page_group", page_group);
		
		model.addAttribute("sectionListall", sectionListall);
		model.addAttribute("sectionList", sectionList);
		model.addAttribute("pagesectionList", pagesectionList);
		model.addAttribute("section_cur_page", section_page);
		model.addAttribute("section_page_group", section_page_group);		
		
		model.addAttribute("factoryListall", factoryListall);
		model.addAttribute("factoryList", factoryList);
		model.addAttribute("pagefactoryList", pagefactoryList);
		model.addAttribute("factory_cur_page", factory_page);
		model.addAttribute("factory_page_group", factory_page_group);
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/paging")
	public Map<String, Object> paging(@RequestParam(value="itemcode", required=false, defaultValue = "") String no,
									  @RequestParam(value="page", required=false, defaultValue="1") int page,
									  @RequestParam(value="page_group", required=false, defaultValue="0") int page_group,
									  Model model) {
		System.out.println(page);
		List<PurchaseitemVo> pagepurchaseitemList = menu33Service.getpagePurchaseitemList(page, no);
		List<PurchaseitemVo> purchaseitemList = menu33Service.getPurchaseitemList(page_group, no);
		List<PurchaseitemVo> purchaseitemListall = menu33Service.getPurchaseitemListall(no);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("purchaseitemListall", purchaseitemListall);
		map.put("purchaseitemList", purchaseitemList);
		map.put("pagepurchaseitemList", pagepurchaseitemList);
		map.put("cur_page", page);
		map.put("page_group", page_group);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/" + SUBMENU + "/search", method=RequestMethod.GET)
	public Map<String, Object> search(@RequestParam(value="itemcode", required=false, defaultValue = "") String no) {
		System.out.println(no);
		Map<String, Object> map = new HashMap<String, Object>();
		PurchaseitemVo searchpurchaseitemVo = menu33Service.searchpurchaseitem(no);

		if(searchpurchaseitemVo != null) {
			FactoryVo searchfactoryVo = menu33Service.searchfactory(searchpurchaseitemVo.getNo(), searchpurchaseitemVo.getFactorycode());
			SectionVo searchsectionVo = menu33Service.searchsection(searchpurchaseitemVo.getSectioncode());
			
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
			map.put("dataflag", "ok");
		} else {
			map.put("dataflag", "no");
		}
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/" + SUBMENU + "/add")
	public String add(@ModelAttribute PurchaseitemVo purchaseitemVo,
					  @ModelAttribute FactoryVo factoryVo,
					  @RequestParam(value="factoryname", required=false) String factory_name,
					  HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		purchaseitemVo.setPrice(String.join("", purchaseitemVo.getPrice().split(",")));
		
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
	public Map<String, Object> update(@RequestParam(value="itemcode", required=false, defaultValue = "") String no,
									  @ModelAttribute PurchaseitemVo purchaseitemVo,
						  			  @ModelAttribute FactoryVo factoryVo,
						  			  @RequestParam(value="factoryname", required=false) String factory_name,
						  			  @RequestParam(value="page", required=false, defaultValue="1") int page,
						  			  HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		purchaseitemVo.setPrice(String.join("", purchaseitemVo.getPrice().split(",")));
		Map<String, Object> map = new HashMap<String, Object>();
		
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
				
				int ch = menu33Service.getcheckNodeleteX(purchaseitemVo.getNo());
				
				if(ch == 1) {
					menu33Service.update(purchaseitemVo, factoryVo);
					map.put("updateflag", "ok");
				} else {
					map.put("updateflag", "no");
				}
			}
		}
		
		List<PurchaseitemVo> purchaseitemListall = menu33Service.getPurchaseitemListall(no);
		List<PurchaseitemVo> pagepurchaseitemList = menu33Service.getpagePurchaseitemList(page, no);
		map.put("purchaseitemListall", purchaseitemListall);
		map.put("pagepurchaseitemList", pagepurchaseitemList);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/" + SUBMENU + "/delete")
	public Map<String, Object> delete(@RequestParam(value="itemcode", required=false, defaultValue = "") String no,
									  @ModelAttribute PurchaseitemVo purchaseitemVo,
 			 			 			  @ModelAttribute FactoryVo factoryVo,
 			 			 			  @RequestParam(value="factoryname", required=false) String factory_name,
 			 			 			  @RequestParam(value="page", required=false, defaultValue="1") int page,
 			 			 			  HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		purchaseitemVo.setPrice(String.join("", purchaseitemVo.getPrice().split(",")));
		Map<String, Object> map = new HashMap<String, Object>();
		
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
				
				int ch = menu33Service.getcheckNodeleteX(purchaseitemVo.getNo());
				
				if(ch == 1) {
					menu33Service.delete(purchaseitemVo, factoryVo);
					map.put("delflag", "ok");
				} else {
					map.put("delflag", "no");
				}
			}
		}
		
		List<PurchaseitemVo> purchaseitemListall = menu33Service.getPurchaseitemListall(no);
		
		int page_max = ((purchaseitemListall.size()-1) / 11) + 1;
		
		if(page_max < page) {
			page--;
		}
		
		int page_group = (page-1) / 5;
		
		List<PurchaseitemVo> pagepurchaseitemList = menu33Service.getpagePurchaseitemList(page, no);
		List<PurchaseitemVo> purchaseitemList = menu33Service.getPurchaseitemList(page_group, no);
		
		map.put("page_num", page);
		map.put("page_group", page_group);
		map.put("purchaseitemListall", purchaseitemListall);
		map.put("pagepurchaseitemList", pagepurchaseitemList);
		map.put("purchaseitemList", purchaseitemList);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/factorypaging")
	public Map<String, Object> factorypaging(@RequestParam(value="factory_page", required=false, defaultValue="1") int factory_page,
									  		 @RequestParam(value="factory_page_group", required=false, defaultValue="0") int factory_page_group,
									  		 @RequestParam(value="search_factorydata", required=false, defaultValue = "") String search_factorydata,
									  		 Model model) {
		System.out.println(factory_page);
		search_factorydata = "%" + search_factorydata + "%";
		System.out.println("search_factorydata : " + search_factorydata);
		
		List<SectionVo> factoryListall = menu33Service.getFactoryListall(search_factorydata);//모든 공장데이터
		List<SectionVo> factoryList = menu33Service.getFactoryList(factory_page_group, search_factorydata);//5페이지씩 데이터 6개
		List<SectionVo> pagefactoryList = menu33Service.getpageFactoryList(factory_page, search_factorydata);//한페이지 데이터 6개
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("factoryListall", factoryListall);
		map.put("factoryList", factoryList);
		map.put("pagefactoryList", pagefactoryList);
		map.put("factory_cur_page", factory_page);
		map.put("factory_page_group", factory_page_group);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/sectionpaging")
	public Map<String, Object> sectionpaging(@RequestParam(value="section_page", required=false, defaultValue="1") int section_page,
									  		 @RequestParam(value="section_page_group", required=false, defaultValue="0") int section_page_group,
									  		 @RequestParam(value="search_sectiondata", required=false, defaultValue = "") String search_sectiondata,
									  		 Model model) {
		System.out.println(section_page);
		search_sectiondata = "%" + search_sectiondata + "%";
		System.out.println("search_sectiondata : " + search_sectiondata);
		
		List<SectionVo> sectionListall = menu33Service.getSectionListall(search_sectiondata);//모든 대분류데이터
		List<SectionVo> sectionList = menu33Service.getSectionList(section_page_group, search_sectiondata);//5페이지씩 데이터 6개
		List<SectionVo> pagesectionList = menu33Service.getpageSectionList(section_page, search_sectiondata);//한페이지 데이터 6개
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("sectionListall", sectionListall);
		map.put("sectionList", sectionList);
		map.put("pagesectionList", pagesectionList);
		map.put("section_page", section_page);
		map.put("section_page_group", section_page_group);
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/checkNo")
	public String checkNo(@RequestParam(value="checkNo", required=false, defaultValue="") String checkNo) {
		String check = "false";
		
		if(checkNo.length() == 10) {
			int ch = menu33Service.getcheckNo(checkNo);
			
			if(ch == 0) {
				check = "true";
			}
		} else {
			check = "none";
		}
		
		return check;
	}
}







