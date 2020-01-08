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
import kr.co.itcen.fa.service.menu01.Menu29Service;
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
@RequestMapping("/" + Menu29Controller.MAINMENU)
public class Menu29Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "29";

	@Autowired
	private Menu29Service menu29Service;
	
	@NoAuth
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/search"})
	public String search(Model model,
			@RequestParam(value = "page", required=false, defaultValue = "1")int page,
			@ModelAttribute ReceiptVo revo, @AuthUser UserVo authUser
			) {
		// 초기 페이지 이동
		if(revo.getRegDate() == null || revo.getAccountNo() ==null 
				|| revo.getRegDate().equals("") ||  revo.getAccountNo().equals("")
				) {
			
			return MAINMENU + "/" + SUBMENU + "/list";
		}
		
		DataResult<ReceiptVo> dataResult = menu29Service.search(page,revo, authUser);
		model.addAttribute("dataResult", dataResult);
		
		// 전월 이월
		PreviousVo pVo = menu29Service.previous(revo);
		if(pVo!=null) {
			model.addAttribute("pVo", pVo);
		}
		
		// 차변
		ReceiptVo dsum = menu29Service.dsum(revo);
		if(dsum!=null) {
			model.addAttribute("dsum", dsum);
		}
		
		// 대변
		ReceiptVo csum = menu29Service.csum(revo);
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