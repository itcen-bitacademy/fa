package kr.co.itcen.fa.controller.menu01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.service.menu01.Menu32Service;
import kr.co.itcen.fa.vo.menu01.CustomerVo;

/**
 * 
 * @author 이종윤 
 * 매입, 매출, 자산 거래처 팝업창
 *
 */
@RestController("Menu32Controller")
@RequestMapping("api/customer")
public class Menu32ApiController {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "32";
	
	@Autowired
	private Menu32Service menu32Service;
	
	@ResponseBody
	@RequestMapping("/getcustomerNo")
	public JSONResult getCustomerNoInfo(
			@RequestParam("customerNoVal") String customerNo) {
		System.out.println(customerNo);
		List<CustomerVo> customerVolist = menu32Service.getCustomerNoInfo(customerNo);
		return JSONResult.success(customerVolist);
	}
	
	@ResponseBody
	@RequestMapping("/getcustomerName")
	public JSONResult getCustomerNameInfo(
			@RequestParam("customerNameVal") String customerName){
		
		System.out.println(customerName+"!!!");
		List<CustomerVo> customerNameList = menu32Service.getCustomerNameInfo(customerName);
		return JSONResult.success(customerNameList);
	}

}
