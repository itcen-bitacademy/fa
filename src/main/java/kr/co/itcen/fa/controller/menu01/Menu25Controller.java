package kr.co.itcen.fa.controller.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu05Service;
import kr.co.itcen.fa.service.menu01.Menu25Service;
import kr.co.itcen.fa.service.menu01.Menu27Service;
import kr.co.itcen.fa.service.menu02.Menu35Service;
import kr.co.itcen.fa.service.menu12.Menu15Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;

/**
 * 
 * @author 황슬기
 * 계좌관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu25Controller.MAINMENU)
public class Menu25Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "25";

	@Autowired
	private Menu05Service menu05Service;
	@Autowired
	private Menu25Service menu25Service;
	@Autowired
	private Menu27Service menu27Service; 
	@Autowired
	private Menu15Service menu15Service;
	@Autowired
	private Menu35Service menu35Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model,
			@RequestParam(value = "page", required=false, defaultValue = "1")int page) {
		
		DataResult<BankAccountVo> dataResult = menu25Service.list(page);
		model.addAttribute("dataResult", dataResult);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// Create
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/create")
	public Map<String, Object> create(@ModelAttribute BankAccountVo bavo,
			@RequestParam(value = "page", required=false, defaultValue = "1")int page,
			@AuthUser UserVo uvo) {
		System.out.println("create");
		System.out.println(bavo.toString());
				
		// User 정보 넣기 -> getLastUpdate가 내가 원하는기능이면 다시 붙이면됨
		bavo.setInsertUserId(uvo.getId());
		bavo.setDepositOld(null);
		
		page = 1;
		Map<String, Object> dataResult =  menu25Service.create(bavo, page);
		
		return dataResult;
	}
	
	// Read
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/read")
	public Map<String, Object> read(@ModelAttribute BankAccountVo bavo) {
		System.out.println("read");
		
		Map<String, Object> dataResult = menu25Service.read(bavo);
		return dataResult;
	}
	
	// Update
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/update")
	public Map<String, Object> update(@ModelAttribute BankAccountVo bavo,
			@RequestParam(value = "page", required=false, defaultValue = "1")int page,
			@AuthUser UserVo uvo) {
		System.out.println("update" );
		
		// User 정보 넣기 -> getLastUpdate가 내가 원하는기능이면 다시 붙이면됨
		bavo.setUpdateUserId(uvo.getId());
		
		System.out.println(bavo.toString());
		
		Map<String, Object> dataResult = menu25Service.update(bavo, page);
		
		menu05Service.updateBankAccount(bavo);
		menu27Service.updateBankAccount(bavo);
		menu15Service.updateBankAccount(bavo);
		menu35Service.updateBankAccount(bavo);
		
		return dataResult;
	}
	
	// Delete
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/delete")
	public Map<String, Object> delete(@ModelAttribute BankAccountVo bavo,
			@RequestParam(value = "page", required=false, defaultValue = "1")int page) {
		System.out.println("delete");
		
		Map<String, Object> dataResult = menu25Service.delete(bavo, page);
		dataResult.put("success", true);
		
		return dataResult;
	}
	
	// PopUp
//	@ResponseBody
//	@RequestMapping("/" + SUBMENU + "/gets")
//	public Map<String, Object> gets(@RequestParam("depositNo") String depositNo) {
//		System.out.println("gets");
//		
//		Map<String, Object> data = menu25Service.gets(depositNo);
//		data.put("success", true);
//		return data;
//	}
	

	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/checkno")
	public Map<String, Object> checkNo(@RequestParam(value="depositNo", required=true, defaultValue="") String depositNo) {
		System.out.println("checkno");
		Map<String, Object> data = menu25Service.existNo(depositNo);
		
		return data;
	}
		
}