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
		menu27Service.test();
		return MAINMENU + "/" + SUBMENU + "/list";
	}	

	// Create
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/create")
	public Map<String, Object> create(@ModelAttribute CustomerVo customervo,
			@AuthUser UserVo authUser) {
		System.out.println("create");
		// User 정보 넣기 -> getLastUpdate가 내가 원하는기능이면 다시 붙이면됨
		customervo.setInsertUserid(authUser.getName());
		
		Map<String, Object> result = menu27Service.create(customervo);
		result.put("success", true);
		
		return result;
	}
	
	// Read
	@RequestMapping("/" + SUBMENU + "/read")
	public String read(@ModelAttribute CustomerVo customerVo) {
		System.out.println("read");
		menu27Service.test();
		return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// U
	@RequestMapping("/" + SUBMENU + "/update")
	public String update(@ModelAttribute CustomerVo CustomerVo,
			@AuthUser UserVo authUser) {
		System.out.println("update");
		
		// User 정보 넣기 -> getLastUpdate가 내가 원하는기능이면 다시 붙이면됨
		CustomerVo.setUpdateUserid(authUser.getName());
				
		menu27Service.update(CustomerVo);
		return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// D
	@RequestMapping("/" + SUBMENU + "/delete")
	public String delete(@ModelAttribute CustomerVo customerVo) {
		System.out.println("delete");
		
		menu27Service.delete(customerVo);
		return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/list";
	}
	

}
