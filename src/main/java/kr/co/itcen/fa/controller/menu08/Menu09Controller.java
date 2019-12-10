package kr.co.itcen.fa.controller.menu08;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu08.Menu09Service;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu08.LandVo;


/**
 * 
 * @author 정의돈
 * 
 * 토지관리 
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu09Controller.MAINMENU)
public class Menu09Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "09";
	
	
	@Autowired 
	private Menu09Service menu09Service;
	
	
	@Autowired
	private Menu03Service menu03Service;  // 1팀 전표
	
	@Autowired
	private Menu19Service menu19Service;  // 6팀 결산
	
	
	//조회
	//               /08   /   09     , /08/09/list
	@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String list(Model model, 
						@RequestParam(value="id", required=false) String id) {
		

		
		menu09Service.test();
		/*
		 *   JSP
		 *   08/09/list.jsp
		 * 
		 */
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//대분류코드 select box
		map.putAll(menu09Service.getSectionList());
		
		//거래처관련 select box
		map.putAll(menu09Service.getCustomerCodeList());
		
		//관리 list
		map.putAll(menu09Service.getLandList());
		
		if(id != null) {
			map.putAll(menu09Service.getsearchList(id));		
		}
		
		model.addAllAttributes(map);
//		
		return  MAINMENU + "/" + SUBMENU + "/add";
	}
	
	
	//입력
	@RequestMapping(value={"/" + SUBMENU + "/insert" }, method=RequestMethod.POST)
	public String insert(@ModelAttribute LandVo landVo, @SessionAttribute("authUser") UserVo user
						 /*, @ModelAttribute SectionVo sectionVo,@ModelAttribute */
						 ,Model model
						 ) throws ParseException {
		
		System.out.println("거래날짜 : " +landVo.getPayDate());
		if(landVo.getCombineNo() == null) {
			landVo.setCombineNo("00");
		}

		landVo.setId("c"+landVo.getId());
		landVo.setInsertUserid(user.getId());

		//마감 여부 체크
		if(!menu19Service.checkClosingDate(user, landVo.getPayDate())) {
			System.out.println("등록일 해보자");
			menu09Service.insertLand(landVo);
			return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add";
		} else {
			System.out.println("등록일 안된다.");
			model.addAttribute("closingDate", true);
			return MAINMENU + "/" + SUBMENU + "/add";
		}
	}

	//수정
	@RequestMapping(value={"/" + SUBMENU + "/update" }, method=RequestMethod.POST)
	public String update(@ModelAttribute LandVo landVo , @AuthUser UserVo user
						 ,@RequestParam(value="taxbillNo", required=false) String taxbillNo
						 ,@RequestParam(value="customerNo", required=false) String customerNo) {
		
		landVo.setUpdateUserid(user.getId());
		
		if(landVo.getCombineNo() == null) {
			landVo.setCombineNo("00");
		}

		// 전표 시작
		if(taxbillNo!=null) {
		
		CustomerVo cus = menu09Service.getDepositNo(customerNo);
		
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();


		 //왼쪽 : 얻은것(차변) 토지 가격  :::: 오른쪽(대변)  현금   가격 
		
		//거래금액
		
		MappingVo mappingVo = new MappingVo();
		//토지
		voucherVo.setRegDate(landVo.getPayDate()); // landVo.getPayDate() : 거래날짜
		itemVo.setAmount(landVo.getAcqPrice()+landVo.getAcqTax()+landVo.getRegTax()+landVo.getEtcCost());  // landVo.getAcqPrice() : 거래금액 (토지를 얻기 위해 세금을 포함한 금액)
		itemVo.setAmountFlag("d");     //d: 차변 왼쪽
		itemVo.setAccountNo(1220101L); //계정과목 : 자산인가 토지인가
		itemVoList.add(itemVo);

		itemVo2.setAmount(landVo.getAcqPrice()+landVo.getAcqTax()+landVo.getRegTax()+landVo.getEtcCost());
		itemVo2.setAmountFlag("c");  // c: 대변 오른쪽
		itemVo2.setAccountNo(1110101L); //현금
		itemVoList.add(itemVo2);

		// 토지구입비용 + 부가세 = 지불금액 / 차변 대변 값으로
		
		//매핑테이블
		mappingVo.setVoucherUse("투자");  // 왜 샀는지 적어준다.
		mappingVo.setSystemCode(landVo.getId());  // 각 토지 코드번호
		mappingVo.setDepositNo(cus.getDepositNo());  // 계좌번호
		mappingVo.setCustomerNo(customerNo); //거래처번호
		mappingVo.setManageNo(taxbillNo);//세금계산서번호
		mappingVo.setBankCode(cus.getBankCode()); //은행코드
		mappingVo.setBankName(cus.getBankName()); //은행명

		long voucherNo= menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, user);
		landVo.setVoucherNo(voucherNo);
		}

		menu09Service.updateLand(landVo);
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add";
	}
	
	//삭제
	@RequestMapping(value = { "/" + SUBMENU + "/delete" }, method=RequestMethod.POST)
	public String delete(@RequestParam(value="id") String id, @AuthUser UserVo user) {
		
		String userId = user.getId();
		
		
		menu09Service.delLand(id, userId);
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add";
	}
	
}
