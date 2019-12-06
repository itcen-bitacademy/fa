package kr.co.itcen.fa.controller.menu01;

import java.util.Map;

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
import kr.co.itcen.fa.service.menu01.Menu27Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.CustomerVo;

/**
 * 
 * @author 이종윤 
 * 거래처 관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu27Controller.MAINMENU)
public class Menu27Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "27";

	@Autowired
	private Menu27Service menu27Service;

	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model,
			@RequestParam(value = "page", required=false, defaultValue = "1")int page) {
		DataResult<CustomerVo> dataResult = menu27Service.list(page);
		model.addAttribute("dataResult", dataResult);
		return MAINMENU + "/" + SUBMENU + "/list";
	}	

	// Create
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/create")
	public Map<String, Object> create(@ModelAttribute CustomerVo customerVo,
			@RequestParam(value = "page", required=false, defaultValue = "1")int page,
			@AuthUser UserVo authUser) {
		System.out.println("create");
		System.out.println(customerVo.toString());
				
		// User 정보 넣기 -> getLastUpdate가 내가 원하는기능이면 다시 붙이면됨
		customerVo.setInsertUserid(authUser.getName());
		
		page = 1;
		Map<String, Object> dataResult =  menu27Service.create(customerVo, page);
		
		return dataResult;
	}
	
	// Read
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/read")
	public Map<String, Object> read(@ModelAttribute CustomerVo customerVo) {
		System.out.println("read");
		
		Map<String, Object> dataResult = menu27Service.read(customerVo);
		return dataResult;
	}
	
	// Update
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/update")
	public Map<String, Object> update(@ModelAttribute CustomerVo customerVo,
			@RequestParam(value = "page", required=false, defaultValue = "1")int page,
			@AuthUser UserVo authUser) {
		System.out.println("update : " + page);
		
		customerVo.setUpdateUserid(authUser.getName());
		
		System.out.println(customerVo.toString());
		
		Map<String, Object> dataResult = menu27Service.update(customerVo, page);
		return dataResult;
	}
	
	// Delete
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/delete")
	public Map<String, Object> delete(@ModelAttribute CustomerVo customerVo,
			@RequestParam(value = "page", required=false, defaultValue = "1")int page) {
		System.out.println("delete");
		page = 1;
		Map<String, Object> dataResult = menu27Service.delete(customerVo, page);
		dataResult.put("success", true);
		
		return dataResult;
	}

}
