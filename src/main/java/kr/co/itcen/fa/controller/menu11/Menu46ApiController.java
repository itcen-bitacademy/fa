package kr.co.itcen.fa.controller.menu11;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
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
	@RequestMapping(value="/" + Menu46Controller.SUBMENU + "/getList", method=RequestMethod.POST)
	public JSONResult getList(@RequestParam(value="code", required=false) String code, 
			@RequestParam(value="financialYear", required=false) String financialYear,
			@RequestParam(value="pageSize", required=false, defaultValue="11") int pageSize,
			@RequestParam(value="page", required=true) int page){
		
		System.out.println("pageSize : " + pageSize);
		Map map = menu46Service.getList(code, financialYear, pageSize, page);
		
		return JSONResult.success(map);
	}
	
	//배열로 넘어온거는 '[]' 붙여줘야한다.
	@Transactional
	@ResponseBody
	@RequestMapping("/" + Menu46Controller.SUBMENU + "/deleteChecked")
	public JSONResult deleteChecked(@RequestBody List<STermDebtVo> list,
			@AuthUser UserVo authUser){
		Map map = new HashMap();
		
		System.out.println("list : " + list);
		List<List<RepayVo>> repayLists = menu46Service.possibleDelete(list);	//상환내역이 있는 차입금은 제외시킨다. 상환내역 리스트를 가져온다
		if(repayLists.size() != 0) {
			map.put("repayLists", repayLists);
			map.put("isPossibleDelete", false);
			return JSONResult.success(map);
		}
		
		//전표 삭제
		menu46Service.deleteVoucerList(list, authUser);
		menu46Service.deleteChecked(list);						//차입금 삭제
		
		//삭제후 리스트 다시 얻음.
		map.putAll(menu46Service.getList());
		
		return JSONResult.success(map);
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping(value = "/" + Menu46Controller.SUBMENU + "/repay", method = RequestMethod.POST)
	public JSONResult repay(RepayVo repayVo,
			@AuthUser UserVo authUser) throws ParseException {
		System.out.println("--------------------repay() Called ---------------");
		STermDebtVo vo = menu46Service.get(repayVo.getDebtNo());	//단기 차입금 불러온다
		Map map = new HashMap();
		
		if(!menu19Service.checkClosingDate(authUser, repayVo.getPayDate())) {
			map.put("isClosed", true);
		}
		
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
		Long voucherNo= menu46Service.insertVoucherWithRepay(vo, repayVo, authUser);	//전표번호를 받아온다.
		
		//-----------------상환 입력----------------------//
		repayVo.setVoucherNo(voucherNo);
		repayVo.setInsertId(authUser.getId());
		menu46Service.insertRepay(repayVo);
		
		map = menu46Service.getList();
		
		System.out.println("--------------------repay() End ---------------");
		return JSONResult.success(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/" + Menu46Controller.SUBMENU + "/checkDuplication", method = RequestMethod.GET)
	public JSONResult checkDuplication(@RequestParam(value="code", required=true) String code) {
		System.out.println("code : " + code);
		Boolean exist = menu46Service.exist(code);
		return JSONResult.success(exist);
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping(value="/" + Menu46Controller.SUBMENU + "/update", method = RequestMethod.POST)
	public JSONResult update(STermDebtVo sTermDebtVo, @AuthUser UserVo authUser) throws ParseException {
		System.out.println("-------------------Controller update() Start-----------------------");
		System.out.println("sTermDebtVo : " + sTermDebtVo);
		 String deptExpDate = sTermDebtVo.getDebtExpDate(); // dateRangePicker에서 받아온 차입일자와 만기일자를 나누기 위해 변수 이용
		 String saveDeptDate = deptExpDate.substring(0, 10);
		 String saveExpDate = deptExpDate.substring(13);
		 sTermDebtVo.setDebtDate(saveDeptDate); // 차입일자 등록
		 sTermDebtVo.setExpDate(saveExpDate); // 만기일지 등록
		  
		 Map map = new HashMap();
		 //마감인지 확인
		 System.out.println("마감인가? : " + menu19Service.checkClosingDate(authUser, sTermDebtVo.getDebtDate()));
		 if(!menu19Service.checkClosingDate(authUser, sTermDebtVo.getDebtDate()) == true){			//마감이됬으면
			 map.put("isClosed", true);
			 return JSONResult.success(map);
		 }
		 
		 //상환내역 존재하는지 확인(by code)
		 Boolean existRepay = menu46Service.existRepay(sTermDebtVo.getCode());
		 if(existRepay)															//존재한다면 업데이트 불가
			 return JSONResult.success(existRepay);
		 
		 //전표입력후 전표번호를 가지고온다.
		 System.out.println("업데이트 전 voucherNo : " + sTermDebtVo.getVoucherNo());
		 Long voucherNo = menu46Service.updateVoucherWithDebt(sTermDebtVo, authUser);
		 System.out.println("업데이트 후 voucherNo : " + voucherNo);
			
		 //차입금 수정
		 sTermDebtVo.setVoucherNo(voucherNo);
		 menu46Service.update(sTermDebtVo);
		
		 //Map을 받아온다
		 map = menu46Service.getList();
		 System.out.println("-------------------Controller update() End-----------------------");
		 return JSONResult.success(map);
	}
	
	@Transactional
	@ResponseBody
	@RequestMapping(value="/" + Menu46Controller.SUBMENU + "/insert", method = RequestMethod.POST)
	public JSONResult insert(STermDebtVo sTermDebtVo, @AuthUser UserVo authUser) throws ParseException {
		String debtExpDate = sTermDebtVo.getDebtExpDate(); // dateRangePicker에서 받아온 차입일자와 만기일자를 나누기 위해 변수 이용
	    String saveDeptDate = debtExpDate.substring(0, 10);
	    String saveExpDate = debtExpDate.substring(13);
	    sTermDebtVo.setDebtDate(saveDeptDate); // 차입일자 등록
	    sTermDebtVo.setExpDate(saveExpDate); // 만기일지 등록
	    
		sTermDebtVo.setInsertId(authUser.getId());
		
		System.out.println("sTermDebtVo : " + sTermDebtVo);
		Map map= new HashMap();
		//마감확인
		if(!menu19Service.checkClosingDate(authUser, sTermDebtVo.getDebtDate())) {
			System.out.println("마감됬다!!!!!!");
			 map.put("isClosed", true);
			 return JSONResult.success(map);
		}
		
		//전표입력
		Long voucherNo = menu46Service.insertVoucherWithDebt(sTermDebtVo, authUser);
		
		//차입금 입력
		sTermDebtVo.setVoucherNo(voucherNo);
		menu46Service.insert(sTermDebtVo);
		
		map = menu46Service.getList();
		
		return JSONResult.success(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/" + Menu46Controller.SUBMENU + "/getRepayDueList", method = RequestMethod.POST)
	public JSONResult getRepayDueList()  {
		List<STermDebtVo> list = menu46Service.getRepayDueList();
		System.out.println(list);
		return JSONResult.success(list);
	}
	
	@ResponseBody
	@RequestMapping(value="/" + Menu46Controller.SUBMENU + "/insertTest", method = RequestMethod.POST)
	public JSONResult insertTest(STermDebtVo sTermDebtVo, @AuthUser UserVo authUser) throws ParseException {			//insert 내테이블에만 할때 사용
		String debtExpDate = sTermDebtVo.getDebtExpDate(); // dateRangePicker에서 받아온 차입일자와 만기일자를 나누기 위해 변수 이용
	    String saveDeptDate = debtExpDate.substring(0, 10);
	    String saveExpDate = debtExpDate.substring(13);
	    sTermDebtVo.setDebtDate(saveDeptDate); // 차입일자 등록
	    sTermDebtVo.setExpDate(saveExpDate); // 만기일지 등록
	    
		sTermDebtVo.setInsertId(authUser.getId());
		
		System.out.println("sTermDebtVo : " + sTermDebtVo);
		Map map= new HashMap();
		
		//차입금 입력
		sTermDebtVo.setVoucherNo(1L);
		menu46Service.insert(sTermDebtVo);
		
		map = menu46Service.getList();
		
		return JSONResult.success(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/" + Menu46Controller.SUBMENU + "/getYearDebtStat", method = RequestMethod.POST)
	public JSONResult getYearDebtStat() {			//insert 내테이블에만 할때 사용
		Map map = menu46Service.getYearDebtStat();
		return JSONResult.success(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/" + Menu46Controller.SUBMENU + "/getMonthDebtStat", method = RequestMethod.POST)
	public JSONResult getMonthDebtStat(@RequestParam(value="searchYear", required=false, defaultValue="2019") int searchYear) {			//insert 내테이블에만 할때 사용
		Map map = menu46Service.getMonthDebtStat(searchYear);
		return JSONResult.success(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/" + Menu46Controller.SUBMENU + "/getYearIntStat", method = RequestMethod.POST)
	public JSONResult getYearIntStat() {
		Map map = menu46Service.getYearIntStat();
		return JSONResult.success(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/" + Menu46Controller.SUBMENU + "/getDebtRatio", method = RequestMethod.POST)
	public JSONResult getDebtRatio() {
		List<Map> list = menu46Service.getDebtRatioStat();
		return JSONResult.success(list);
	}
}	
