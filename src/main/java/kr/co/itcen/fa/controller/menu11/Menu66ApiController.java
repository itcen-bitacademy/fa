package kr.co.itcen.fa.controller.menu11;

import java.text.ParseException;
import java.util.ArrayList;
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
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;

@Auth
@RestController
@RequestMapping("/api/" + Menu66Controller.MAINMENU + "/" + Menu66Controller.SUBMENU)
public class Menu66ApiController {
	
	@Autowired
	Menu66Service menu66Service;
	
	@Autowired
	Menu19Service menu19Service;
	
	@RequestMapping(value="/getList", method=RequestMethod.POST)
	public JSONResult getList(RepayVo vo, 
			@RequestParam(value="page", required=true)int page,
			@RequestParam(value="pageSize", required=false, defaultValue="8")int pageSize) {
		System.out.println("----------------getList() called ----------------");
		System.out.println("vo : " + vo);
		if("초기값".equals(vo.getDebtType())) {
			vo.setDebtType("");
		}
		Map map = menu66Service.getList(vo, page, pageSize);
		System.out.println(map);
		
		System.out.println("----------------getList() End ----------------");
		return JSONResult.success(map);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public JSONResult update(RepayVo vo, 
			@AuthUser UserVo authUser) throws ParseException {
		
		System.out.println("--------------update() called----------------");
		System.out.println("vo : " + vo);
		Map map = new HashMap();
		//마감확인
		System.out.println("payDate : " + vo.getPayDate());
		if(!menu19Service.checkClosingDate(authUser, vo.getPayDate())){
			map.put("isClosed", true);
			return JSONResult.success(map);
		}
		
		//전표 수정
		Long no = menu66Service.updateVoucher(vo, authUser);
		
		//차입금 상환잔액 수정
		menu66Service.updateDebt(vo);
		
		//전표번호 새로 부여받고, 상환 update
		vo.setUpdateId(authUser.getId());
		vo.setVoucherNo(no);
		menu66Service.update(vo); // 상환 테이블에 update
		
		map = menu66Service.getList();
		
		return JSONResult.success(map);
	}
	
	@RequestMapping(value="/deleteChecked", method=RequestMethod.POST)
	public JSONResult deleteChecked(@AuthUser UserVo authUser,
			@RequestBody List<RepayVo> voList) throws ParseException {
		System.out.println("voList:" + voList);
		
		
		Map map = new HashMap();
		
		List<RepayVo> passedAtClosingDateList = new ArrayList<RepayVo>();			//마감데이터를 저장할 리스트
		//마감확인 
		for(RepayVo vo : voList) {
			if(!menu19Service.checkClosingDate(authUser, vo.getPayDate())) {		//마감이 되었으면
				passedAtClosingDateList.add(vo);
			}
		}
		if(passedAtClosingDateList.size() > 0) {									//마감된 데이터가 있으면
			System.out.println("마감되었다.");
			System.out.println("passedAtClosingDateList : " + passedAtClosingDateList);
			map.put("isClosed",true);
			map.put("passedAtClosingDateList", passedAtClosingDateList);
			return JSONResult.success(map);
		}
		
		//차입금 수정 : 상환금을 잔액에 다시 더해준다.
		menu66Service.updateDebtList(voList);
		
		//전표 삭제
		menu66Service.deleteVoucerList(voList, authUser);
		menu66Service.deleteChecked(voList);						//상환내역 삭제
		
		//삭제후 리스트 다시 얻음.
		map = menu66Service.getList();			//기본 리스트를 불러온다
		
		//삭제
		return JSONResult.success(map);
	}
}
