package kr.co.itcen.fa.controller.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.MenuService;
import kr.co.itcen.fa.service.menu12.Menu53Service;
import kr.co.itcen.fa.vo.menu12.SellTaxbillVo;

/**
 * 
 * @author 안태영
 * 매출세금계산서관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu53Controller.MAINMENU)
public class Menu53Controller {
	
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "53";

	// 작업순서
	// 1. 매출조회 누르면 리스트 출력
	// 2. insert
	// 3. 테이블 리스트 출력
	
	@Autowired
	private MenuService menuService;

	@Autowired
	private Menu53Service menu53Service;
	
	//@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/list" })
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		//menu53Service.test();
		/*
		 * JSP
		 * 12/15/list.jsp
		 */
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 매출일자와 매출번호로 검색한후, 출력되는 기능
	// value="/" + SUBMENU + "/add", method=RequestMethod.GET
	@RequestMapping(value="/" + SUBMENU + "/list", method=RequestMethod.POST)
	public String list(@RequestParam("sales-date")String date, @RequestParam("sales-no")String no, Model model) {
		
		List<SellTaxbillVo> list = menu53Service.getAllList(date, no);
		model.addAttribute("flag", "true");
		model.addAttribute("list", list);
		
		System.out.println(list.toString());
		System.out.println("이벤트 발생");
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.POST)
	public String add(SellTaxbillVo selltaxbillvo) {
		System.out.println("추가 이벤트 발생");
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	

}
