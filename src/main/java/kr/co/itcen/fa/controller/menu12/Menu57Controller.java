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
import kr.co.itcen.fa.security.NoAuth;
import kr.co.itcen.fa.service.menu02.Menu36Service;
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
	
	@Autowired
	private Menu36Service menu36Service;
	
	@NoAuth
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(SalesVo vo, Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(value="salesDate", required=false)String salesDate,
			@RequestParam(value="customerCode", required=false)String customerCode) {
		model.addAttribute("dataResult", menu57Service.getAllSales(vo, page));
		model.addAttribute("sales", vo);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 매입거래처 팝업
	@NoAuth
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/gets")
	public Map<String, Object> gets(@RequestParam(value="no", required=false, defaultValue="") String no,
									@RequestParam(value="name", required=false, defaultValue="") String name) {
		
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("no", no);
		parameters.put("name", name);
		
		Map<String, Object> data = menu36Service.gets(parameters);
		data.put("success", true);
		return data;
	}
	
	@NoAuth
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/get")
	public Map<String, Object> get(@RequestParam(value="no", required=false, defaultValue="") String no	) {
		System.out.println("get");
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("customer", menu57Service.get(no));
		data.put("success", true);
		return data;
	}
	
}

