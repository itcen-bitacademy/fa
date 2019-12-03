package kr.co.itcen.fa.controller.menu01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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

	// C	
	@RequestMapping("/" + SUBMENU + "/insert" )//({"/" + SUBMENU, "/" + SUBMENU + "/insert" })
	public String insert(@ModelAttribute CustomerVo customerVo, @AuthUser UserVo authUser) {
		customerVo.setInsertUserid(authUser.getId());
		System.out.println(authUser.getId());//입력자 id
		menu27Service.insert(customerVo);
		System.out.println("input");
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// R	
//	@RequestMapping("/" + SUBMENU + "/read" )
//	public String read(Model model, String no) {
//		model.addAttribute("customerList", menu27Service.list(no));
//		System.out.println(no);
//		return MAINMENU + "/" + SUBMENU + "/list";
//	}
	
	// U
	@RequestMapping("/" + SUBMENU + "/update" )
	public String update(@ModelAttribute CustomerVo customerVo, @AuthUser UserVo authUSer) {
		customerVo.setUpdateUserid(authUSer.getId());//수정자 id
		menu27Service.update(customerVo);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// D
	@RequestMapping("/" + SUBMENU + "/delete" )
	public String delete(@ModelAttribute CustomerVo customerVo) {
		menu27Service.delete(customerVo);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	

}
