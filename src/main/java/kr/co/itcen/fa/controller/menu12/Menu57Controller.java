package kr.co.itcen.fa.controller.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu12.Menu57Service;
import kr.co.itcen.fa.vo.menu12.SalesVo;

/**
 * 
 * @author 곽세연
 * 월별거래처매출현황
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu15Controller.MAINMENU)
public class Menu57Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "57";


	@Autowired
	private Menu57Service menu57Service;
	
	//@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/list" })
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model ,SalesVo vo) {
		if(vo.getSalesDate()==null || "".equals(vo.getSalesDate()))
			vo.setSalesDate("");
		if(vo.getCustomerCode()==null || "".equals(vo.getCustomerCode()))
			vo.setCustomerCode("");
		
		List<SalesVo> list = menu57Service.getList(vo);
		model.addAttribute("list",list);
		
		List<SalesVo> customerName = menu57Service.getcustomerName();
		model.addAttribute("customerName",customerName);

		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	
}

