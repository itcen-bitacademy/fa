package kr.co.itcen.fa.controller.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.itcen.fa.service.menu11.Menu45Service;
import kr.co.itcen.fa.vo.menu11.BankVo;

@RestController("Menu45ApiController")
@RequestMapping("api/menu45")
public class Menu45ApiController {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "45";
	
	@Autowired
	private Menu45Service menu45Service;
	
	// 은행 팝업창에서 은행명으로 데이터 리스트형식으로 조회
	@ResponseBody
	@RequestMapping("/get-bankinfo-list")
	public List<BankVo> getBanknameInfo(
			@RequestParam("banknameVal") String bankname) {
		List<BankVo> bankList = menu45Service.selectBankInfo(bankname);
		return bankList;
	}
}
