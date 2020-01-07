package kr.co.itcen.fa.controller.menu11;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu11.Menu50Service;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;

@Auth
@RestController("Menu50RepayApiController")
@RequestMapping("/" + Menu50Controller.MAINMENU)
public class Menu50RepayApiController {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "50";

	@Autowired
	private Menu50Service menu50Service;

	@Autowired
	private Menu19Service menu19Service;

	// 사채코드 중복값 확인
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/checkcode")
	public JSONResult checkCode(
			@RequestParam(value = "code", required = true, defaultValue = "") String code) {
		PdebtVo pdebtVo = menu50Service.existCode(code);
		return JSONResult.success(pdebtVo);
	}

	// 상환테이블 데이터 추가
	@ResponseBody
	@RequestMapping(value = "/" + SUBMENU + "/repay", method = RequestMethod.POST)
	public JSONResult repay(
			@RequestBody RepayVo repayVo, 
			@AuthUser UserVo userVo) {
		try {
			if (menu19Service.checkClosingDate(userVo, repayVo.getPayDate())) {
				PdebtVo pdebtVo = menu50Service.insertRepayVo(repayVo, userVo);
				return JSONResult.success(pdebtVo);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return JSONResult.success(null);
	}

	// 상환내역이 있을경우 수정불가
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/checkrepay")
	public JSONResult checkrepay(
			@RequestParam(value = "no", required = true) Long no) {
		List<RepayVo> list = menu50Service.getRepay(no);
		return JSONResult.success(list);
	}

	// 상환내역이 있을 경우 현재 선택된 사채정보에 담겨있는 상환내역 리스트로 출력
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/checkrepaylist")
	public JSONResult checkrepaylist(
			@RequestParam(value = "no", required = true) Long[] no) {
		List<RepayVo> list = menu50Service.getRepay(no);
		return JSONResult.success(list);
	}
	
	@ResponseBody
	@RequestMapping("/"+SUBMENU+"/checkrepaydue")
	public JSONResult checkrepaydue() {
		List<PdebtVo> list = menu50Service.getRepayDueList();
        return JSONResult.success(list);
	}
}
