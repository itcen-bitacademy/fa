package kr.co.itcen.fa.controller.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu25Service;
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
	private Menu25Service menu25Service;
	
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
			@AuthUser UserVo uvo) {
		System.out.println("create");
		System.out.println(bavo.toString());
				
		// User 정보 넣기 -> getLastUpdate가 내가 원하는기능이면 다시 붙이면됨
		bavo.setInsertUserId(uvo.getName());
		bavo.setDepositOld(null);
		
		Map<String, Object> result = menu25Service.create(bavo);
		
		return result;
	}
	
	// Read
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/read")
	public String read(@ModelAttribute BankAccountVo bavo	) {
		System.out.println("read");
		menu25Service.test();
		return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// Update
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/update")
	public Map<String, Object> update(@ModelAttribute BankAccountVo bavo,
			@RequestParam(value = "page", required=false, defaultValue = "1")int page,
			@AuthUser UserVo uvo) {
		System.out.println(page);
		
		// User 정보 넣기 -> getLastUpdate가 내가 원하는기능이면 다시 붙이면됨
		bavo.setUpdateUserId(uvo.getName());
		
		System.out.println(bavo.toString());
		
		Map<String, Object> dataResult = menu25Service.update(bavo, page);
		return dataResult;
	}
	
	// Delete
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/delete")
	public Map<String, Object> delete(@ModelAttribute BankAccountVo bavo) {
		System.out.println("delete");
		
		Map<String, Object> result = menu25Service.delete(bavo);
		result.put("success", true);
		return result;
	}
	
	// PopUp
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/gets")
	public Map<String, Object> gets(@RequestParam("depositNo") String depositNo) {
		System.out.println("gets");
		System.out.println(depositNo.toString());
		
		Map<String, Object> result = menu25Service.gets(depositNo);
		result.put("success", true);
		return result;
	}
		
}