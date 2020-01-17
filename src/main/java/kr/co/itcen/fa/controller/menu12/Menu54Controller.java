package kr.co.itcen.fa.controller.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.NoAuth;
import kr.co.itcen.fa.service.menu12.Menu54Service;
import kr.co.itcen.fa.vo.menu12.TaxbillSearchVo;

/**
 * 
 * @author 안태영
 * 매출세금계산서현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu54Controller.MAINMENU)
public class Menu54Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "54";

	@Autowired
	private Menu54Service menu54Service;
	
	
	// 필터기능없이 조회되는 리스트 
	@NoAuth
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/list", "/" + SUBMENU + "/{page}" }, method=RequestMethod.GET)
	public String list(Model model, @PathVariable(name="page", required=false) String page) {
		
		System.out.println("검색기능없는 조회");
		System.out.println("-----" + page + "넘어오는 페이지");
		
		int ipage = 1;
		if(page!=null) { // pathvariable 페이지 없는경우 1페이지 세팅
			ipage = Integer.parseInt(page);
		} 
		
		System.out.println("-----" + ipage + "현재 페이지");
		
		model.addAttribute("order", null);
		
		// 거래처에 대한 리스트를 출력해주는 기능
		model.addAttribute("customerlist", menu54Service.salesCustomer());
		
		// 판매물품에 대한 리스트를 출력해주는 기능
		model.addAttribute("itemlist", menu54Service.salesItems());
		
		// 세금계산서에 대한 리스트를 출력해주는 기능
		model.addAttribute("taxlist", menu54Service.taxbillList());
		
		// 필터기능을 거치지 않고 전체 리스트가 조회되는 기능
		model.addAttribute("resultlist", menu54Service.taxbillAllList(ipage));
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 조회기능을 구현한 Controller
	@NoAuth
	@RequestMapping(value={"/" + SUBMENU, "/" + SUBMENU, "/" + SUBMENU, "/" + SUBMENU + "/{page}"}, method=RequestMethod.POST)
	public String list(TaxbillSearchVo tvo, Model model, 
			@PathVariable(name="page", required=false)String page,
			@RequestParam(name="orderData")String orderData
			) {
		//@RequestParam(name="viewCount") int viewCount
		
		System.out.println("검색기능");
		System.out.println("-----" + page + "넘어오는 페이지");
		
		int ipage = 1;
		if(page!=null) { // pathvariable 페이지 없는경우 1페이지 세팅
			ipage = Integer.parseInt(page);
		}
		
		tvo.setSearchFlag(true); // 검색 여부 플래그
		
		System.out.println("-----" + ipage + "현재 페이지");
		System.out.println("-----" + orderData + "정렬순서");
		System.out.println("-----" + tvo.getStartDate() + "시작일");
		System.out.println("-----" + tvo.getEndDate() + "종료일");
		System.out.println("-----" + tvo.getItemName() + "아이템 이름");
		
		// 거래처에 대한 리스트를 출력해주는 기능
		model.addAttribute("customerlist", menu54Service.salesCustomer());
				
		// 판매물품에 대한 리스트를 출력해주는 기능
		model.addAttribute("itemlist", menu54Service.salesItems());
				
		// 세금계산서에 대한 리스트를 출력해주는 기능
		model.addAttribute("taxlist", menu54Service.taxbillList());
		
		model.addAttribute("order", tvo.getOrderData());
		
		//model.addAttribute("resultlist", menu54Service.taxbillSearch(tvo, ipage, viewCount));
		model.addAttribute("resultlist", menu54Service.taxbillSearch(tvo, ipage));
		
		System.out.println(tvo.toString());	// 객체에 값은 담겨있다.
		
		model.addAttribute("search", tvo);		// 검색 조건 데이터 저장
		
		//model.addAttribute("viewCount", viewCount);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@NoAuth
	@ResponseBody
	@RequestMapping(value={"/" + SUBMENU + "/sub"}, method=RequestMethod.POST)
	public List<TaxbillSearchVo> sublist(@ModelAttribute TaxbillSearchVo vo, Model model){
		System.out.println("Ajax를 통한 세금계산서 번호 출력");
		
		List<TaxbillSearchVo> list = menu54Service.subTaxbillno(vo);
		
		System.out.println(vo.toString());
		
		System.out.println(list.toString());
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.toString());
		}
		
		//model.addAttribute("list", "test");
		
		return list;
	}


}
