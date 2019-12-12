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
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
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
	public JSONResult deleteChecked(@RequestParam(value="sendData[]", required=true) List<Long> noList) {
		menu46Service.deleteChecked(noList);
		Map map = menu46Service.getListMap();
		return JSONResult.success(map);
	}
	
	@ResponseBody
	@RequestMapping(value = "/" + Menu46Controller.SUBMENU + "/repay", method = RequestMethod.POST)
	public JSONResult repay(@RequestBody RepayVo repayVo,@AuthUser UserVo uservo) {
		STermDebtVo vo = menu46Service.get(repayVo.getDebtNo());	//단기 차입금 불러온다
		
		//단기차입금 update
		System.out.println("상환잔액 : " + vo.getRepayBal() + " 납입금: " + repayVo.getPayPrinc());
		if(vo.getRepayBal() < repayVo.getPayPrinc()) {
			return JSONResult.success(false);
		} 
		
		vo.setRepayBal(vo.getRepayBal() - repayVo.getPayPrinc());
		if(vo.getRepayBal() == repayVo.getPayPrinc()) 
			vo.setRepayCompleFlag("Y");
		
		menu46Service.update(vo);
		
		//전표입력
		Long intAmount= (Long) (vo.getRepayBal()*vo.getIntRate()/100);//intAmount= 상환액 * 기존 이자 /100 ->즉 이자납입금
		repayVo.setIntAmount(intAmount);
		
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		ItemVo itemVo3 = new ItemVo();
		
		MappingVo mappingVo = new MappingVo();
		voucherVo.setRegDate(repayVo.getPayDate());
		
		itemVo.setAmount(repayVo.getIntAmount());		//이자납입금
		itemVo.setAmountFlag("d");						//차변
		itemVo.setAccountNo(repayVo.getAccountNo());	//이자비용 계정과목코드
		itemVoList.add(itemVo);
		
		itemVo2.setAmount(repayVo.getPayPrinc());		//납입원금
		itemVo2.setAmountFlag("d");						//차변
		itemVo2.setAccountNo(vo.getAccountNo());		//단기차입금 계정과목코드					
		itemVoList.add(itemVo2);
		
		itemVo3.setAmount(repayVo.getPayPrinc() + repayVo.getIntAmount());		//보통예금
		itemVo3.setAmountFlag("c");//대변
		itemVo3.setAccountNo(1110103L);//dPrma
		itemVoList.add(itemVo3);
		
		mappingVo.setVoucherUse(vo.getName());//사용목적
		mappingVo.setSystemCode(vo.getCode());//제코드l190
		mappingVo.setCustomerNo(vo.getBankCode());
		mappingVo.setDepositNo(vo.getDepositNo());//계좌번호
		
		//전표입력후 전표번호를 가져온다.
		Long voucherNo= menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, uservo);
		
		//상환 입력
		repayVo.setVoucherNo(voucherNo);
		menu46Service.insertRepay(repayVo);
		
		return JSONResult.success(vo);
	}
}
