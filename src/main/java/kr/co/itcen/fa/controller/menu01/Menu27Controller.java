package kr.co.itcen.fa.controller.menu01;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String test(Model model) {
		List<CustomerVo> list = menu27Service.list();
		model.addAttribute("list", list);
		//menu27Service.test();
		return MAINMENU + "/" + SUBMENU + "/list";
	}	

	// Create
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/create")
	public Map<String, Object> create(@ModelAttribute CustomerVo customervo,
			@AuthUser UserVo authUser) {
		System.out.println("create");
		customervo.setInsertUserid(authUser.getName()); //insertUserid
		Map<String, Object> result = menu27Service.create(customervo);
		return result;
	}
	
	// Read
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/read")
	public Map<String, Object> read(@ModelAttribute CustomerVo customerVo) {
		Map<String, Object> result = menu27Service.read(customerVo);
		return result;
	}
	
	// Update
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/update")
	public Map<String, Object> update(@ModelAttribute CustomerVo customerVo,
			@AuthUser UserVo authUser) {
		System.out.println("update");
		customerVo.setUpdateUserid(authUser.getName()); //updateUserid
		Map<String, Object> result = menu27Service.update(customerVo);
		return result;
	}
	
	// Delete
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/delete")
	public Map<String, Object> delete(@ModelAttribute CustomerVo customerVo) {
		System.out.println("delete");
		Map<String, Object> result = menu27Service.delete(customerVo);
		result.put("success", true);
		return result;
	}

}
