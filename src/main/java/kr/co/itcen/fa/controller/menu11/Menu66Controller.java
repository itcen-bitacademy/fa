package kr.co.itcen.fa.controller.menu11;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu11.Menu66Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;

/**
 * 
 * @author 박준호 상환내역관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu66Controller.MAINMENU)
public class Menu66Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "66";

	@Autowired
	private Menu66Service menu66Service;

	@RequestMapping(value = {"/" + SUBMENU,"/"+SUBMENU+"list"},method = RequestMethod.GET)
	public String list(
			Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, 
			@ModelAttribute("vo") RepayVo vo) {
		System.out.println("====== list ======");
		System.out.println(vo.toString());
		System.out.println(vo.getCode());
		System.out.println(vo.getDebtType());
		// tb_repay 의 debtNo를 통해 각 사채테이블의 PK인 no와 비교하여 데이터 호출
		DataResult<RepayVo> dataResult = menu66Service.list(page, vo.getCode(), vo.getDebtType());
		
		model.addAttribute("dataResult", dataResult);
		model.addAttribute("contentsCount", dataResult.getPagination().getTotalCnt()); // 게시물 수
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/list" }, method = RequestMethod.POST)
	public String list(
			@RequestParam(value="code",required = false, defaultValue = "") String code, 
			@RequestParam(value="debtType",required = false, defaultValue = "") String debtType,
			@RequestParam(value="page", required=false,defaultValue = "1") int page) {
		
		return "redirect:/"+MAINMENU+"/"+SUBMENU + "?code="+code+"&debtType="+debtType+"&page"+page;
	}
	
	@RequestMapping(value = "/" + SUBMENU + "/update", method = RequestMethod.POST)
	public String update(
			@ModelAttribute("vo") RepayVo vo, 
			@AuthUser UserVo userVo) {
		vo.setInsertId(userVo.getId()); // 등록자 아이디 삽입
		menu66Service.update(vo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
}
