package kr.co.itcen.fa.controller.menu01;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu30Service;
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

	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/search"})
	public String search(Model model,
			@RequestParam(value = "page", required=false, defaultValue = "1")int page,
			@ModelAttribute ReceiptVo revo
			) {
		// 초기 페이지 이동
		if(revo.getRegDate() == null && revo.getCustomerNo() == null) {
			return MAINMENU + "/" + SUBMENU + "/list";
		}
		
		System.out.println("승곤이를 정지합니다2");
		System.out.println(revo.toString());
		
		DataResult<ReceiptVo> dataResult = menu30Service.search(page,revo);
		model.addAttribute("dataResult", dataResult);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}