package kr.co.itcen.fa.controller.menu02;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.security.Auth;
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
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String main(@RequestParam(value="page", required=false, defaultValue="1") int page,
			   		   @RequestParam(value="page_group", required=false, defaultValue="0") int page_group,
			   		   Model model) {
		List<PurchaseitemVo> purchaseitemListall = menu34Service.getPurchaseitemListall();       	// 전체리스트
		List<PurchaseitemVo> purchaseitemList = menu34Service.getPurchaseitemList(page_group);   	// 5개씩 리스트
		List<PurchaseitemVo> pagepurchaseitemList = menu34Service.getpagePurchaseitemList(page); 	// 11개씩 데이터
		List<SectionVo> sectionList = menu34Service.getSectionList();								//대분류 리스트
		List<SectionVo> factoryList = menu34Service.getFactorysectionList();						//공장 리스트
		
		model.addAttribute("purchaseitemListall", purchaseitemListall);
		model.addAttribute("purchaseitemList", purchaseitemList);
		model.addAttribute("pagepurchaseitemList", pagepurchaseitemList);
		model.addAttribute("sectionList", sectionList);
		model.addAttribute("factoryList", factoryList);
		model.addAttribute("cur_page", page);
		model.addAttribute("page_group", page_group);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/paging")
	public Map<String, Object> paging(@RequestParam(value="page", required=false, defaultValue="1") int page,
									  @RequestParam(value="page_group", required=false, defaultValue="0") int page_group,
									  Model model) {
		System.out.println(page);
		List<PurchaseitemVo> pagepurchaseitemList = menu34Service.getpagePurchaseitemList(page);
		List<PurchaseitemVo> purchaseitemList = menu34Service.getPurchaseitemList(page_group);
		List<PurchaseitemVo> purchaseitemListall = menu34Service.getPurchaseitemListall();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("purchaseitemListall", purchaseitemListall);
		map.put("purchaseitemList", purchaseitemList);
		map.put("pagepurchaseitemList", pagepurchaseitemList);
		map.put("cur_page", page);
		map.put("page_group", page_group);
		
		return map;
	}
}
