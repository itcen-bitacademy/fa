package kr.co.itcen.fa.controller.menu01;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import kr.co.itcen.fa.service.menu01.Menu04Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
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
	private Menu04Service menu04Service;
	
	// 전표관리 페이지
	@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String view(@RequestParam(defaultValue = "1") int page, Model model) {
		// 페이징
		DataResult<VoucherVo> dataResult = menu03Service.selectAllVoucherCount(page);
		
		model.addAttribute("dataResult", dataResult);
		
		
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 전표 작성 & 리스트 반환
	@ResponseBody
	@RequestMapping(value= "/" + SUBMENU + "/add", method=RequestMethod.POST)
	public Map<String, Object> categoryWrite(@ModelAttribute VoucherVo voucherVo, @AuthUser UserVo userVo) {
		
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
		
		// 카테고리 작성, 리스트
		Map<String, Object> voucherList = menu03Service.createVoucher(voucherVo, userVo);
		return voucherList;
	}
	
	
	
	
}