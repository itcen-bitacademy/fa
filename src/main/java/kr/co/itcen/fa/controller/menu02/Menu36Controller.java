package kr.co.itcen.fa.controller.menu02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu36Service;
import kr.co.itcen.fa.vo.menu02.CustomerVo;

/**
 * 
 * @author 이지은
 * 매입거래처현황조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu36Controller.MAINMENU)
public class Menu36Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "36";
	
	@Autowired
	private Menu36Service menu36Service;
	
	
	// 걍 페이지 들어가자마자 조회
//	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
//	public String list(Model model) {
//		List<CustomerVo> customerVo = menu36Service.list();
//		model.addAttribute("customerVo", customerVo);
//		return MAINMENU + "/" + SUBMENU + "/list";
//	}
	
	@RequestMapping({"", "/" + SUBMENU + "/list", "/" + SUBMENU })
	public String closingDateListPage(CustomerVo customerVo, Model model, @RequestParam(defaultValue = "1") int page) {
		
		System.out.println("@@@@@@@@@@@@wlsWkwlsWK@"+customerVo);
		if(customerVo.getDeleteFlag() == null) {
			customerVo.setDeleteFlag("N");
		}

		DataResult<CustomerVo> dataResult = menu36Service.selectAll(page, customerVo);
		model.addAttribute("dataResult", dataResult);
		model.addAttribute("customerVo", dataResult.getDatas());

		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
