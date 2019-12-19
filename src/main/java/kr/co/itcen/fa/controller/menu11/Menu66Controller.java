package kr.co.itcen.fa.controller.menu11;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu11.Menu66Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;
import kr.co.itcen.fa.vo.menu11.STermDebtVo;

/**
 * 
 * @author 박준호 
 * 상환내역관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu66Controller.MAINMENU)
public class Menu66Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "66";

	@Autowired
	private Menu66Service menu66Service;
	
	@Autowired
	private Menu03Service menu03Service;

	@RequestMapping(value = {"/" + SUBMENU,"/"+SUBMENU+"list"},method = RequestMethod.GET)
	public String list(
			Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page, 
			@ModelAttribute("vo") RepayVo vo) {
		// tb_repay 의 debtNo를 통해 각 사채테이블의 PK인 no와 비교하여 데이터 호출
		DataResult<RepayVo> dataResult = menu66Service.list(page, vo.getCode(), vo.getDebtType());
		
		UriComponents uriComponents=
				UriComponentsBuilder.newInstance()
					.queryParam("code", vo.getCode())
					.queryParam("debtType", vo.getDebtType())
					.build();
		
		String uri = uriComponents.toUriString();
		model.addAttribute("uri",uri);
		model.addAttribute("dataResult", dataResult);
		model.addAttribute("contentsCount", dataResult.getPagination().getTotalCnt()); // 게시물 수
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/list" }, method = RequestMethod.POST)
	public String list(
			@RequestParam(value="code",required = false, defaultValue = "") String code, 
			@RequestParam(value="debtType",required = false, defaultValue = "") String debtType,
			@RequestParam(value="page", required=false,defaultValue = "1") int page) {
		
		return "redirect:/"+MAINMENU+"/"+SUBMENU + "?code="+code+"&debtType="+debtType+"&page"+page;
	}
	
	@RequestMapping(value = "/" + SUBMENU + "/update", method = RequestMethod.POST)
	public String update(
			@ModelAttribute("vo") RepayVo vo, 
			@AuthUser UserVo userVo) {
		System.out.println(vo.getTempPayPrinc() + " : " + vo.getPayPrinc());
		vo.setUpdateId(userVo.getId()); // 수정자 아이디 삽입
		
		System.out.println("RepayVo : " + vo);
		// 단기, 장기, 사채 (debt_type)에 따라서 상환금액 업데이트
		menu66Service.restoreRepayBal(vo);
		menu66Service.updateRepayVo(vo); // 기존 사채 차입금액 수정
		Long convertPayPrinc = vo.getPayPrinc() - vo.getIntAmount();
		vo.setPayPrinc(convertPayPrinc);
		
		STermDebtVo sTermDebtVo = null;
		LTermdebtVo lTermdebtVo = null;
		PdebtVo pdebtVo = null;
		
		if(vo.getDebtType().equals("S")) {
			sTermDebtVo = menu66Service.getSTermDebtOne(vo.getDebtNo()); // 기존 단기차입금 컬럼 값 읽기
		} else if (vo.getDebtType().equals("L")) {
			lTermdebtVo = menu66Service.getLTermDebtOne(vo.getDebtNo()); // 기존 장기차입금 컬럼 값 읽기
		} else if (vo.getDebtType().equals("P")) {
			pdebtVo = menu66Service.getPdebtOne(vo.getDebtNo()); // 기존 사채 컬럼 값 읽기
		}
		
		vo.setVoucherNo(menu66Service.select(vo.getNo()));
		
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		ItemVo itemVo3 = new ItemVo();

		MappingVo mappingVo = new MappingVo();
		voucherVo.setNo(vo.getVoucherNo());
		voucherVo.setRegDate(vo.getPayDate());

		//----------------- ItemVo 각각 개정과목코드에 맞게 매핑 ----------------------//
		itemVo.setAmount(vo.getIntAmount());// 이자납입금
		itemVo.setAmountFlag("d");// 차변
		itemVo.setAccountNo(9201101L);// 계정과목코드
		itemVoList.add(itemVo);

		//-----------------단기, 장기, 사채 계정코드 분기----------------------//
		itemVo2.setAmount(vo.getPayPrinc());// 사채에서 빠진 금액
		itemVo2.setAmountFlag("d");// 차변
		if(vo.getDebtType().equals("S")) {
			itemVo2.setAccountNo(2180101L); // 단기차입금
		} else if (vo.getDebtType().equals("L")) {
			itemVo2.setAccountNo(2401101L); // 장기차입금
		} else if (vo.getDebtType().equals("P")) {
			itemVo2.setAccountNo(2402101L); // 사채
		}
		itemVoList.add(itemVo2);
		//-----------------단기, 장기, 사채 계정코드 분기----------------------//

		itemVo3.setAmount(vo.getPayPrinc() + vo.getIntAmount());// 보통예금 : 예금액 = 상환액으로 입력한 값
		itemVo3.setAmountFlag("c");// 대변
		itemVo3.setAccountNo(1110103L);// tb_account 보통예금
		itemVoList.add(itemVo3);
		//----------------- ItemVo ----------------------//
		
		System.out.println("S : " + sTermDebtVo);
		System.out.println("L : " + lTermdebtVo);
		System.out.println("P : " + pdebtVo);

		if(vo.getDebtType().equals("S")) {
			mappingVo.setVoucherUse(sTermDebtVo.getName());// 사용목적
			mappingVo.setSystemCode(sTermDebtVo.getCode());// 사채코드 삽입 ex) I191212001
			mappingVo.setCustomerNo(sTermDebtVo.getBankCode());
			mappingVo.setDepositNo(sTermDebtVo.getDepositNo());// 계좌번호
		} else if (vo.getDebtType().equals("L")) {
			mappingVo.setVoucherUse(lTermdebtVo.getName());// 사용목적
			mappingVo.setSystemCode(lTermdebtVo.getCode());// 사채코드 삽입 ex) I191212001
			mappingVo.setCustomerNo(lTermdebtVo.getBankCode());
			mappingVo.setDepositNo(lTermdebtVo.getDepositNo());// 계좌번호
		} else if (vo.getDebtType().equals("P")) {
			mappingVo.setVoucherUse(pdebtVo.getName());// 사용목적
			mappingVo.setSystemCode(pdebtVo.getCode());// 사채코드 삽입 ex) I191212001
			mappingVo.setCustomerNo(pdebtVo.getBankCode());
			mappingVo.setDepositNo(pdebtVo.getDepositNo());// 계좌번호
		}
		
		Long no = menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, userVo);
		vo.setVoucherNo(no);
		menu66Service.update(vo); // 상환 테이블에 update
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	@RequestMapping(value = "/" + SUBMENU + "/delete", method = RequestMethod.POST)
	public String delete(
			@RequestParam("no") Long[] no, 
			@RequestParam("hidden-debttype") String[] debtType, 
			@RequestParam("hidden-payprinc") Long[] payPrinc,
			@AuthUser UserVo uservo) {
		System.out.println("delete");
		System.out.println(no.toString());
		System.out.println(debtType.toString());
		System.out.println(payPrinc.toString());
		/*
		 * List<Long> list = menu66Service.selectVoucherNo(no); List<VoucherVo>
		 * voucherVolist = new ArrayList<VoucherVo>();
		 * 
		 * for(Long no1: list) { VoucherVo v = new VoucherVo(); v.setNo(no1);
		 * voucherVolist.add(v); }
		 * 
		 * for(VoucherVo v : voucherVolist) { System.out.println("VoucherVo : " + v); }
		 * 
		 * menu03Service.deleteVoucher(voucherVolist, uservo);
		 * //menu66Service.deleteDebt(no, debtType, tempPayPrinc);
		 * menu66Service.delete(no);
		 */
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
}
