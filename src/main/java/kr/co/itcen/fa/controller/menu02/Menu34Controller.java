package kr.co.itcen.fa.controller.menu02;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.NoAuth;
import kr.co.itcen.fa.service.menu02.Menu34Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu02.PurchaseitemVo;

/**
 * 
 * @author 강민호
 * 매입품목현황조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu34Controller.MAINMENU)
public class Menu34Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "34";
	
	@Autowired
	private Menu34Service menu34Service;
	
	@NoAuth
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String main(@ModelAttribute PurchaseitemVo purchaseitemVo,
					   @RequestParam(value="page", required=false, defaultValue="1") int page,
			   		   @RequestParam(value="page_group", required=false, defaultValue="0") int page_group,
			   		   
			   		   @RequestParam(value="price_start", required=false, defaultValue="") String price_start,
			   		   @RequestParam(value="price_end", required=false, defaultValue="") String price_end,
			   		   @RequestParam(value="producedate_start", required=false, defaultValue="") String producedate_start,
			   		   @RequestParam(value="producedate_end", required=false, defaultValue="") String producedate_end,
			   		   @RequestParam(value="deleteflag", required=false, defaultValue="N") String deleteflag,
			   		   
			   		   @RequestParam(value="section_page", required=false, defaultValue="1") int section_page,
					   @RequestParam(value="section_page_group", required=false, defaultValue="0") int section_page_group,
					   @RequestParam(value="search_sectiondata", required=false, defaultValue = "") String search_sectiondata,
					   @RequestParam(value="factory_page", required=false, defaultValue="1") int factory_page,
					   @RequestParam(value="factory_page_group", required=false, defaultValue="0") int factory_page_group,
					   @RequestParam(value="search_sectiondata", required=false, defaultValue = "") String search_factorydata,
			   		   Model model) {
		Map<String, Object> bet_map = new HashMap<String, Object>();
		
		price_start = String.join("", price_start.split(","));
		price_end = String.join("", price_end.split(","));
		
		bet_map.put("price_start", price_start);
		bet_map.put("price_end", price_end);
		bet_map.put("producedate_start", producedate_start);
		bet_map.put("producedate_end", producedate_end);
		
		purchaseitemVo.setDeleteflag(deleteflag);
		List<PurchaseitemVo> purchaseitemListall = menu34Service.getPurchaseitemListall(purchaseitemVo, bet_map);//모든 데이터
		List<PurchaseitemVo> purchaseitemList = menu34Service.getPurchaseitemList(page_group, purchaseitemVo, bet_map);//5페이지씩 데이터 55개
		List<PurchaseitemVo> pagepurchaseitemList = menu34Service.getpagePurchaseitemList(page, purchaseitemVo, bet_map);//한페이지 데이터 11개
		
		///////////////
		search_sectiondata = "%" + search_sectiondata + "%";
		List<SectionVo> sectionListall = menu34Service.getSectionListall(search_sectiondata);//모든 대분류데이터
		List<SectionVo> sectionList = menu34Service.getSectionList(section_page_group, search_sectiondata);//5페이지씩 데이터 6개
		List<SectionVo> pagesectionList = menu34Service.getpageSectionList(section_page, search_sectiondata);//한페이지 데이터 6개
		//////////////
		
		//////////////
		search_factorydata = "%" + search_factorydata + "%";
		List<SectionVo> factoryListall = menu34Service.getFactoryListall(search_factorydata);//모든 공장데이터
		List<SectionVo> factoryList = menu34Service.getFactoryList(factory_page_group, search_factorydata);//5페이지씩 데이터 6개
		List<SectionVo> pagefactoryList = menu34Service.getpageFactoryList(factory_page, search_factorydata);//한페이지 데이터 6개
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
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@NoAuth
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/paging")
	public Map<String, Object> paging(@RequestParam(value="no", required=false, defaultValue="") String no,
									  @RequestParam(value="sectionname", required=false, defaultValue="") String sectionname,
									  @RequestParam(value="factoryname", required=false, defaultValue="") String factoryname,
									  @RequestParam(value="price_start", required=false, defaultValue="") String price_start,
									  @RequestParam(value="price_end", required=false, defaultValue="") String price_end,
									  @RequestParam(value="name", required=false, defaultValue="") String name,
									  @RequestParam(value="sectioncode", required=false, defaultValue="") String sectioncode,
									  @RequestParam(value="factorycode", required=false, defaultValue="") String factorycode,
									  @RequestParam(value="producedate_start", required=false, defaultValue="") String producedate_start,
									  @RequestParam(value="producedate_end", required=false, defaultValue="") String producedate_end,
									  @RequestParam(value="deleteflag", required=false, defaultValue="N") String deleteflag,
									  @RequestParam(value="page", required=false, defaultValue="1") int page,
									  @RequestParam(value="page_group", required=false, defaultValue="0") int page_group) {
		PurchaseitemVo purchaseitemVo = new PurchaseitemVo();
		
		purchaseitemVo.setNo(no);
		purchaseitemVo.setSectionname(sectionname);
		purchaseitemVo.setFactoryname(factoryname);
		purchaseitemVo.setName(name);
		purchaseitemVo.setSectioncode(sectioncode);
		purchaseitemVo.setFactorycode(factorycode);
		purchaseitemVo.setDeleteflag(deleteflag);
		
		price_start = String.join("", price_start.split(","));
		price_end = String.join("", price_end.split(","));
		
		Map<String, Object> bet_map = new HashMap<String, Object>();
		bet_map.put("price_start", price_start);
		bet_map.put("price_end", price_end);
		bet_map.put("producedate_start", producedate_start);
		bet_map.put("producedate_end", producedate_end);
		
		List<PurchaseitemVo> purchaseitemListall = menu34Service.getPurchaseitemListall(purchaseitemVo, bet_map);
		List<PurchaseitemVo> purchaseitemList = menu34Service.getPurchaseitemList(page_group, purchaseitemVo, bet_map);
		List<PurchaseitemVo> pagepurchaseitemList = menu34Service.getpagePurchaseitemList(page, purchaseitemVo, bet_map);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("purchaseitemListall", purchaseitemListall);
		map.put("purchaseitemList", purchaseitemList);
		map.put("pagepurchaseitemList", pagepurchaseitemList);
		map.put("cur_page", page);
		map.put("page_group", page_group);
		
		return map;
	}
	
	@NoAuth
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/factorypaging")
	public Map<String, Object> factorypaging(@RequestParam(value="factory_page", required=false, defaultValue="1") int factory_page,
									  		 @RequestParam(value="factory_page_group", required=false, defaultValue="0") int factory_page_group,
									  		 @RequestParam(value="search_factorydata", required=false, defaultValue = "") String search_factorydata,
									  		 Model model) {
		search_factorydata = "%" + search_factorydata + "%";
		
		List<SectionVo> factoryListall = menu34Service.getFactoryListall(search_factorydata);//모든 공장데이터
		List<SectionVo> factoryList = menu34Service.getFactoryList(factory_page_group, search_factorydata);//5페이지씩 데이터 6개
		List<SectionVo> pagefactoryList = menu34Service.getpageFactoryList(factory_page, search_factorydata);//한페이지 데이터 6개
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("factoryListall", factoryListall);
		map.put("factoryList", factoryList);
		map.put("pagefactoryList", pagefactoryList);
		map.put("factory_cur_page", factory_page);
		map.put("factory_page_group", factory_page_group);
		
		return map;
	}
	
	@NoAuth
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/sectionpaging")
	public Map<String, Object> sectionpaging(@RequestParam(value="section_page", required=false, defaultValue="1") int section_page,
									  		 @RequestParam(value="section_page_group", required=false, defaultValue="0") int section_page_group,
									  		 @RequestParam(value="search_sectiondata", required=false, defaultValue = "") String search_sectiondata,
									  		 Model model) {
		search_sectiondata = "%" + search_sectiondata + "%";
		
		List<SectionVo> sectionListall = menu34Service.getSectionListall(search_sectiondata);//모든 대분류데이터
		List<SectionVo> sectionList = menu34Service.getSectionList(section_page_group, search_sectiondata);//5페이지씩 데이터 6개
		List<SectionVo> pagesectionList = menu34Service.getpageSectionList(section_page, search_sectiondata);//한페이지 데이터 6개
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("sectionListall", sectionListall);
		map.put("sectionList", sectionList);
		map.put("pagesectionList", pagesectionList);
		map.put("section_page", section_page);
		map.put("section_page_group", section_page_group);
		
		return map;
	}
}
