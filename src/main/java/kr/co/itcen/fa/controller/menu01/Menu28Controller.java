package kr.co.itcen.fa.controller.menu01;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu28Service;
import kr.co.itcen.fa.vo.menu01.CustomerVo;

/**
 * 
 * @author 이종윤
 * 거래처 현황 조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu28Controller.MAINMENU)
public class Menu28Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "28";

	@Autowired
	private Menu28Service menu28Service;

	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model) {
		List<CustomerVo> list = menu28Service.list();
		model.addAttribute("list",list);
		menu28Service.test();
		return MAINMENU + "/" + SUBMENU + "/list";
	}

//	@RequestMapping("/" + SUBMENU + "/search" )
//	public ModelAndView list(
//			@RequestParam(defaultValue = "Assets") String customerDiv, //기본 검색 옵션값이 All
//			@RequestParam(defaultValue = "") String customerNo,
//			@RequestParam(defaultValue = "N") String deleteFlag
//			)throws Exception {
//		List<CustomerVo> list = menu28Service.listAll(customerDiv, customerNo, deleteFlag);
//		ModelAndView mav = new ModelAndView();
//		Map<String,Object> map = new HashMap<>();
//		
//		map.put("list", list);
//		map.put("customerDiv", customerDiv);
//		map.put("customerNo", customerNo);
//		map.put("deleteFlag", deleteFlag);
//		
//		mav.setViewName("");//자료를 넘길 뷰
//		return mav;
//	}
	@RequestMapping(value = "/list", method = RequestMethod.POST )
	public String searchList(
		@RequestParam(value = "customerDiv", required = false, defaultValue = "All") String customerDiv,
		@RequestParam(value = "datepicker1", required = false, defaultValue = "") String datepicker1,
		@RequestParam(value = "datepicker2", required = false, defaultValue = "") String datepicker2,
		@RequestParam(value = "customerNo", required = false, defaultValue = "") String customerNo,
		@RequestParam(value = "deleteFlag", required = false, defaultValue = "N") String deleteFlag,
		Model model
			) {
		Map<String, Object> map = menu28Service.searchList(customerDiv, datepicker1, datepicker2, customerNo, deleteFlag);
		model.addAllAttributes(map);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	


}
