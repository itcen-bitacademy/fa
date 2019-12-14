package kr.co.itcen.fa.controller.menu11;

import java.util.ArrayList;
import java.util.List;

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
import kr.co.itcen.fa.service.menu11.Menu50Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;

@Auth
@Controller("Menu50RepayApiController")
@RequestMapping("/" + Menu50Controller.MAINMENU)
public class Menu50RepayApiController {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "50";
	
	@Autowired
	private Menu50Service menu50Service;

	@Autowired
	private Menu03Service menu03Service;

	// 사채코드 중복값 확인
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/checkcode")
	public JSONResult checkCode(
			@RequestParam(value = "code", required = true, defaultValue = "") String code) {
		PdebtVo pdebtVo = menu50Service.existCode(code);
		System.out.println(pdebtVo);
        return JSONResult.success(pdebtVo);
	}

	// 상환테이블 데이터 추가
	@ResponseBody
	@RequestMapping(value = "/" + SUBMENU + "/repay", method = RequestMethod.POST)
	public JSONResult repay(
			 RepayVo vo,
			 @RequestParam(value = "debtNo") Long debtNo, 
			 @RequestParam(value = "payPrinc") Long payPrinc, 
			 @RequestParam(value = "payDate") String payDate, 
			 @RequestParam(value = "intAmount") Long intAmount, 
			 @AuthUser UserVo uservo) {
		vo.setInsertId(uservo.getId()); // 유저 아이디 셋팅
		System.out.println("===== 상환처리 =====");
		System.out.println("repay" + vo.toString());
		
		// 상환금액 - 상환납입원금
		menu50Service.updateRepayVo(vo); // 기존 사채 차입금액 수정
		PdebtVo pdebtVo = menu50Service.getOne(debtNo); // 기존 사채 컬럼 값 읽기

		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		ItemVo itemVo3 = new ItemVo();

		MappingVo mappingVo = new MappingVo();
		voucherVo.setRegDate(payDate);

		itemVo.setAmount(intAmount);// 이자납입금
		itemVo.setAmountFlag("d");// 차변
		itemVo.setAccountNo(9201101L);// 계정과목코드
		itemVoList.add(itemVo);

		itemVo2.setAmount(payPrinc);// 사채에서 빠진 금액
		itemVo2.setAmountFlag("d");// 차변
		itemVo2.setAccountNo(2402101L);
		itemVoList.add(itemVo2);

		itemVo3.setAmount(payPrinc + intAmount);// 보통예금 : 예금액= 상환액으로 입력한 값
		itemVo3.setAmountFlag("c");// 대변
		itemVo3.setAccountNo(1110103L);// tb_account 보통예금 - no:1110103
		itemVoList.add(itemVo3);

		mappingVo.setVoucherUse(pdebtVo.getName());// 사용목적
		mappingVo.setSystemCode(pdebtVo.getCode());// 사채코드 삽입 ex) I191212001
		mappingVo.setCustomerNo(pdebtVo.getBankCode());
		mappingVo.setDepositNo(pdebtVo.getDepositNo());// 계좌번호

		Long no = menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, uservo);
		vo.setVoucherNo(no);
		menu50Service.insertRepayVo(vo); // 상환 테이블에 insert
		
		System.out.println("차입금액 : " + pdebtVo.getDebtAmount());
		System.out.println("상환잔액 : " + pdebtVo.getRepayBal());
		System.out.println("이자금액 : " + intAmount);

		if ((pdebtVo.getRepayBal() + intAmount) >= pdebtVo.getDebtAmount())
			menu50Service.updateRepayFlag(pdebtVo.getNo());

		return JSONResult.success(pdebtVo);
	}
}
