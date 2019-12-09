package kr.co.itcen.fa.controller.menu08;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu08.Menu41Service;
import kr.co.itcen.fa.vo.UserVo;
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
	private Menu03Service menu03Service;
	
	@Autowired
	private Menu41Service menu41Service;


	//               /08   /   41     , /08/41/add
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String list(
			Model model,
			@RequestParam(value="id", required = false) String id ) {
		//menu41Service.test();
		/*
		 *   JSP
		 *   08/41/add.jsp
		 * 
		 */
		

		Map<String, Object> map = new HashMap<>();

		//if 조회기능 else 검색기능
		if(id == null) {			
			map.putAll(menu41Service.selectList());
		}else {
			map.putAll(menu41Service.search(id));
		}
		model.addAllAttributes(map);

		
		//대분류 select box
		map.putAll(menu41Service.getSection());
		model.addAllAttributes(map);

		//직급 select box
		map.putAll(menu41Service.getName());
		model.addAllAttributes(map);
		
		//거래처코드 select box
		map.putAll(menu41Service.getCustomer());
		model.addAllAttributes(map);

		return MAINMENU + "/" + SUBMENU + "/add";
	}

	
	//등록기능
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/insert" }, method = RequestMethod.POST)
	public String insert(@ModelAttribute VehicleVo vehicleVo, @AuthUser UserVo userVo){
		/*
		 * if(vehicleVo.getId() !=null || vehicleVo.getSectionNo() !=null ||
		 * vehicleVo.getClassification() !=null || vehicleVo.getTaxbillNo() !=null ||
		 * vehicleVo.getStaffName() !=null ) {
		 * 
		 * }
		 */
		System.out.println(vehicleVo.getCustomerNo());
		vehicleVo.setInsertUserId(userVo.getId());
		vehicleVo.setId("e"+vehicleVo.getId());
		menu41Service.insert(vehicleVo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU  + "/add";
	}

	//수정기능
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/update" }, method =RequestMethod.POST) 
	public String update(@ModelAttribute VehicleVo vehicleVo, @AuthUser UserVo userVo){
		
		vehicleVo.setUpdateUserId(userVo.getId());
		System.out.println(vehicleVo);
		menu41Service.update(vehicleVo); 
		return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add"; 
	}
	
	//수정

//	@RequestMapping(value={"/" + SUBMENU + "/update" }, method=RequestMethod.POST)
//	public String update(@ModelAttribute VehicleVo vehicleVo , @AuthUser UserVo user
//						 ,@RequestParam(value="taxbillNo", required=false) String taxbillNo
//						 ,@RequestParam(value="customerNo", required=false) String customerNo) {
//
//		
//
//		vehicleVo.setUpdateUserId(user.getId());

		

		
		//예외처리
//		if(vehicleVo.getCombineNo() == null) {
//			landVo.setCombineNo("00");
//
//		}

		
		/*
		// 전표 시작
		if(taxbillNo!=null) {
		String depositNo = menu41Service.getDepositNo(customerNo);
		
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();

 

		

		 //왼쪽 : 얻은것(차변) 토지 가격  :::: 오른쪽(대변)  현금   가격 

		
		//거래금액
		MappingVo mappingVo = new MappingVo();

		//토지
		voucherVo.setRegDate(vehicleVo.getPayDate()); // landVo.getPayDate() : 거래날짜
		itemVo.setAmount(vehicleVo.getAcqPrice()+landVo.getAcqTax()+landVo.getRegTax()+landVo.getEtcCost());  // landVo.getAcqPrice() : 거래금액 (토지를 얻기 위해 세금을 포함한 금액)
		itemVo.setAmountFlag("d");     //d: 차변 왼쪽
		itemVo.setAccountNo(1220101L); //계정과목 : 자산인가 토지인가
		itemVoList.add(itemVo);

 

		itemVo2.setAmount(landVo.getAcqPrice()+landVo.getAcqTax()+landVo.getRegTax()+landVo.getEtcCost());
		itemVo2.setAmountFlag("c");  // c: 대변 오른쪽
		itemVo2.setAccountNo(1110101L);
		itemVoList.add(itemVo2);

 

		// 토지구입비용 + 부가세 = 지불금액 / 차변 대변 값으로

 

		//매핑테이블
		mappingVo.setVoucherUse("투자");  // 왜 샀는지 적어준다.
		mappingVo.setSystemCode(vehicleVo.getId());  // 각 차량 코드번호
		mappingVo.setDepositNo(depositNo);  // 계좌번호
		mappingVo.setCustomerNo(customerNo); //거래처번호
		mappingVo.setManageNo(taxbillNo);//세금ㄱㅔ산서번호

 

		long voucherNo= menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, user);
		vehicleVo.setVoucherNo(voucherNo);
		}
		menu09Service.updateLand(landVo);
		*/

//		menu41Service.update(vehicleVo); 
//
//		
//
//		return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add";
//
//	}
//	
	
	//삭제기능
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/delete" }, method = RequestMethod.POST)
	public String delete(@ModelAttribute VehicleVo vehicleVo, @RequestParam(value="id") String id, @AuthUser UserVo userVo ) {
		
		//삭제한 사람도 남길때 set무엇으로 하는게 적당한지 모르겠음
		vehicleVo.setUpdateUserId(userVo.getId());
		menu41Service.delete(id);
		return "redirect:/" + MAINMENU + "/" + SUBMENU  + "/add";
	}
	

}
