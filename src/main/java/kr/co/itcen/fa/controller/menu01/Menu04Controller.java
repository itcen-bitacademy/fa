package kr.co.itcen.fa.controller.menu01;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu01.Menu04Service;
import kr.co.itcen.fa.vo.menu01.VoucherVo;


/**
 * 
 * @author 임성주
 * 전표현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu04Controller.MAINMENU)
public class Menu04Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "04";
	
	@Autowired
	private Menu03Service menu03Service;
	
	@Autowired
	private Menu04Service menu04Service;

	// 전표 조회하기
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String VoucherMain(@RequestParam(defaultValue ="1") int page, Model model) {
		// 페이징
		model.addAttribute("dataResult", menu03Service.selectAllVoucherCount(page));
		
		// 전표 조회
		List<VoucherVo> voucherVo = menu04Service.viewVoucher();
		
		model.addAttribute("voucherVo", voucherVo);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}