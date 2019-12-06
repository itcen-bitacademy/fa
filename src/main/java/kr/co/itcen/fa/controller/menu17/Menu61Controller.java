package kr.co.itcen.fa.controller.menu17;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.service.menu17.Menu20Service;
import kr.co.itcen.fa.service.menu17.Menu61Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
import kr.co.itcen.fa.vo.menu17.Menu17SearchForm;

/**
 * 
 * @author 최웅
 * 결산작업
 */

@Auth
@Controller
@RequestMapping("/" + Menu61Controller.MAINMENU)
public class Menu61Controller {
	
	public static final String MAINMENU = "17";
	public static final String SUBMENU = "61";
	
	@Autowired
	private Menu19Service menu19Service;
	
	@Autowired
	private Menu20Service menu20Service;
	
	@Autowired
	private Menu61Service menu61Service;
	
	
	/**
	 * 결산작업 페이지
	 */
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String settlementStateManagementPage(Model model, Menu17SearchForm menu17SearchForm) {
		List<String> closingYearList = menu20Service.selectClosingYear();
		model.addAttribute("closingYearList", closingYearList);
		
		if (menu17SearchForm.getYear() == null && closingYearList != null && closingYearList.size() > 0) {
			menu17SearchForm.setYear(closingYearList.get(0));
		}
		
		model.addAttribute("year", menu17SearchForm.getYear());

		model.addAttribute("dataResult", menu20Service.selectClosingDateByYear(menu17SearchForm));
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	/**
	 * 결산작업 실행
	 */
	@PostMapping("/" + SUBMENU + "/settlement")
	public String executeSettlement(@SessionAttribute("authUser") UserVo authUser, Menu17SearchForm menu17SearchForm) throws UnsupportedEncodingException {
		String uri = "redirect:/" + MAINMENU + "/" + SUBMENU + "/list";
		
		// 마감일 체크 
		ClosingDateVo closingDateVo = menu19Service.selectClosingDateByNo(menu17SearchForm);
		if (menu19Service.checkClosingDate(authUser, closingDateVo.getStartDate())) {
			// 등록자 설정 - 시산표 및 재무제표용 
			menu17SearchForm.setInsertUserid(authUser.getId());
			// 수저자 설정 - 마감일 업데이트용 
			menu17SearchForm.setUpdateUserid(authUser.getId());
			
			// 결산작업 실행 
			DataResult<Object> dataResult = menu61Service.executeSettlement(menu17SearchForm);
			
			if (!dataResult.isStatus()) {
				uri = uri + "?error=" + URLEncoder.encode(dataResult.getError(), "UTF-8");
			}
		} else {
			// 마감일이 지났을 시 
			uri = uri + "?error=" + URLEncoder.encode("마감일이 지났습니다. 관리자에게 문의하세요.", "UTF-8");
		}
				
		return uri;
	}
}
