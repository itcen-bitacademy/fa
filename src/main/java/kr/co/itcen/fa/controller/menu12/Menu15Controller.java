package kr.co.itcen.fa.controller.menu12;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu25Service;
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
	
	@Autowired
	private Menu25Service menu25Service;
	
	@RequestMapping("/" + SUBMENU)
	public String list(@ModelAttribute CustomerVo customerVo) {
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@RequestMapping("/" + SUBMENU + "/list")
	public String list(@ModelAttribute CustomerVo customerVo, Model model, @RequestParam(value = "noString", required = false) List<String> checkNoList, @RequestParam(value = "no", required = false) String no) {
		System.out.println(checkNoList);
		System.out.println(no);
		if(checkNoList == null) {
			model.addAttribute("customerList", menu15Service.getAllCustomer(no));
			customerVo.setNo("");
		} else {
			model.addAttribute("customerList", menu15Service.getAllCustomer(checkNoList));
		}
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.POST)
	public String add(@ModelAttribute @Valid CustomerVo customerVo, BindingResult result, Model model, @AuthUser UserVo userVo) {
		if(result.hasErrors()) {
			model.addAllAttributes(result.getModel());
			
			return MAINMENU + "/" + SUBMENU + "/list";
		}
		
		customerVo.setInsertUserid(userVo.getId());
		
		menu15Service.addCustomer(customerVo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU + "/list?no=" + customerVo.getNo();
	}
	
	@RequestMapping(value="/" + SUBMENU + "/modify", method=RequestMethod.POST)
	public String update(@ModelAttribute @Valid CustomerVo customerVo, BindingResult result, Model model, @AuthUser UserVo userVo) {
		if(result.hasErrors()) {
			model.addAllAttributes(result.getModel());
			
			return MAINMENU + "/" + SUBMENU + "/list";
		}
		
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
	
	@RequestMapping("/" + SUBMENU + "/delete")
	public String delete(@RequestParam(value = "checkNoArr") List<String> checkNoList, @AuthUser UserVo userVo) {
		System.out.println(checkNoList);
		menu15Service.deleteCustomer(checkNoList, userVo);
		
		String noString = checkNoList.toString().replaceAll(" ", "").replaceAll("\\[", "").replaceAll("\\]", "");
		System.out.println(noString);
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU + "/list?noString="+noString;
	}
	
	// PopUp
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/gets")
	public Map<String, Object> gets(@RequestParam(value = "depositNo", required = true, defaultValue = "") String depositNo) {
		System.out.println("gets");
		
		Map<String, Object> data =  menu25Service.gets(depositNo);
		data.put("success", true);
		return data;
	}
}
