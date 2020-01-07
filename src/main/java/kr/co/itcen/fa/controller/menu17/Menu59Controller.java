package kr.co.itcen.fa.controller.menu17;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.security.NoAuth;
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
	//public String result = "";
	
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

		//input부분 셋팅
		model.addAttribute("accountUsedyear", accountUsedyear);
		model.addAttribute("accountOrder", accountOrder);
		model.addAttribute("selectedAccountStatementType", type);
		model.addAttribute("selectedAccount", accountNo);
		model.addAttribute("accountList", menu59Service.getAllAccountList());
		
		DataResult<AccountManagementVo> dataResult = menu59Service.getList(accountManagement, page);

		//테이블부분 셋팅
		model.addAttribute("dataResult", dataResult);
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	
	/** 전 버전 저장, 수정 버튼에 대한 이벤트 메서드
	
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
	
	 */
	
	//재무제표 계정관리 삭제
	@RequestMapping(value="/" + SUBMENU + "/delete", method=RequestMethod.POST)
	public String delete(@ModelAttribute AccountManagementVo accountManagement,
						 @RequestParam("selectedAccountStatementType") String type,
						 @RequestParam("selectedAccount") Long accountNo,
						 @RequestParam(value = "accountUsedyear", defaultValue = "2019") String accountUsedyear,
						 Model model,
						 @AuthUser UserVo authUser) throws UnsupportedEncodingException {
	
	DataResult<AccountManagementVo> dataResult = null;
	String uri = "redirect:/" + MAINMENU + "/" + SUBMENU;
	
	accountManagement.setAccountNo(accountNo);
	accountManagement.setAccountStatementType(type);
	accountManagement.setAccountUsedyear(accountUsedyear);
	
	System.out.println(accountManagement);
	
	dataResult = menu59Service.delete(accountManagement);
	
	model.addAttribute("selectedAccountStatementType", type);
	model.addAttribute("accountUsedyear", accountUsedyear);
	
	if (!dataResult.isStatus()) {
		uri = uri + "?error=" + URLEncoder.encode(dataResult.getError(), "UTF-8");
	}
	
	return uri;
	}

	
	//저장, 수정
	@ResponseBody
	@RequestMapping(value="/" + SUBMENU + "/addorupdate", method=RequestMethod.POST)
	public DataResult<AccountManagementVo> test(@RequestParam(value = "changedRows", defaultValue = "") List<String> changedRows,
					   Model model,
					   @AuthUser UserVo authUser) throws UnsupportedEncodingException {
		
		DataResult<AccountManagementVo> dataResult = new DataResult<>();
		List<AccountManagementVo> list = new ArrayList<AccountManagementVo>();
		
		String no     = null;
		String order  = null;
		String acount = null;
		String year   = null;
		String type   = null;
		
		if(changedRows.size() > 0) {			
			year   = changedRows.get(0).split("/")[3];
			type   = changedRows.get(0).split("/")[4];
			
			model.addAttribute("selectedAccountStatementType", type);
			model.addAttribute("accountUsedyear", year);
			
			for(int i = 0; i < changedRows.size(); i++) {
				AccountManagementVo vo = new AccountManagementVo();
					
				no     = changedRows.get(i).split("/")[0];
				order  = changedRows.get(i).split("/")[1];
				acount = changedRows.get(i).split("/")[2];
				
				vo.setNo(Long.parseLong(no));
				vo.setAccountOrder(Long.parseLong(order));
				vo.setAccountNo(Long.parseLong(acount));
				vo.setAccountUsedyear(year);
				vo.setAccountStatementType(type);
				vo.setInsertUserid(authUser.getId());
				vo.setUpdateUserid(authUser.getId());
				
				list.add(vo);
			}
			
			dataResult = menu59Service.testUpdate(list);
		}
		
		return dataResult;
	}

}
