package kr.co.itcen.fa.controller.menu02;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		if(customerVo.getDeleteFlag() == null) {
			customerVo.setDeleteFlag("N");
		}

		DataResult<CustomerVo> dataResult = menu36Service.selectAll(page, customerVo);
		model.addAttribute("inputCustomer", customerVo);
		model.addAttribute("dataResult", dataResult);
		model.addAttribute("customerVo", dataResult.getDatas());

		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 매입거래처 팝업
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/gets")
	public Map<String, Object> gets(@RequestParam(value="no", required=false, defaultValue="") String no,
									@RequestParam(value="name", required=false, defaultValue="") String name) {
		System.out.println("gets");
		
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("no", no);
		parameters.put("name", name);
		
		Map<String, Object> data = menu36Service.gets(parameters);
		data.put("success", true);
		return data;
	}
}
