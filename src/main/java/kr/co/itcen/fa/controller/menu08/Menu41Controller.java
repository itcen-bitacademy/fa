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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu01.Menu05Service;
import kr.co.itcen.fa.service.menu08.Menu41Service;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu08.TaxbillVo;
import kr.co.itcen.fa.vo.menu08.VehicleVo;


/**
 * 
 * @author 권영미
 * 
 * 차량관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu41Controller.MAINMENU)
public class Menu41Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "41";

	@Autowired
	private Menu41Service menu41Service;
	
	@Autowired
	private Menu19Service menu19Service;  // 6팀 결산

	@Autowired
	private Menu03Service menu03Service;  // 1팀 전표
	
	@Autowired
	private Menu05Service menu05Service; // 1팀 카드 (비용관련 월사용료만)

	//               /08   /   41     , /08/41/add
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String list(
			Model model,
			@RequestParam(value="id", required=false, defaultValue = "") String id,
			@RequestParam(value="page", required=false, defaultValue = "1") int page,
			@RequestParam(value="closingDate", required=false)Boolean closingDate) 
		{
		//menu41Service.test();
		/*
		 *   JSP
		 *   08/41/add.jsp
		 * 
		 */

		//페이징 처리 	dataresult 생성, 모델
		
		
		DataResult<VehicleVo> dataResult = menu41Service.list(id, page);
		model.addAttribute("dataResult",dataResult);
		model.addAttribute("page" , page);
		
		Map<String, Object> map = new HashMap<>();
		
		
		//대분류 select box
		map.putAll(menu41Service.getSection());
		model.addAllAttributes(map);

		
		//직급 select box
		map.putAll(menu41Service.getName());
		model.addAllAttributes(map);
		
		
		//거래처코드 select box
		map.putAll(menu41Service.getCustomer());
		model.addAllAttributes(map);
		
		//마감일자
		model.addAttribute("closingDate", closingDate);
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}

	
	//등록기능
	@RequestMapping(value = {"/" + SUBMENU + "/insert" }, method = RequestMethod.POST)
	public String insert(@ModelAttribute VehicleVo vehicleVo, 
						 @SessionAttribute("authUser") UserVo userVo,
						 Model model,
						 RedirectAttributes redirect) throws ParseException{
		
		System.out.println("새로입력 합니다.");
		
		
		vehicleVo.setInsertUserId(userVo.getId());
		vehicleVo.setId("e"+vehicleVo.getId());
		
		System.out.println(vehicleVo);
		
		//마감 여부 체크
	    if(!menu19Service.checkClosingDate(userVo, vehicleVo.getPayDate())) { 
	    	System.out.println("마감되었습니다.");
    	    //model.addAttribute("closingDate", true);
	    	redirect.addAttribute("closingDate",true);
	    	return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add";
	    } else {
	    	System.out.println("등록되었습니다.");
		    menu41Service.insert(vehicleVo);
		    return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add"; 
	    }
	}

	//수정기능
	@RequestMapping(value = { "/" + SUBMENU + "/update" }, method =RequestMethod.POST) 
	public String update(@ModelAttribute VehicleVo vehicleVo,
						 @SessionAttribute("authUser") UserVo userVo,
						 Model model) throws ParseException{
		
		System.out.println("수정합니다.");
		
		
		vehicleVo.setUpdateUserId(userVo.getId());
		vehicleVo.setId("e"+vehicleVo.getId());
		
		//마감 여부 체크
	    if(!menu19Service.checkClosingDate(userVo, vehicleVo.getPayDate())) { 
    	    model.addAttribute("closingDate", true);
	    	return MAINMENU + "/" + SUBMENU + "/add";
	    } else {
		    	//System.out.println("세금계산서" + vehicleVo.getTaxbillNo());
		    	if(vehicleVo.getTaxbillNo()!= "") { //세금계산서 번호 있음
	    		//System.out.println("세금계산서나오면 이상한것" + vehicleVo.getTaxbillNo());
		    	Long vehicleVno = menu41Service.getVoucherNo(vehicleVo.getId());
				
				//System.out.println("전표번호 " + vehicleVno);
				CustomerVo cus = menu41Service.getDepositNo(vehicleVo.getCustomerNo());
				
				VoucherVo voucherVo = new VoucherVo();  //거래처 객체
				List<ItemVo> itemVoList = new ArrayList<ItemVo>(); //차변대변나누기 위해서 배열선언
				ItemVo itemVo = new ItemVo(); //차변대변나누기 위해서 객체선언
				ItemVo itemVo2 = new ItemVo(); //차변대변나누기 위해서 객체선언
				
				
				MappingVo mappingVo = new MappingVo();
				voucherVo.setRegDate(vehicleVo.getPayDate()); // 매입일자
				itemVo.setAmount(vehicleVo.getDeposit());   	// VehicleVo.getAcqPrice() : 거래금액 (보증금)
				itemVo.setAmountFlag("d");      //d: 차변 왼쪽
				itemVo.setAccountNo(1220501L);  //계정과목 : 차량운반구
				itemVoList.add(itemVo);
				
				//대변
				itemVo2.setAmount(vehicleVo.getDeposit());   // VehicleVo.getAcqPrice() : 거래금액 (보증금)
				itemVo2.setAmountFlag("c");   // c: 대변 오른쪽
				itemVo2.setAccountNo(1240501L); //계정과목 : 임차보증금
				itemVoList.add(itemVo2);
			
				
				//매핑테이블
				mappingVo.setVoucherUse("차량 구입 ");
				mappingVo.setSystemCode(vehicleVo.getId());  // 차량 코드번호
				mappingVo.setDepositNo(cus.getDepositNo());  // 계좌번호
				mappingVo.setCustomerNo(vehicleVo.getCustomerNo()); //거래처번호
				mappingVo.setManageNo(vehicleVo.getTaxbillNo());//세금계산서번호
				mappingVo.setBankCode(cus.getBankCode()); //은행코드
				mappingVo.setBankName(cus.getBankName()); //은행명
				mappingVo.setVoucherNo(vehicleVno);
			         
			    voucherVo.setNo(vehicleVno);
			    long voucherNo= menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, userVo);
			    vehicleVo.setVoucherNo(voucherNo);
			    
	    	}
	    	menu41Service.update(vehicleVo); 
	    	
	    return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add"; 
	    }
	}
	
	//삭제기능
	@RequestMapping(value = {"/" + SUBMENU + "/delete" }, method = RequestMethod.POST)
	public String delete(@ModelAttribute VehicleVo vehicleVo,
						 @RequestParam(value="id", required = false) String id,
						 @SessionAttribute("authUser") UserVo userVo,
						 Model model) throws ParseException {
		
				id = "e" + id;
				System.out.println("삭제할 id" + id);
		
				Long voucherNo = menu41Service.getVoucherNo(id);
				List<Long> taxVoucherNo = menu41Service.getTaxVoucherNo(id);
				
			//마감 여부 체크
		    if(!menu19Service.checkClosingDate(userVo, vehicleVo.getPayDate())) { 
	
	    	    model.addAttribute("closingDate", true);
		    	return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add";
		    } else {
	
				  if(voucherNo != 0) {

					  //전표삭제 
					  List<VoucherVo> voucherVolist = new ArrayList<VoucherVo>(); 
					  VoucherVo v = new VoucherVo(); 
					  v.setRegDate(vehicleVo.getPayDate()); // 매입일자
					  v.setNo(voucherNo); 
					  voucherVolist.add(v);
					  menu03Service.deleteVoucher(voucherVolist, userVo); 
				  
					  for(Long no : taxVoucherNo) {
						  System.out.println("나는 NO다 " + no);
						  v.setNo(no);
						  voucherVolist.add(v);
						  menu03Service.deleteVoucher(voucherVolist, userVo); 
					  }
				  }
				 
				//삭제한 사람도 남길때 set무엇으로 하는게 적당한지 모르겠음
				//vehicleVo.setUpdateUserId(userVo.getId());
				System.out.println("삭제할때 필요한 id" + id);
				menu41Service.delete(id); //vehicle
				menu41Service.deleteTaxbill(id);//taxbill
				return "redirect:/" + MAINMENU + "/" + SUBMENU  + "/add";
		    }
	}
	
	//세금 계산서 차량 테이블 수정 기능 + 세금계산서 모달창 세금계산서 삽입기능
	@RequestMapping(value = { "/" + SUBMENU + "/segum" }, method = RequestMethod.POST)
	public String taxbill(@ModelAttribute TaxbillVo taxbillVo, @AuthUser UserVo userVo,
						  @RequestParam(value="depositPop") String deposit2, //보증금
						  @RequestParam(value="monthlyFeePop") String monthlyFee2, //월 사용료
						  @RequestParam(value="bonapil") String bonapil, // 예정 보증금 납부일
						  @RequestParam(value="walnapil") String walnapil, //예정 월 사용료 납부일 
						  @RequestParam(value="cusNo") String customerNo, //거래처 번호
						  @RequestParam(value="gubun" ) String gubun,
						  @RequestParam(value="id", required = false) String id
						  ) {
		
		id = "e" + id;
		deposit2=deposit2.replace(",", "");
		Long deposit = Long.parseLong(deposit2);
		
		monthlyFee2=monthlyFee2.replace(",", "");
		Long monthlyFee = Long.parseLong(monthlyFee2);
		
		System.out.println("cusNo : " + customerNo);
		
		System.out.println("차량코드" +taxbillVo.getVehicleNo() );
		taxbillVo.setInsertUserid(userVo.getId());
		String taxno = taxbillVo.getTaxbillNoPoP();
		String veno = taxbillVo.getVehicleNo();
		
		
		
		// 전표 관련
		CustomerVo cus = menu41Service.getDepositNo(customerNo); // 거래처관련 정보 : 계좌번호, 은행코드, 은행명
		VoucherVo voucherVo = new VoucherVo();  //거래처 객체
		List<ItemVo> itemVoList = new ArrayList<ItemVo>(); //차변대변나누기 위해서 배열선언
		ItemVo itemVo = new ItemVo(); //차변대변나누기 위해서 객체선언
		ItemVo itemVo2 = new ItemVo(); //차변대변나누기 위해서 객체선언
		MappingVo mappingVo = new MappingVo();
		String cardNo = menu05Service.getCardNo(cus.getDepositNo()); //카드번호 가져올 변수
		//---

		//왼쪽 : 얻은것(차변) 차량 가격  :::: 오른쪽(대변)  현금   가격 
		

		if(gubun.equals("보증금")) {
			System.out.println("보증금");
			
			taxbillVo.setDueDate(bonapil);
			taxbillVo.setPay(deposit);
			voucherVo.setRegDate(bonapil); //
			
			
			itemVo.setAmount(deposit);   	// VehicleVo.getAcqPrice() : 거래금액 (보증금)
			itemVo.setAmountFlag("d");      //d: 차변 왼쪽
			itemVo.setAccountNo(1240501L);  //계정과목 : 임차보증금
			itemVoList.add(itemVo);
			
			//대변
			itemVo2.setAmount(deposit);   // VehicleVo.getAcqPrice() : 거래금액 (보증금)
			itemVo2.setAmountFlag("c");   // c: 대변 오른쪽
			itemVo2.setAccountNo(1110103L); //계정과목 : 보통예금
			itemVoList.add(itemVo2);
			mappingVo.setVoucherUse("보증금 납입 ");
			
			//매핑테이블
			mappingVo.setSystemCode(taxbillVo.getVehicleNo());  // 차량 코드번호
			mappingVo.setDepositNo(cus.getDepositNo());  // 계좌번호
			mappingVo.setCustomerNo(customerNo); //거래처번호
			mappingVo.setManageNo(taxbillVo.getTaxbillNoPoP());//세금계산서번호
			mappingVo.setBankCode(cus.getBankCode()); //은행코드
			mappingVo.setBankName(cus.getBankName()); //은행명

			
		}else if(gubun.equals("월사용료")) {
			System.out.println("월사용료");
			taxbillVo.setDueDate(walnapil);
			taxbillVo.setPay(monthlyFee);
			voucherVo.setRegDate(walnapil);
			

			itemVo.setAmount(monthlyFee);   	// VehicleVo.getAcqPrice() : 거래금액 (월사용료)
			itemVo.setAmountFlag("d");      //d: 차변 왼쪽
			itemVo.setAccountNo(8140104L);  //계정과목 : 지급임차료 업무 차량
			itemVoList.add(itemVo);
			
			//대변
			itemVo2.setAmount(monthlyFee);   // VehicleVo.getAcqPrice() : 거래금액 (월사용료)
			itemVo2.setAmountFlag("c");   // c: 대변 오른쪽
			itemVo2.setAccountNo(1110103L); //계정과목 : 보통예금
			itemVoList.add(itemVo2);
			mappingVo.setVoucherUse("월사용료 납입 ");
			
			//매핑테이블
			mappingVo.setSystemCode(taxbillVo.getVehicleNo());  // 차량 코드번호
			mappingVo.setDepositNo(cus.getDepositNo());  // 계좌번호
			mappingVo.setCardNo(cardNo); //카드번호
			mappingVo.setCustomerNo(customerNo); //거래처번호
			mappingVo.setManageNo(taxbillVo.getTaxbillNoPoP());//세금계산서번호
			mappingVo.setBankCode(cus.getBankCode()); //은행코드
			mappingVo.setBankName(cus.getBankName()); //은행명

			
		}
		
		Long voucherNo= menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, userVo); //전표입력
		taxbillVo.setVoucherNo(voucherNo); //전표번호 세팅
		
//		menu41Service.updateTax(taxno, veno, voucherNo, userVo.getId());  //차량 테이블 업데이트
		
		menu41Service.taxbill(taxbillVo);   //차량세금 인서트
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU  + "/add";
	}
	
	
	//세금계산서 정보 조회하기 RequestMethod를 GET메소드로
	@ResponseBody
	@RequestMapping(value = "/" + SUBMENU + "/taxinfo" , method = RequestMethod.GET)
	public Map<String, Object> taxlist(@ModelAttribute TaxbillVo taxbillVo, 
									   @RequestParam(value="id", required = false) String id,
									   @RequestParam(value="page", required = false, defaultValue = "1") int page,
									   @RequestParam(value="page_group", required = false, defaultValue = "0") int page_group,
									   Model model) {
		id = "e" + id;
		//조회기능 
		Map<String, Object> map = new HashMap<>();
		map.putAll(menu41Service.selectTaxList(id)); // 차량코드의 전체 세금계산서
		map.putAll(menu41Service.selectpageTaxList(id, page));// 차량코드의 해당 페이지 세금계산서 12개씩
		map.putAll(menu41Service.selectgroupTaxList(id, page_group));// 차량코드의 해당 그룹 페이지 세금계산서 5개씩
		model.addAllAttributes(map);

		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/" + SUBMENU + "/taxcount" , method = RequestMethod.GET)
	public int taxcount(@RequestParam(value="id", required = false) String id) {
		int count = menu41Service.taxcount(id);
		
		System.out.println(count);
		
		return count;
	}
}
