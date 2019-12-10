package kr.co.itcen.fa.controller.menu12;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu12.Menu52Service;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu12.CustomerVo;

/**
 * 
 * @author 양홍석
 * 매출거래처현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu52Controller.MAINMENU)
public class Menu52Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "52";

	@Autowired
	private Menu52Service menu52Service;
	
	@RequestMapping("/" + SUBMENU)
	public String list(Model model, @RequestParam(value="page", required=false, defaultValue="1") int page) {
		CustomerVo customerVo = new CustomerVo();
		int totalCnt = menu52Service.getTotalCnt(customerVo);
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		
		model.addAttribute("customerList", menu52Service.getAllCustomer(customerVo, pagination));
		model.addAttribute("pagination", pagination);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@RequestMapping(value="/" + SUBMENU + "/list", method=RequestMethod.POST)
	public String list(Model model, CustomerVo customerVo, @RequestParam(value="page", required=false, defaultValue="1") int page) {
		System.out.println(customerVo);
		
		int totalCnt = menu52Service.getTotalCnt(customerVo);
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		model.addAttribute("customerList", menu52Service.getAllCustomer(customerVo, pagination));
		model.addAttribute("pagination", pagination);
		model.addAttribute("customerVo", customerVo);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/gets")
	public Map<String, Object> gets(@RequestParam(value="no", required=false, defaultValue="") String no,
									@RequestParam(value="name", required=false, defaultValue="") String name) {
		System.out.println("gets");
		
		Map<String, String> parameters = new HashMap<String, String>();
		parameters.put("no", no);
		parameters.put("name", name);
		
		Map<String, Object> data = menu52Service.gets(parameters);
		data.put("success", true);
		return data;
	}
	
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/get")
	public Map<String, Object> get(@RequestParam(value="no", required=false, defaultValue="") String no	) {
		System.out.println("gets");
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("customer", menu52Service.get(no));
		data.put("success", true);
		return data;
	}
}
