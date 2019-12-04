package kr.co.itcen.fa.controller.menu17;

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
		accountManagement.setInsertUserid(authUser.getName());		
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
		model.addAttribute("dataResult", menu59Service.getList(accountManagement, page,3));
		
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	//재무제표 계정관리 저장
	@RequestMapping(value="/" + SUBMENU + "/add", method=RequestMethod.POST)
	public String add(@ModelAttribute AccountManagementVo accountManagement,
					  @RequestParam("selectedAccountStatementType") String type,
					  @RequestParam("selectedAccount") Long accountNo,
					  Model model,
					  @AuthUser UserVo authUser) {
		
		//저장할 값들 셋팅
		accountManagement.setAccountStatementType(type);
		accountManagement.setAccountNo(accountNo);
		accountManagement.setInsertUserid(authUser.getName());
		
		System.out.println(accountManagement);
		
		model.addAttribute("selectedAccountStatementType", type);
		
		if(menu59Service.chechedAccount(accountManagement).size() < 1) {	
			String overlap = "nono";
			model.addAttribute("overlap", overlap);
		
			menu59Service.insert(accountManagement);
		
			//return "redirect:/" + MAINMENU + "/" + SUBMENU;			
		}else {
			String overlap = "overlap";
			model.addAttribute("overlap", overlap);
			
			//return MAINMENU + "/" + SUBMENU + "/add";
		}
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	
	//재무제표 계정관리 수정
	@RequestMapping(value="/" + SUBMENU + "/update", method=RequestMethod.POST)
	public String update(@ModelAttribute AccountManagementVo accountManagement,
						 @RequestParam("selectedAccountStatementType") String type,
						 @RequestParam("selectedAccount") Long accountNo,
						 Model model,
						 @AuthUser UserVo authUser) {

		//수정할 값들 셋팅
		accountManagement.setAccountStatementType(type);
		accountManagement.setAccountNo(accountNo);

		List<AccountManagementVo> list = menu59Service.chechedAccount(accountManagement);
		String overlap = "nono";
		
		if(list.size() >= 1) {
			if(list.get(0).getAccountOrder() != accountManagement.getAccountOrder()) {		
				if(list.get(0).getAccountNo().equals(accountManagement.getAccountNo())) {
					if(menu59Service.chechedAccount3(accountManagement).size() < 1) {

					overlap = "nono";
					model.addAttribute("overlap", overlap);
					
					accountManagement.setUpdateUserid(authUser.getName());
					
					System.out.println(accountManagement);	
					menu59Service.update(accountManagement);
					} else {
						overlap = "overlap";
						model.addAttribute("overlap", overlap);
					}
				}else {				
					if(menu59Service.chechedAccount2(accountManagement).size() < 1) {
						overlap = "nono";
						model.addAttribute("overlap", overlap);
						
						accountManagement.setUpdateUserid(authUser.getName());
						
						System.out.println(accountManagement);	
						menu59Service.update(accountManagement);
					}else {
						overlap = "overlap";
						model.addAttribute("overlap", overlap);
					}
				}
			}else {

				overlap = "overlap";
				model.addAttribute("overlap", overlap);

			}
			
		}else {
			
		overlap = "nullData";
		model.addAttribute("overlap", overlap);
		
		accountManagement.setInsertUserid(authUser.getName());
		
		menu59Service.insert(accountManagement);

		}
		
		model.addAttribute("selectedAccountStatementType", type);
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	
	
	//재무제표 계정관리 삭제
	@RequestMapping(value="/" + SUBMENU + "/delete", method=RequestMethod.POST)
	public String delete(@ModelAttribute AccountManagementVo accountManagement,
						 @RequestParam("selectedAccountStatementType") String type,
						 Model model,
						 @AuthUser UserVo authUser) {
	
	System.out.println(accountManagement);
	menu59Service.delete(accountManagement.getNo());
	
	model.addAttribute("selectedAccountStatementType", type);
	
	return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	

	
}
