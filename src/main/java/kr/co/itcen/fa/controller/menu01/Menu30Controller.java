package kr.co.itcen.fa.controller.menu01;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.security.NoAuth;
import kr.co.itcen.fa.service.menu01.Menu30Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.PreviousVo;
import kr.co.itcen.fa.vo.menu01.ReceiptVo;


/**
 * 
 * @author 김승곤 황슬기
 * 계정 거래처 명세서 조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu30Controller.MAINMENU)
public class Menu30Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "30";

	@Autowired
	private Menu30Service menu30Service;
	
	@NoAuth
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/search"})
	public String search(Model model,
			@RequestParam(value = "page", required=false, defaultValue = "1")int page,
			@ModelAttribute ReceiptVo revo, @AuthUser UserVo authUser
			) {
		// 초기 페이지 이동
		if(revo.getRegDate() == null || revo.getCustomerNo() == null || revo.getAccountNo() ==null 
				|| revo.getRegDate().equals("") || revo.getCustomerNo().equals("") || revo.getAccountNo().equals("")
				) {
			return MAINMENU + "/" + SUBMENU + "/list";
		}
		
		DataResult<ReceiptVo> dataResult = menu30Service.search(page,revo, authUser);
		model.addAttribute("dataResult", dataResult);
		
		PreviousVo pVo = menu30Service.previous(revo);
		if(pVo!=null) {
			model.addAttribute("pVo", pVo);
		}
		
		ReceiptVo dsum = menu30Service.dsum(revo);
		if(dsum!=null) {
			model.addAttribute("dsum", dsum);
		}
		
		ReceiptVo csum = menu30Service.csum(revo);
		if(csum!=null) {
			model.addAttribute("csum", csum);
		}
		
		Long cumulative =0L;
		
		if(pVo!=null) {
			if(pVo.getAmountFlag()=="d") {
				cumulative += pVo.getAmount();
			}else {
				cumulative -= pVo.getAmount();
			}
		}
		
		if(dsum!=null) {
			cumulative += dsum.getAmount();
		}
		if(csum!=null) {
			cumulative -=csum.getAmount();
		}
		
		if(pVo!=null) {
			model.addAttribute("cumulative", cumulative);
		}
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}