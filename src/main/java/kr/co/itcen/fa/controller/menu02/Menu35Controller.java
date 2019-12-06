package kr.co.itcen.fa.controller.menu02;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu25Service;
import kr.co.itcen.fa.service.menu02.Menu35Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu02.CustomerVo;

/**
 * 
 * @author 이지은
 * 매입거래처관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu35Controller.MAINMENU)
public class Menu35Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "35";
	
	@Autowired
	private Menu35Service menu35Service;
	@Autowired
	private Menu25Service menu25Service; 

	// 걍 페이지 들어가자마자 조회
//	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
//	public String list(Model model) {
//		List<CustomerVo> customerVo = menu35Service.list();
//		model.addAttribute("customerVo", customerVo);
//		return MAINMENU + "/" + SUBMENU + "/list";
//	}
	
	@RequestMapping(value = "/" + SUBMENU + "/insert", method = RequestMethod.POST)
	public String insert(@ModelAttribute CustomerVo vo, HttpSession session) {
		UserVo sessionVo = (UserVo) session.getAttribute("authUser");
		String userNo = sessionVo.getId();
		vo.setInsertUserid(userNo);
		
		menu35Service.insert(vo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@RequestMapping(value = "/" + SUBMENU + "/update", method = RequestMethod.POST)
	public String update(@ModelAttribute CustomerVo vo, HttpSession session) {
		UserVo sessionVo = (UserVo) session.getAttribute("authUser");
		String userNo = sessionVo.getId();
		vo.setUpdateUserid(userNo);
		
		menu35Service.update(vo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/" + SUBMENU + "/delete", method = RequestMethod.POST)
	public String delete(@RequestParam(value="checkNoArr[]") List<String> checkNoArr) {
		System.out.println(checkNoArr);
		menu35Service.delete(checkNoArr);
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 사업자번호로 조회버튼으로 조회
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(@RequestParam(value="no", required=false, defaultValue="") String no, Model model) {
		List<CustomerVo> customerVo = menu35Service.search(no);
		model.addAttribute("customerVo", customerVo);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 사업자번호 중복체크
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/checkNo")
	public JSONResult checkNo(@RequestParam(value = "no", required = true, defaultValue = "") String no) {
		Boolean exist = menu35Service.existCustomer(no);
		
		System.out.println(exist);
		return JSONResult.success(exist);
	}
	
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/gets")
	public Map<String, Object> gets(@RequestParam("depositNo") String depositNo) {
		System.out.println("gets");
		
		Map<String, Object> data = menu25Service.gets(depositNo);
		data.put("success", true);
		return data;
	}
}
