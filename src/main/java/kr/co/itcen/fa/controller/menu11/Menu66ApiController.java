package kr.co.itcen.fa.controller.menu11;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu11.Menu66Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;

@Auth
@RestController
@RequestMapping("/api/" + Menu66Controller.MAINMENU + "/" + Menu66Controller.SUBMENU)
public class Menu66ApiController {
	
	@Autowired
	Menu66Service menu66Service;
	
	@RequestMapping(value="/getList", method=RequestMethod.POST)
	public JSONResult getList(RepayVo vo, 
			@RequestParam(value="page", required=true)int page,
			@RequestParam(value="pageSize", required=false, defaultValue="8")int pageSize) {
		
		Map map = menu66Service.getList(vo, page, pageSize);
		System.out.println(map);
		return JSONResult.success(map);
	}
	
	@RequestMapping(value="/deleteChecked", method=RequestMethod.POST)
	public JSONResult deleteChecked(@AuthUser UserVo authUser,
			@RequestBody List<RepayVo> voList) {
		System.out.println("voList:" + voList);
		//전표 삭제
		Map map = new HashMap();
		
		
		//차입금 수정 : 상환금을 잔액에 다시 더해준다.
		menu66Service.updateDebt(voList, authUser);
		
		//전표 삭제
		menu66Service.deleteVoucerList(voList, authUser);
		menu66Service.deleteChecked(voList);						//상환내역 삭제
		
		//삭제후 리스트 다시 얻음.
		map = menu66Service.getList(new RepayVo(), 1, 8);			//기본 리스트를 불러온다
		
		//삭제
		return JSONResult.success(map);
	}
}
