package kr.co.itcen.fa.controller.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu11.Menu47Service;
import kr.co.itcen.fa.util.Pagination;
import kr.co.itcen.fa.vo.menu11.STermDebtVo;

/**
 * 
 * @author 반현길
 * 단기차입금현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu47Controller.MAINMENU)
public class Menu47Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "47";
	
	@Autowired
	private Menu47Service menu47Service;
	
	                                   //   /11/47, /11/47/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model) {
		Pagination pagination = new Pagination(5, 5, 1);	//기본 페이지는 1로 설정
		List<STermDebtVo> list = menu47Service.getList(pagination);
		
		System.out.println("list size : " + list.size() + " startPage : " + pagination.getStartPage() + " endPage : " + pagination.getEndPage());
		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
