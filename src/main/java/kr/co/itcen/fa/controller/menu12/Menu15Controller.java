package kr.co.itcen.fa.controller.menu12;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu12.Menu15Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu12.CustomerVo;

/**
 * 
 * @author 양홍석
 * 매출거래처관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu15Controller.MAINMENU)
public class Menu15Controller {
	public static final String MAINMENU = "12";
	public static final String SUBMENU = "15";

	@Autowired
	private Menu15Service menu15Service;
	
	@RequestMapping("/" + SUBMENU)
	public String list(Model model) {
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@RequestMapping("/" + SUBMENU + "/list")
	public String list(Model model, @RequestParam(value = "no", required = false) String no) {
		model.addAttribute("customerList", menu15Service.getAllCustomer(no));
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.POST)
	public String add(CustomerVo customerVo, HttpSession session) {
		UserVo userVo = (UserVo)session.getAttribute("authUser");
		customerVo.setInsertUserid(userVo.getId());
		menu15Service.addCustomer(customerVo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU + "/list?no=" + customerVo.getNo();
	}
	
	@RequestMapping(value="/" + SUBMENU + "/modify", method=RequestMethod.POST)
	public String update(CustomerVo customerVo, @AuthUser UserVo userVo) {
		customerVo.setUpdateUserid(userVo.getId());
		System.out.println(customerVo);
		menu15Service.modifyCustomer(customerVo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU + "/list?no=" + customerVo.getNo();
	}
	
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/checkNo")
	public JSONResult checkNo(@RequestParam(value = "no", required = true, defaultValue = "") String no) {
		Boolean exist = menu15Service.existCustomer(no);
		
		return JSONResult.success(exist);
	}
	
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/delete")
	public JSONResult delete(@RequestParam(value = "checkNoArr[]") List<String> checkNoList) {
		Boolean exist = menu15Service.deleteCustomer(checkNoList);
		return JSONResult.success(exist);
	}
}
