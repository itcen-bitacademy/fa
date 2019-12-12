package kr.co.itcen.fa.controller.menu01;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu01.Menu04Service;
import kr.co.itcen.fa.service.menu17.Menu59Service;
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
	private Menu59Service menu59Service;

	// 전표 조회하기
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String VoucherMain(@RequestParam(defaultValue ="1") int page, Model model) {
		// 조회 / 페이징
		DataResult<VoucherVo> dataResult = menu03Service.selectAllVoucherCount(page);
		
		// 계정조회
		model.addAttribute("accountList", menu59Service.getAllAccountList());
		
		// 데이블 셋팅
		model.addAttribute("dataResult", dataResult);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 전표 관리페이지 조회
	@RequestMapping(value= "/" + SUBMENU + "/read", method=RequestMethod.POST)
	public String read(@ModelAttribute VoucherVo voucherVo, @RequestParam(defaultValue = "1") int page , Model model) {
		System.out.println("regDate : " + voucherVo.getRegDate());
		System.out.println("amount : " + voucherVo.getAmount());
		System.out.println("custoemrNo : " + voucherVo.getCustomerNo());
		// 전표 검색
		DataResult<VoucherVo> dataResult = menu03Service.selectVoucherCount(voucherVo, page);
		
		// 계정조회
		model.addAttribute("accountList", menu59Service.getAllAccountList());
		
		// 테이블 셋팅
		model.addAttribute("dataResult", dataResult);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}