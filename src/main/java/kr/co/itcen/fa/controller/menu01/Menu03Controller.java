package kr.co.itcen.fa.controller.menu01;


import java.text.ParseException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.service.menu17.Menu59Service;
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
	
	@Autowired
	private Menu19Service menu19Service;
	
	@Autowired
	private Menu59Service menu59Service;
	
	// 전표관리 페이지
	@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String view(@RequestParam(defaultValue = "1") int page, Model model) {
		
		// 조회 / 페이징
		DataResult<VoucherVo> dataResult = menu03Service.selectAllVoucherCount(page);
		
		// 계정조회
		model.addAttribute("accountList", menu59Service.getAllAccountList());
		
		// 데이블 셋팅
		model.addAttribute("dataResult", dataResult);
		
		
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 전표 작성 & 리스트 반환
	@RequestMapping(value= "/" + SUBMENU + "/add", method=RequestMethod.POST)
	public String categoryWrite(@ModelAttribute VoucherVo voucherVo, @AuthUser UserVo userVo, @RequestParam(defaultValue = "1") int page
			, Model model) throws ParseException {
		// 마감 여부 체크
		//if(menu19Service.checkClosingDate(userVo, voucherVo.getRegDate())) {
		menu03Service.createVoucher(voucherVo, userVo);
		//}
		// 전표등록, 리스트
		DataResult<VoucherVo> dataResult = menu03Service.selectAllVoucherCount(page);
		System.out.println("d : " + dataResult.getDatas());
		model.addAttribute("dataResult", dataResult);
		return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 전표 삭제 1팀
	@RequestMapping(value = "/" + SUBMENU + "/delete", method=RequestMethod.POST)
	public String delete(@ModelAttribute VoucherVo voucherVo, @AuthUser UserVo userVo) {
		if(!voucherVo.getInsertTeam().equals(userVo.getTeamName())) {
			return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/list";
		}
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
	
	// 
	
}