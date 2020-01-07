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
import kr.co.itcen.fa.security.NoAuth;
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

	/* 처음 38을 들어왔을 때 혹은 list로 접근할 때 */
	@NoAuth // 현황조회는 누구든 들어올 수 있게 열어둔다.
	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "page_group", required = false, defaultValue = "0") int page_group) {

		List<BuyTaxbillVo> buyTaxbillListAll = menu38Service.getBuyTaxbillAll(); // 전체리스트
		List<BuyTaxbillVo> buyTaxbillList = menu38Service.getBuyTaxbillList(page_group); // 5개씩 리스트
		List<BuyTaxbillVo> pagebuyTaxbillList = menu38Service.getpageBuyTaxbillList(page); // 11개씩 데이터
		List<CustomerVo> getMatchTaxbillCustomerList = menu38Service.getMatchTaxbillCustomerList(); // 거래처리스트를 가져온다.
		List<BuyTaxbillItemsVo> getMatchTaxbillItemsList = menu38Service.getMatchTaxbillItemsList(); // 세금계산서와 맞는 품목리스트를
																									 // 가져온다.
		model.addAttribute("buyTaxbillListAll", buyTaxbillListAll);
		model.addAttribute("buyTaxbillList", buyTaxbillList);
		model.addAttribute("pagebuyTaxbillList", pagebuyTaxbillList);
		model.addAttribute("customerList", getMatchTaxbillCustomerList);
		model.addAttribute("itemsList", getMatchTaxbillItemsList);
		model.addAttribute("cur_page", page);
		model.addAttribute("page_group", page_group);

		return MAINMENU + "/" + SUBMENU + "/list";
	}

	/* paging을 클릭할 때 발생되는 메소드*/
	@NoAuth
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/paging")
	public Map<String, Object> paging(@RequestParam(value = "page_num", required = false, defaultValue = "1") int page,
			@RequestParam(value = "page_group", required = false, defaultValue = "0") int pageGroup,
			BuyTaxbillListVo buyTaxbillListVo) {

		Map<String, Object> map = new HashMap<String, Object>(); // front 단으로 보내줄 map

		// 검색조건 vo에 page관련 정보를 setting
		buyTaxbillListVo.setPage(page);
		buyTaxbillListVo.setPageGroup(pageGroup);

		List<BuyTaxbillVo> buyTaxbillListAll = menu38Service.getSelectedBuyTaxbillListAll(buyTaxbillListVo); // 전체리스트
		List<BuyTaxbillVo> buyTaxbillList = menu38Service.getSelectedBuyTaxbillList(buyTaxbillListVo); // 5개씩 리스트
		List<BuyTaxbillVo> pagebuyTaxbillList = menu38Service.getSelectedpageBuyTaxbillList(buyTaxbillListVo); // 11개씩
		List<CustomerVo> getMatchTaxbillCustomerList = menu38Service.getMatchTaxbillCustomerList();
		List<BuyTaxbillItemsVo> getMatchTaxbillItemsList = menu38Service.getMatchTaxbillItemsList();

		map.put("buyTaxbillListAll", buyTaxbillListAll);
		map.put("buyTaxbillList", buyTaxbillList);
		map.put("pagebuyTaxbillList", pagebuyTaxbillList);
		map.put("customerList", getMatchTaxbillCustomerList);
		map.put("itemsList", getMatchTaxbillItemsList);

		return map;
	}

	
	/* 조회버튼을 누를 때 발생하는 post 메소드*/
	@NoAuth
	@RequestMapping(value = "/" + SUBMENU + "/list", method = RequestMethod.POST)
	public String list(Model model, BuyTaxbillListVo buyTaxbillListVo,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "page_group", required = false, defaultValue = "0") int pageGroup) {

		buyTaxbillListVo.setPage(page);
		buyTaxbillListVo.setPageGroup(pageGroup);
		System.out.println(buyTaxbillListVo.getCompanyName());
		List<BuyTaxbillVo> buyTaxbillListAll = menu38Service.getSelectedBuyTaxbillListAll(buyTaxbillListVo); // 전체리스트
		List<BuyTaxbillVo> buyTaxbillList = menu38Service.getSelectedBuyTaxbillList(buyTaxbillListVo); // 5개씩 리스트
		List<BuyTaxbillVo> pagebuyTaxbillList = menu38Service.getSelectedpageBuyTaxbillList(buyTaxbillListVo); // 11개씩																								// 데이터
		List<CustomerVo> getMatchTaxbillCustomerList = menu38Service.getMatchTaxbillCustomerList();
		List<BuyTaxbillItemsVo> getMatchTaxbillItemsList = menu38Service.getMatchTaxbillItemsList();

		model.addAttribute("searchData", buyTaxbillListVo);
		model.addAttribute("buyTaxbillListAll", buyTaxbillListAll);
		model.addAttribute("buyTaxbillList", buyTaxbillList);
		model.addAttribute("pagebuyTaxbillList", pagebuyTaxbillList);
		model.addAttribute("customerList", getMatchTaxbillCustomerList);
		model.addAttribute("itemsList", getMatchTaxbillItemsList);
		model.addAttribute("cur_page", page);
		model.addAttribute("page_group", pageGroup);

		return MAINMENU + "/" + SUBMENU + "/list";
	}
}