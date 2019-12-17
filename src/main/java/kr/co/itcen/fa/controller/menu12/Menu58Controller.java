package kr.co.itcen.fa.controller.menu12;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu36Service;
import kr.co.itcen.fa.service.menu12.Menu58Service;
import kr.co.itcen.fa.vo.menu02.PurchasemanagementVo;

/**
 * 
 * @author 양홍석
 * 월별거래처매입현황
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu58Controller.MAINMENU)
public class Menu58Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "58";

	@Autowired
	private Menu58Service menu58Service;
	
	@Autowired
	private Menu36Service menu36Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(PurchasemanagementVo purchasemanagementVo, Model model, @RequestParam(defaultValue = "1") int page) {
		model.addAttribute("dataResult", menu58Service.getAllPurchase(purchasemanagementVo, page));
		model.addAttribute("purchase", purchasemanagementVo);
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
	
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/get")
	public Map<String, Object> get(@RequestParam(value="no", required=false, defaultValue="") String no	) {
		System.out.println("get");
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("customer", menu58Service.get(no));
		data.put("success", true);
		return data;
	}
}
