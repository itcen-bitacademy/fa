package kr.co.itcen.fa.controller.menu11;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu11.Menu48Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;
@Auth
@Controller("Menu48ApiController")
@RequestMapping("/" + Menu48Controller.MAINMENU)
public class Menu48ApiController {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "48";
	@Autowired
	private Menu48Service menu48Service;
	
	@Autowired
	private Menu03Service menu03Service;
	@ResponseBody
	@RequestMapping("/"+SUBMENU+"/checkcode")
	public JSONResult checkCode(@RequestParam(value="code", required=true, defaultValue="") String code) {
		LTermdebtVo lvo = menu48Service.existCode(code);
		System.out.println(lvo);
        return JSONResult.success(lvo);
	}
	@ResponseBody
	@RequestMapping(value = "/"+SUBMENU+"/repay", method = RequestMethod.POST)
	public JSONResult repay(@RequestBody RepayVo vo,@AuthUser UserVo uservo) {
		vo.setInsertId(uservo.getId());//유저 아이디 셋팅
		menu48Service.update(vo);//기존 장기 차입금 수정
		
		LTermdebtVo lvo = menu48Service.getOne(vo.getDebtNo());//기존 장기차입금 컬럼 값 읽기
		
		Long money= (long) (vo.getPayPrinc()*lvo.getIntRate()/100);//money= 상환액 * 기존 이자 /100 ->즉 이자납입금
		
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		ItemVo itemVo3 = new ItemVo();
		
		MappingVo mappingVo = new MappingVo();
		voucherVo.setRegDate(vo.getPayDate());
		
		itemVo.setAmount(money);//이자납입금
		itemVo.setAmountFlag("d");//차변
		itemVo.setAccountNo(9201101L);//계정과목코드
		itemVoList.add(itemVo);
		
		itemVo2.setAmount(vo.getPayPrinc()-money);//장기차입금에서 빠진 금액
		itemVo2.setAmountFlag("d");//차변
		itemVo2.setAccountNo(2401101L);
		itemVoList.add(itemVo2);
		
		itemVo3.setAmount(vo.getPayPrinc());//예금액= 상환액으로 입력한 값
		itemVo3.setAmountFlag("c");//대변
		itemVo3.setAccountNo(1110103L);//dPrma
		itemVoList.add(itemVo3);
		
		mappingVo.setVoucherUse(lvo.getName());//사용목적
		mappingVo.setSystemCode(lvo.getCode());//제코드l190
		
		String BankCode=menu48Service.selectBankCode(lvo.getDepositNo());
		mappingVo.setCustomerNo(BankCode);
		mappingVo.setDepositNo(vo.getDepositNo());//계좌번호
		
		
		Long no=menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, uservo);
		
		vo.setVoucherNo(no);
		menu48Service.insert(vo);//상환 테이블에 insert -> 
		if((lvo.getRepayBal()+lvo.getIntAmount()) >= lvo.getDebtAmount())
			menu48Service.updateRepayFlag(lvo.getNo());
		return JSONResult.success(lvo);
	}
}
