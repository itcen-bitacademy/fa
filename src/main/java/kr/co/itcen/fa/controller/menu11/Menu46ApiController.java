package kr.co.itcen.fa.controller.menu11;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu11.Menu46Service;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;
import kr.co.itcen.fa.vo.menu11.STermDebtVo;

@Auth
@Controller
@RequestMapping("/api/" + Menu46Controller.MAINMENU)
public class Menu46ApiController {
	
	@Autowired
	Menu46Service menu46Service;
	
	@Autowired
	Menu03Service menu03Service;
	
	@Autowired
	Menu19Service menu19Service;
	
	@ResponseBody
	@RequestMapping("/" + Menu46Controller.SUBMENU + "/search")
	public JSONResult search(@RequestParam(value="code", required=false) String code, 
			@RequestParam(value="financialYear", required=false) String financialYear,
			@RequestParam(value="pageSize", required=false, defaultValue="5") int pageSize) {
		
		Map map = menu46Service.search(code, financialYear, pageSize);
		
		return JSONResult.success(map);
	}
	
	@ResponseBody
	@RequestMapping("/" + Menu46Controller.SUBMENU + "/paging")
	public JSONResult paging(@RequestParam(value="code", required=false) String code, 
			@RequestParam(value="financialYear", required=false) String financialYear,
			@RequestParam(value="pageSize", required=false, defaultValue="5") int pageSize,
			@RequestParam(value="page", required=true) int page){
		
		System.out.println("pageSize : " + pageSize);
		Map map = menu46Service.paging(code, financialYear, pageSize, page);
		
		return JSONResult.success(map);
	}
	//배열로 넘어온거는 '[]' 붙여줘야한다.
	@ResponseBody
	@RequestMapping("/" + Menu46Controller.SUBMENU + "/deleteChecked")
	public JSONResult deleteChecked(@RequestParam(value="noList[]", required=true) List<Long> noList,
			@RequestParam(value="voucherNoList[]", required=true) List<Long> voucherNoList,
			@AuthUser UserVo authUser){
		Map map = new HashMap();
		
		System.out.println("noList :" + noList + " voucherList : " + voucherNoList);
		List<List<RepayVo>> repayLists = menu46Service.possibleDelete(noList);	//상환내역이 있는 차입금은 제외시킨다. 상환내역 리스트를 가져온다
		map.put("repayLists", repayLists);
		System.out.println("repayLists");
		if(repayLists.size() != 0)						//삭제가 안되는경우
			return JSONResult.success(map);
		
		//전표 삭제
		menu46Service.deleteVoucerList(voucherNoList, authUser);
		menu46Service.deleteChecked(noList);						//차입금 삭제
		
		//삭제후 리스트 다시 얻음.
		map.putAll(menu46Service.getListMap());
		map.put("repayLists", null);								//해당 List로 삭제할수있는지 없는지를 비교한다.
		
		return JSONResult.success(map);
	}
	
	@ResponseBody
	@RequestMapping(value = "/" + Menu46Controller.SUBMENU + "/repay", method = RequestMethod.POST)
	public JSONResult repay(RepayVo repayVo,
			@AuthUser UserVo uservo) {
		STermDebtVo vo = menu46Service.get(repayVo.getDebtNo());	//단기 차입금 불러온다
		
		//-----------------단기차입금 update----------------------//
		System.out.println("상환잔액 : " + vo.getRepayBal() + " 납입금: " + repayVo.getPayPrinc());
		System.out.println("repayVo :" + repayVo);
		if(vo.getRepayBal()- repayVo.getPayPrinc() == 0 ) {			//모두 상환한 경우
			System.out.println("모두상환");
			vo.setRepayCompleFlag("Y");
		}
			
		
		vo.setRepayBal(vo.getRepayBal() - repayVo.getPayPrinc());		//상환잔액 update
		menu46Service.updateRepayBal(vo);
		
		//-----------------전표입력----------------------//
		Long voucherNo= menu46Service.insertVoucherWithRepay(vo, repayVo, uservo);	//전표번호를 받아온다.
		
		//-----------------상환 입력----------------------//
		repayVo.setVoucherNo(voucherNo);
		repayVo.setInsertId(uservo.getId());
		menu46Service.insertRepay(repayVo);
		
		Map map = menu46Service.getListMap();
		
		return JSONResult.success(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/" + Menu46Controller.SUBMENU + "/checkDuplication", method = RequestMethod.GET)
	public JSONResult checkDuplication(@RequestParam(value="code", required=true) String code) {
		System.out.println("code : " + code);
		Boolean exist = menu46Service.exist(code);
		return JSONResult.success(exist);
	}
	
	@ResponseBody
	@RequestMapping(value="/" + Menu46Controller.SUBMENU + "/update", method = RequestMethod.POST)
	public JSONResult update(STermDebtVo sTermDebtVo, @AuthUser UserVo authUser) throws ParseException {
		 String deptExpDate = sTermDebtVo.getDebtExpDate(); // dateRangePicker에서 받아온 차입일자와 만기일자를 나누기 위해 변수 이용
		 String saveDeptDate = deptExpDate.substring(0, 10);
		 String saveExpDate = deptExpDate.substring(13);
		 sTermDebtVo.setDebtDate(saveDeptDate); // 차입일자 등록
		 sTermDebtVo.setExpDate(saveExpDate); // 만기일지 등록
		  
		 //상환내역 존재하는지 확인(by code)
		 Boolean existRepay = menu46Service.existRepay(sTermDebtVo.getCode());
		 
		 //존재한다면
		 if(existRepay)
			 return JSONResult.success(existRepay);
		 
		 //전표입력
		 Long voucherNo = menu46Service.updateVoucherWithDebt(sTermDebtVo, authUser);
			
		 //차입금 수정
		 sTermDebtVo.setVoucherNo(voucherNo);
		 menu46Service.update(sTermDebtVo);
		
		 //Map을 받아온다
		 Map map = menu46Service.getListMap();
		 return JSONResult.success(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/" + Menu46Controller.SUBMENU + "/isClosedDate", method=RequestMethod.POST)
	public JSONResult isClosedDate(@RequestParam(value="debtDate", required=true)String debtDate,
			@AuthUser UserVo authUser) throws ParseException {
		Boolean isClosed = menu19Service.checkClosingDate(authUser, debtDate);
		return JSONResult.success(isClosed);
	}
}	
