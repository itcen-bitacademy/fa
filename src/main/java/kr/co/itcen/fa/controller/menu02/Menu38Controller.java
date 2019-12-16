package kr.co.itcen.fa.controller.menu02;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu38Service;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillItemsVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillListVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillVo;
import kr.co.itcen.fa.vo.menu02.CustomerVo;

/**
 * 
 * @author 이제구 매입세금계산서현황조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu38Controller.MAINMENU)
public class Menu38Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "38";

	@Autowired
	private Menu38Service menu38Service;

	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "page_group", required = false, defaultValue = "0") int page_group) {

		List<BuyTaxbillVo> buyTaxbillListAll = menu38Service.getBuyTaxbillAll(); // 전체리스트
		List<BuyTaxbillVo> buyTaxbillList = menu38Service.getBuyTaxbillList(page_group); // 5개씩 리스트
		List<BuyTaxbillVo> pagebuyTaxbillList = menu38Service.getpageBuyTaxbillList(page); // 11개씩 데이터
		List<CustomerVo> getMatchTaxbillCustomerList = menu38Service.getMatchTaxbillCustomerList();
		List<BuyTaxbillItemsVo> getMatchTaxbillItemsList = menu38Service.getMatchTaxbillItemsList();

		model.addAttribute("buyTaxbillListAll", buyTaxbillListAll);
		model.addAttribute("buyTaxbillList", buyTaxbillList);
		model.addAttribute("pagebuyTaxbillList", pagebuyTaxbillList);
		model.addAttribute("customerList", getMatchTaxbillCustomerList);
		model.addAttribute("itemsList", getMatchTaxbillItemsList);
		model.addAttribute("cur_page", page);
		model.addAttribute("page_group", page_group);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/paging")
	public Map<String, Object> paging(@RequestParam(value="page", required=false, defaultValue="1") int page,
									  @RequestParam(value="page_group", required=false, defaultValue="0") int page_group,
									  Model model) {

		List<BuyTaxbillVo> buyTaxbillListAll = menu38Service.getBuyTaxbillAll(); // 전체리스트
		List<BuyTaxbillVo> buyTaxbillList = menu38Service.getBuyTaxbillList(page_group); // 5개씩 리스트
		List<BuyTaxbillVo> pagebuyTaxbillList = menu38Service.getpageBuyTaxbillList(page); // 11개씩 데이터
		List<CustomerVo> getMatchTaxbillCustomerList = menu38Service.getMatchTaxbillCustomerList();
		List<BuyTaxbillItemsVo> getMatchTaxbillItemsList = menu38Service.getMatchTaxbillItemsList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("buyTaxbillListAll", buyTaxbillListAll);
		map.put("buyTaxbillList", buyTaxbillList);
		map.put("pagebuyTaxbillList", pagebuyTaxbillList);
		map.put("customerList", getMatchTaxbillCustomerList);
		map.put("itemsList", getMatchTaxbillItemsList);
		map.put("cur_page", page);
		map.put("page_group", page_group);
		
		return map;
	}

	@RequestMapping(value = "/" + SUBMENU + "/list", method = RequestMethod.POST)
	public String list(Model model, BuyTaxbillListVo buyTaxbillListVo, @RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "page_group", required = false, defaultValue = "0") int page_group) {


		List<BuyTaxbillVo> buyTaxbillListAll = menu38Service.getSelectedBuyTaxbillList(buyTaxbillListVo); // 전체리스트
		List<BuyTaxbillVo> buyTaxbillList = menu38Service.getBuyTaxbillList(page_group); // 5개씩 리스트
		List<BuyTaxbillVo> pagebuyTaxbillList = menu38Service.getpageBuyTaxbillList(page); // 11개씩 데이터
		List<CustomerVo> getMatchTaxbillCustomerList = menu38Service.getMatchTaxbillCustomerList();
		List<BuyTaxbillItemsVo> getMatchTaxbillItemsList = menu38Service.getMatchTaxbillItemsList();

		model.addAttribute("buyTaxbillListAll", buyTaxbillListAll);
		model.addAttribute("buyTaxbillList", buyTaxbillList);
		model.addAttribute("pagebuyTaxbillList", pagebuyTaxbillList);
		model.addAttribute("customerList", getMatchTaxbillCustomerList);
		model.addAttribute("itemsList", getMatchTaxbillItemsList);

		return MAINMENU + "/" + SUBMENU + "/list";
	}
}