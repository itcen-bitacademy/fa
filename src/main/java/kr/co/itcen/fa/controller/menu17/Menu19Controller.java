package kr.co.itcen.fa.controller.menu17;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;


/**
 * 
 * @author 김재원
 * 마감일자관리
 */

@Auth
@Controller
@RequestMapping("/" + Menu19Controller.MAINMENU)
public class Menu19Controller {

	public static final String MAINMENU = "17";
	public static final String SUBMENU = "19";
	
	@Autowired
	private Menu19Service menu19Service;
	
	/**
	 * 마감일자관리 페이지
	 */
	@RequestMapping({"", "/" + SUBMENU + "/list", "/" + SUBMENU })
	public String closingDateListPage(Model model, @RequestParam(defaultValue = "1") int page) {
		model.addAttribute("dataResult", menu19Service.selectAllClosingDate(page));

		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	/**
	 * 마감일자 신규 등록
	 */
	@PostMapping("/" + SUBMENU + "/add")
	public String addClosingDate(ClosingDateVo closingDate, HttpSession session) throws UnsupportedEncodingException {
		UserVo userVo = (UserVo) session.getAttribute("authUser");
		
		closingDate.setInsertUserid(userVo.getId());
		
		DataResult<Object> dataResult = menu19Service.insertClosingDate(closingDate);
		
		String uri = "redirect:/" + MAINMENU + "/" + SUBMENU;
		
		if (!dataResult.isStatus()) {
			uri = uri + "?error=" + URLEncoder.encode(dataResult.getError(), "UTF-8");
		}
		
		return uri;
	}
	
	
	/**
	 * 마감일 수정(미결산 마감일 및 가장 최근의 마감일만 수정가능)
	 */
	@PostMapping("/" + SUBMENU + "/update")
	public String updateClosingDate(ClosingDateVo closingDate, HttpSession session) throws UnsupportedEncodingException {
		UserVo userVo = (UserVo) session.getAttribute("authUser");
		
		closingDate.setUpdateUserid(userVo.getId());
		
		DataResult<Object> dataResult = menu19Service.updateClosingDate(closingDate);
		
		String uri = "redirect:/" + MAINMENU + "/" + SUBMENU;
		
		if (!dataResult.isStatus()) {
			uri = uri + "?error=" + URLEncoder.encode(dataResult.getError(), "UTF-8");
		}
		
		return uri;
	}
	
	
	/**
	 * 마감일 삭제(미결산 마감일 및 가장 최근의 마감일만 삭제가능)
	 * @throws UnsupportedEncodingException 
	 */
	@PostMapping("/" + SUBMENU + "/delete")
	public String deleteClosingDate(ClosingDateVo closingDate, HttpSession session) throws UnsupportedEncodingException {
		UserVo userVo = (UserVo) session.getAttribute("authUser");
		
		closingDate.setUpdateUserid(userVo.getId());
		
		DataResult<Object> dataResult = menu19Service.deleteClosingDate(closingDate);
		
		String uri = "redirect:/" + MAINMENU + "/" + SUBMENU;
		
		if (!dataResult.isStatus()) {
			uri = uri + "?error=" + URLEncoder.encode(dataResult.getError(), "UTF-8");
		}
		
		return uri;
	}
	
	
	/**
	 * 해당 마감일의 수정, 삭제 가능여부 조회 
	 */
	@PostMapping("/" + SUBMENU + "/api/changable")
	@ResponseBody
	public DataResult<ClosingDateVo> checkChangable(ClosingDateVo closingDateVo) {
		return menu19Service.isChangable(closingDateVo);
	}
	
}
