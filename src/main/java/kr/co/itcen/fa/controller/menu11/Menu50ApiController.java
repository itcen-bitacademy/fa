package kr.co.itcen.fa.controller.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.service.menu11.Menu50Service;
import kr.co.itcen.fa.vo.menu11.BankVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;

@RestController("Menu50ApiController")
@RequestMapping("api/selectone")
public class Menu50ApiController {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "50";
	
	@Autowired
	private Menu50Service menu50Service;
	
	@ResponseBody
	@RequestMapping("/getpdebtInfo")
	public PdebtVo getPdebtInfo(
			@RequestParam("debtcodeVal") String debtcode) {
		PdebtVo pdebtVo = menu50Service.selectOnePdebtInfo(debtcode);
        return pdebtVo;
	}
	
	// 은행 팝업창에서 은행코드로 조회
	@ResponseBody
	@RequestMapping("/getbankcode")
	public BankVo getBankcodeInfo(
			@RequestParam("bankcodeVal") String bankcode) {
		System.out.println("bankcodeVal : " + bankcode);
		BankVo bankVo = menu50Service.selectOneBankcodeInfo(bankcode);
        return bankVo;
	}
	
	// 은행 팝업창에서 은행명으로 데이터 리스트형식으로 조회
	@ResponseBody
	@RequestMapping("/getbankname")
	public List<BankVo> getBanknameInfo(
			@RequestParam("banknameVal") String bankname) {
		System.out.println("banknameVal : " + bankname);
		List<BankVo> banknameList = menu50Service.selectOneBanknameInfo(bankname);
        return banknameList;
	}
	
	//배열로 넘어온거는 '[]' 붙여줘야한다.
	@ResponseBody
	@RequestMapping(value = "/deleteChecked", method = RequestMethod.POST)
	public JSONResult deleteChecked(@RequestParam(value="sendData[]", required=true) List<Long> noList) {
		menu50Service.deleteChecked(noList);
		return JSONResult.success(noList);
	}
}
