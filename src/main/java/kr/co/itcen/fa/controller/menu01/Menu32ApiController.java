package kr.co.itcen.fa.controller.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.service.menu01.Menu32Service;
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu17.AccountManagementVo;

/**
 * 
 * @author 이종윤 
 * 매입, 매출, 자산 거래처 팝업창
 * 계정 코드, 계정명 팝업창
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
	
	@ResponseBody
	@RequestMapping("/getbankCode")
	public JSONResult getbankCodeInfo(
			@RequestParam("bankCodeVal") String customerNo){
		
		System.out.println(customerNo+"!!!");
		List<CustomerVo> customerNoList = menu32Service.getBankCodeInfo(customerNo);
		return JSONResult.success(customerNoList);
	}
	
	@ResponseBody
	@RequestMapping("/getbankName")
	public JSONResult getbankNameInfo(
			@RequestParam("bankNameVal") String name){
		
		System.out.println(name+"!!!");
		List<CustomerVo> nameList = menu32Service.getBankNameInfo(name);
		return JSONResult.success(nameList);
	}
	

	
	@ResponseBody
	@RequestMapping("/getaccountNo")
	public JSONResult getaccountNoInfo(
			@RequestParam("accountNoVal") String accountNo){
		
		System.out.println(accountNo+"!!!");
		List<AccountManagementVo> accountNoList = menu32Service.getAccountNoInfo(accountNo);
		return JSONResult.success(accountNoList);
	}
	
	@ResponseBody
	@RequestMapping("/getaccountName")
	public JSONResult getaccountNameInfo(
			@RequestParam("accountNameVal") String accountName){
		
		System.out.println(accountName+"!!!");
		List<AccountManagementVo> accountNameList = menu32Service.getAccountNameInfo(accountName);
		return JSONResult.success(accountNameList);
	}
	
	@ResponseBody
	@RequestMapping("/searchOptionCustomer")
	public Map<String, Object> searchOptionCustomerInfo(
			@RequestParam(value = "no", required = false, defaultValue = "")String no,
			@RequestParam(value="name", required = false, defaultValue = "")String name) {
		Map<String, String> customerparam = new HashMap<String, String>();
		customerparam.put("no", no);
		customerparam.put("name", name);
		
		Map<String, Object> data = menu32Service.searchOptionCustomerInfo(customerparam);
		data.put("success", true);
		return data;
	} 
	
	
	@ResponseBody
	@RequestMapping("/searchOptionBank")
	public Map<String, Object> searchOptionBankInfo(
			@RequestParam(value = "no", required = false, defaultValue = "")String no,
			@RequestParam(value="name", required = false, defaultValue = "")String name) {
		Map<String, String> bankparam = new HashMap<String, String>();
		bankparam.put("no", no);
		bankparam.put("name", name);
		
		Map<String, Object> data = menu32Service.searchOptionBankInfo(bankparam);
		data.put("success", true);
		return data;
	}
	
	@ResponseBody
	@RequestMapping("/searchOptionAccount")
	public Map<String, Object> searchOptionAccountInfo(
			@RequestParam(value = "accountNo", required = false, defaultValue = "")String accountNo,
			@RequestParam(value="accountName", required = false, defaultValue = "")String accountName) {
		Map<String, String> accountparam = new HashMap<String, String>();
		accountparam.put("accountNo", accountNo);
		accountparam.put("accountName", accountName);
		
		Map<String, Object> data = menu32Service.searchOptionAccountInfo(accountparam);
		data.put("success", true);
		return data;
	}

}
