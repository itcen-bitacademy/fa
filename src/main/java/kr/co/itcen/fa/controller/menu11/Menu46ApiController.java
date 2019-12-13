package kr.co.itcen.fa.controller.menu11;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
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
	public JSONResult deleteChecked(@RequestParam(value="sendData[]", required=true) List<Long> noList,
			@RequestParam(value="voucherNoList[]", required=true) List<Long> voucherNoList,
			@AuthUser UserVo authUser){
		//전표 삭제
		List<VoucherVo> voucherVolist = new ArrayList<VoucherVo>();
		
		for(Long voucherNo : voucherNoList) {
			VoucherVo vo = new VoucherVo();
			vo.setNo(voucherNo);
			voucherVolist.add(vo);
		}
		
		menu03Service.deleteVoucher(voucherVolist, authUser);
		
		//차입금 삭제
		menu46Service.deleteChecked(noList);
		
		//삭제후 리스트 다시 얻음.
		Map map = menu46Service.getListMap();
		return JSONResult.success(map);
	}
	
	@ResponseBody
	@RequestMapping(value = "/" + Menu46Controller.SUBMENU + "/repay", method = RequestMethod.POST)
	public JSONResult repay(@RequestBody RepayVo repayVo,@AuthUser UserVo uservo) {
		STermDebtVo vo = menu46Service.get(repayVo.getDebtNo());	//단기 차입금 불러온다
		
		//-----------------단기차입금 update----------------------//
		System.out.println("상환잔액 : " + vo.getRepayBal() + " 납입금: " + repayVo.getPayPrinc());
		if(vo.getRepayBal() < repayVo.getPayPrinc()) {
			return JSONResult.success(false);
		} 
		
		vo.setRepayBal(vo.getRepayBal() - repayVo.getPayPrinc());
		if(vo.getRepayBal() == repayVo.getPayPrinc()) 
			vo.setRepayCompleFlag("Y");
		
		menu46Service.update(vo);
		
		//-----------------전표입력----------------------//
		Long voucherNo= menu46Service.insertVoucherWithRepay(vo, repayVo, uservo);	//전표번호를 받아온다.
		
		//-----------------상환 입력----------------------//
		repayVo.setVoucherNo(voucherNo);
		menu46Service.insertRepay(repayVo);
		
		return JSONResult.success(vo);
	}
}	
