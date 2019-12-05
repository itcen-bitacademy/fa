package kr.co.itcen.fa.controller.menu01;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;


/**
 * 
 * @author 임성주
 * 전표관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu03Controller.MAINMENU)
public class Menu03Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "03";

	@Autowired
	private Menu03Service menu03Service;
	
	// 전표관리 페이지
	@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String view(@RequestParam(defaultValue = "1") int page, Model model) {
		// 페이징
		DataResult<VoucherVo> dataResult = menu03Service.selectAllVoucherCount(page);
		
		model.addAttribute("dataResult", dataResult);
		
		
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 전표 작성 & 리스트 반환
	@RequestMapping(value= "/" + SUBMENU + "/add", method=RequestMethod.POST)
	public String categoryWrite(@ModelAttribute VoucherVo voucherVo, @AuthUser UserVo userVo, @RequestParam(defaultValue = "1") int page
			, Model model) {
		String systemCode = "A000";
		int count = 0;
		count += 1;
		if(count > 9) {
			systemCode = "A00";
		}
		if(count > 99) {
			systemCode = "A0";
		}
		if(count > 999) {
			systemCode = "A";
		}
		voucherVo.setSystemCode(systemCode + count);
		System.out.println("c : " + voucherVo.getSystemCode());
		
		menu03Service.createVoucher(voucherVo, userVo);
		
		// 카테고리 작성, 리스트
		DataResult<VoucherVo> dataResult = menu03Service.selectAllVoucherCount(page);
		System.out.println("d : " + dataResult.getDatas());
		model.addAttribute("dataResult", dataResult);
		return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 전표 삭제 1팀
	@RequestMapping(value = "/" + SUBMENU + "/delete", method=RequestMethod.POST)
	public String delete(@ModelAttribute VoucherVo voucherVo, @AuthUser UserVo userVo) {
		System.out.println("222222222 : " + voucherVo.getNo());
		System.out.println("44444444 : " + voucherVo.getInsertTeam());
		System.out.println("33333333 : " + userVo.getTeamName());
		if(!voucherVo.getInsertTeam().equals(userVo.getTeamName())) {
			return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/list";
		}
		System.out.println("ㅇㅇㅇㅇㅇ");
		menu03Service.deleteVoucher(voucherVo);
		
		return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 전표 수정 1팀
	@RequestMapping(value = "/" + SUBMENU + "/update", method=RequestMethod.POST)
	public String update(@ModelAttribute VoucherVo voucherVo, @AuthUser UserVo userVo) {
		voucherVo.setUpdateUserid(userVo.getId());
		if(!voucherVo.getInsertTeam().equals(userVo.getTeamName())) {
			return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/list";
		}
		menu03Service.updateVoucher(voucherVo);
		
		return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/list";
	}
	
}