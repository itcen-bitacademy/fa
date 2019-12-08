package kr.co.itcen.fa.controller.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu12.Menu56Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu12.CurrentSituationVo;
import kr.co.itcen.fa.vo.menu12.SellTaxbillVo;

/**
 * 
 * @author 곽세연
 * 품목대분류별매입매출현황
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu15Controller.MAINMENU)
public class Menu56Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "56";


	@Autowired
	private Menu56Service menu56Service;
	
	// 대분류를 가져오기 위한 코드
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		menu56Service.test();
		/*
		 * JSP
		 * 12/56/list.jsp
		 */
		List<CurrentSituationVo> list = menu56Service.getList();
		model.addAttribute("list",list);
		
		// 대분류 목록을 보여주기 위한 코드
		List<SectionVo> maincategory = menu56Service.getMainCategory();
		model.addAttribute("maincategory",maincategory);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	
	@RequestMapping(value= {"/"+ SUBMENU + "/list/{no}"}, method=RequestMethod.POST)
	public String list(@PathVariable("no")int no, Model model) {
		
		/*selltaxbillvo.setSalesNo(pathSalesNO);
		
		System.out.println(selltaxbillvo.getVoucherUse());
		
		menu53Service.taxbillupdate(selltaxbillvo);
		menu53Service.salesUpdate(selltaxbillvo);
		System.out.println("업데이트 이벤트 발생");*/
		
		// 대분류 목록을 보여주기 위한 코드
		List<SectionVo> maincategory = menu56Service.getMainCategory();
		
		// 분류 목록을 보여주기 위한 코드
		List<SectionVo> subcategory = menu56Service.getSubCategory(no);
		
		model.addAttribute("maincategory",maincategory);
		model.addAttribute("subcategory", subcategory);
		
		System.out.println("main카테고리 이벤트 발생");
		
		return MAINMENU + "/" + SUBMENU + "/list"; 
	}
	
	
	
	
}

