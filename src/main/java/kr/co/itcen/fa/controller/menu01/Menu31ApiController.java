package kr.co.itcen.fa.controller.menu01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.service.menu01.Menu32Service;
import kr.co.itcen.fa.vo.menu17.AccountManagementVo;

@RestController("Menu31Controller")
@RequestMapping("api/account")
public class Menu31ApiController {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "31";
	
	@Autowired
	private Menu32Service menu32Service;
	
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

}
