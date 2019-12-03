package kr.co.itcen.fa.controller.menu02;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu37Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;
import kr.co.itcen.fa.vo.menu02.BuyTaxbillVo;
import kr.co.itcen.fa.vo.menu02.CustomerVo;

/**
 * 
 * @author 이제구
 * 매입세금계산서관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu37Controller.MAINMENU)
public class Menu37Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "37";
	//menu37Service.customerRead();
	@Autowired
	private Menu37Service menu37Service;
	
	@RequestMapping(value= {"/" + SUBMENU, "/" + SUBMENU + "/add" }, method = RequestMethod.GET)
	public String add(@ModelAttribute UserVo authUser, Model model) {
		List<CustomerVo> customerList =  menu37Service.customerList();
		List<BankAccountVo> customerBankList = menu37Service.customerBankList();
		
		model.addAttribute("customerList", customerList);
		model.addAttribute("customerBankList", customerBankList);
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@RequestMapping(value = "/" + SUBMENU + "/add", method = RequestMethod.POST)
	public String write(@ModelAttribute BuyTaxbillVo vo, HttpSession session) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		String insertUserid = authUser.getId();
		vo.setInsertUserid(insertUserid);
		
		menu37Service.insert(vo);

		return MAINMENU + "/" + SUBMENU + "/add";
	}
}
