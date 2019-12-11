package kr.co.itcen.fa.controller.menu17;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu17.Menu59Service;
import kr.co.itcen.fa.vo.menu17.AccountManagementVo;
import kr.co.itcen.fa.vo.UserVo;

/**
 * 
 * @author 이성훈
 * 재무제표계정관리
 */

@Auth
@Controller
@RequestMapping("/" + Menu59Controller.MAINMENU)
public class Menu59Controller {
	
	public static final String MAINMENU = "17";
	public static final String SUBMENU = "59";
	
	@Autowired
	private Menu59Service menu59Service;
	
	
	//재무제표 계정관리 조회
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(@ModelAttribute AccountManagementVo accountManagement,
					   @RequestParam(value = "accountUsedyear", defaultValue = "2019") String accountUsedyear,
					   @RequestParam(value = "accountOrder", defaultValue = "") Long accountOrder,
					   @RequestParam(value = "selectedAccountStatementType", defaultValue = "B") String type,
					   @RequestParam(value = "selectedAccount", defaultValue = "") Long accountNo,
					   @RequestParam(defaultValue = "1") int page,
					   Model model,
					   @AuthUser UserVo authUser) {

		//조회할 값들 셋팅
		accountManagement.setAccountUsedyear(accountUsedyear);
		accountManagement.setAccountStatementType(type);
		accountManagement.setInsertUserid(authUser.getId());		
		
		if(accountNo != null) {
			accountManagement.setAccountNo(accountNo);
		}

		System.out.println(accountManagement);

		//input부분 셋팅
		model.addAttribute("accountUsedyear", accountUsedyear);
		model.addAttribute("accountOrder", accountOrder);
		model.addAttribute("selectedAccountStatementType", type);
		model.addAttribute("selectedAccount", accountNo);
		model.addAttribute("accountList", menu59Service.getAllAccountList());
		
		//테이블부분 셋팅
		model.addAttribute("dataResult", menu59Service.getList(accountManagement, page));
		
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	//재무제표 계정관리 저장
	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.POST)
	public String add(@ModelAttribute AccountManagementVo accountManagement,
					  @RequestParam("selectedAccountStatementType") String type,
					  @RequestParam("selectedAccount") Long accountNo,
					  @RequestParam(value = "accountUsedyear", defaultValue = "2019") String accountUsedyear,
					  Model model,
					  @AuthUser UserVo authUser) throws UnsupportedEncodingException {
		
		DataResult<AccountManagementVo> dataResult = null;
		
		//저장할 값들 셋팅
		accountManagement.setAccountStatementType(type);
		accountManagement.setAccountNo(accountNo);
		accountManagement.setInsertUserid(authUser.getId());
			
		dataResult = menu59Service.add(accountManagement);
		
		String uri = "redirect:/" + MAINMENU + "/" + SUBMENU;
		
		if (!dataResult.isStatus()) {
			uri = uri + "?error=" + URLEncoder.encode(dataResult.getError(), "UTF-8");
		}
		
		model.addAttribute("selectedAccountStatementType", type);
		model.addAttribute("accountUsedyear", accountUsedyear);
		
		return uri;
	}
	
	
	//재무제표 계정관리 수정
	@RequestMapping(value="/" + SUBMENU + "/update", method=RequestMethod.POST)
	public String update(@ModelAttribute AccountManagementVo accountManagement,
						 @RequestParam("selectedAccountStatementType") String type,
						 @RequestParam("selectedAccount") Long accountNo,
						 Model model,
						 @AuthUser UserVo authUser) throws UnsupportedEncodingException {
		
		DataResult<AccountManagementVo> dataResult = null;
		
		//수정할 값들 셋팅
		accountManagement.setAccountStatementType(type);
		accountManagement.setAccountNo(accountNo);
		accountManagement.setInsertUserid(authUser.getId());
		accountManagement.setUpdateUserid(authUser.getId());
		
		dataResult = menu59Service.update(accountManagement);
		
		String uri = "redirect:/" + MAINMENU + "/" + SUBMENU;
		
		if (!dataResult.isStatus()) {
			uri = uri + "?error=" + URLEncoder.encode(dataResult.getError(), "UTF-8");
		}
		
		model.addAttribute("selectedAccountStatementType", type);
		
		return uri;
	}
	
	
	
	//재무제표 계정관리 삭제
	@RequestMapping(value="/" + SUBMENU + "/delete", method=RequestMethod.POST)
	public String delete(@ModelAttribute AccountManagementVo accountManagement,
						 @RequestParam("selectedAccountStatementType") String type,
						 Model model,
						 @AuthUser UserVo authUser) {
	
	String result = "nono";
	if(accountManagement.getNo() == null || accountManagement.getAccountUsedyear() == null || accountManagement.getAccountOrder() == null) {
		result = "NPE2";
		model.addAttribute("result", result);
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
		
	System.out.println(accountManagement);
	menu59Service.delete(accountManagement.getNo());
	
	model.addAttribute("selectedAccountStatementType", type);
	
	return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	

	
}
