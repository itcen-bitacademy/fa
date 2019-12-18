package kr.co.itcen.fa.controller.menu12;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu12.Menu14Service;
import kr.co.itcen.fa.vo.menu12.SalesSearchVo;

/**
 * 
 * @author 김현곤
 * 매출관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu14Controller.MAINMENU)
public class Menu14Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "14";

	@Autowired
	private Menu14Service menu14Service;
	
	// 검색필터(조건) 없는 목록 조회
	@RequestMapping(value={"","/" + SUBMENU, "/" + SUBMENU, "/" + SUBMENU, "/" + SUBMENU + "/{page}" }, method=RequestMethod.GET)
	public String list(Model model,
						@PathVariable(name="page", required=false) String page) {
		int ipage = 1;
		if(page!=null) { // pathvariable 페이지 없는경우 1페이지 세팅
			ipage = Integer.parseInt(page);
		} 
		
		model.addAttribute("customerlist", menu14Service.getCustomerList()); // 거래처 목록
		model.addAttribute("itemlist", menu14Service.getItemList()); // 품목 목록
		model.addAttribute("dataResult", menu14Service.getList(ipage)); // 조회실행
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 검색필터(조건) 있는 목록 조회
	@RequestMapping(value={"/" + SUBMENU, "/" + SUBMENU, "/" + SUBMENU, "/" + SUBMENU + "/{page}"}, method=RequestMethod.POST)
	public String list(SalesSearchVo vo, String dates, Model model,
							@PathVariable(name="page", required=false)String page, 
							@RequestParam(name="viewCount") int viewCount) {	
		int ipage = 1;
		if(page!=null) { // pathvariable 페이지 없는경우 1페이지 세팅
			ipage = Integer.parseInt(page);
		}
		
		System.out.println(viewCount);
		
		String[] date = dates.split(" - "); // daterange 분리
		vo.setStartDate(date[0]);
		vo.setEndDate(date[1]);
		vo.setSearchFlag(true); // 검색 여부 플래그
		
		model.addAttribute("customerlist", menu14Service.getCustomerList()); // 거래처 목록
		model.addAttribute("itemlist", menu14Service.getItemList()); // 품목 목록
		
		model.addAttribute("dataResult", menu14Service.getSerchList(vo, ipage, viewCount)); // 조회실행
		
		model.addAttribute("search", vo); // 검색 조건 데이터 저장 (화면에 세팅)
		model.addAttribute("viewCount", viewCount);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
