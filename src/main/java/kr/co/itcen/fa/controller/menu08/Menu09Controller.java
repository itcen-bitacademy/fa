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
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.security.NoAuth;
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
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String list(Model model, 
						@RequestParam(value="id", required=false, defaultValue = "") String id,
						@RequestParam(value="page", required=false, defaultValue = "1") int page) {
		
		menu09Service.test();
		/*
		 *   JSP
		 *   08/09/list.jsp
		 * 
		 */
		Map<String, Object> map = new HashMap<String, Object>();
		
		//대분류코드 select box
		List<SectionVo> list = menu09Service.getSectionList();
		//거래처관련 select box
		map.putAll(menu09Service.getCustomerCodeList());
		
		//관리 list
//		map.putAll(menu09Service.getLandList());
		
//		if(id != null) {
//			map.putAll(menu09Service.getsearchList(id));		
//		}
		//dataresult 생성, 모델
		DataResult<LandVo> dataResult = menu09Service.list(id, page); 
		model.addAttribute("dataResult",dataResult);
		model.addAttribute("page" , page);
		
		model.addAttribute("sectionList", list);
		model.addAllAttributes(map);
		
		return  MAINMENU + "/" + SUBMENU + "/add";
	}
	
	
	//입력
	@RequestMapping(value={"/" + SUBMENU + "/insert" }, method=RequestMethod.POST)
	public String insert(@ModelAttribute LandVo landVo, @SessionAttribute("authUser") UserVo user
						 ,Model model
						 ) throws ParseException {
		
		//, 빼기
		String acqPrice = landVo.getAcqPrice().replace("," ,"");
		landVo.setAcqPrice(acqPrice);
		
		String publicValue = landVo.getPublicValue().replace("," ,"");
		landVo.setPublicValue(publicValue);
		
		String etcCost = landVo.getEtcCost().replace("," ,"");
		landVo.setEtcCost(etcCost);
		
		String acqTax = landVo.getAcqTax().replace("," ,"");
		landVo.setAcqTax(acqTax);
		
		
		if(landVo.getCombineNo() == null) {
			landVo.setCombineNo("00");
		}

		landVo.setId("c"+landVo.getId());
		landVo.setInsertUserid(user.getId());
		
		System.out.println("들어옵니다.");
		//마감 여부 체크
		if(!menu19Service.checkClosingDate(user, landVo.getPayDate())) {
			model.addAttribute("closingDate", true);
			System.out.println("마감되었습니다.");
			return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add";
		} else {
			menu09Service.insertLand(landVo);
			System.out.println("insert 됩니다.");
			return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add";
		}
	}

	//수정
	@RequestMapping(value={"/" + SUBMENU + "/update" }, method=RequestMethod.POST)
	public String update(@ModelAttribute LandVo landVo , @SessionAttribute("authUser") UserVo user
						 ,@RequestParam(value="taxbillNo", required=false) String taxbillNo
						 ,@RequestParam(value="customerNo", required=false) String customerNo,
						 Model model) throws ParseException {
		
		Long acqPrice = Long.parseLong(landVo.getAcqPrice().replace("," ,""));
		Long publicValue = Long.parseLong(landVo.getPublicValue().replace("," ,""));
		Long etcCost = Long.parseLong(landVo.getEtcCost().replace("," ,""));
		Long acqTax = Long.parseLong(landVo.getAcqTax().replace("," ,""));
		
		landVo.setId("c"+landVo.getId());
		landVo.setUpdateUserid(user.getId());
		
		Long landVno = menu09Service.getVoucherNo(landVo.getId());
		
		if(landVo.getCombineNo() == null) {
			landVo.setCombineNo("00");
		}
		
		//마감 여부 체크
		if(!menu19Service.checkClosingDate(user, landVo.getPayDate())) {
			model.addAttribute("closingDate", true);
			return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add";
			
		} else {
			// 전표 시작
			if(taxbillNo != "" && taxbillNo != null && landVno == null) { //세금계산서번호가 있을때, 전표번호가 없을때
			System.out.println("여기탐 !!");
			System.out.println("taxbillNo" + taxbillNo);
			CustomerVo cus = menu09Service.getDepositNo(customerNo);
			System.out.println(cus);
			
			VoucherVo voucherVo = new VoucherVo();
			List<ItemVo> itemVoList = new ArrayList<ItemVo>();
			ItemVo itemVo = new ItemVo();
			ItemVo itemVo2 = new ItemVo();


			 //왼쪽 : 얻은것(차변) 토지 가격  :::: 오른쪽(대변)  현금   가격 

			//거래금액

			MappingVo mappingVo = new MappingVo();
			//토지
			voucherVo.setRegDate(landVo.getPayDate()); // landVo.getPayDate() : 거래날짜
			itemVo.setAmount(acqPrice+acqTax+etcCost);  // 거래금액 (토지를 얻기 위해 세금을 포함한 금액)
			itemVo.setAmountFlag("d");     //d: 차변 왼쪽
			itemVo.setAccountNo(1220101L); //계정과목 : 자산인가 토지인가
			itemVoList.add(itemVo);

			itemVo2.setAmount(acqPrice+acqTax+etcCost);
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
			System.out.println("매핑브이오---------------------------");
			System.out.println(mappingVo);

			long voucherNo= menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, user);
			landVo.setVoucherNo(voucherNo);
			
			}
			
			landVo.setAcqPrice(Long.toString(acqPrice));
			landVo.setAcqTax(Long.toString(acqTax));
			landVo.setPublicValue(Long.toString(publicValue));
			landVo.setEtcCost(Long.toString(etcCost));
			menu09Service.updateLand(landVo);
			
			return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add";
		}

		
		/*
		 * else if(landVno!=null) { //전표번호가 있을때 수정(전표수정) System.out.println("여기안타냐?");
		 * 
		 * CustomerVo cus = menu09Service.getDepositNo(customerNo);
		 * 
		 * VoucherVo voucherVo = new VoucherVo(); List<ItemVo> itemVoList = new
		 * ArrayList<ItemVo>(); ItemVo itemVo = new ItemVo(); ItemVo itemVo2 = new
		 * ItemVo();
		 * 
		 * MappingVo mappingVo = new MappingVo(); //토지
		 * voucherVo.setRegDate(landVo.getPayDate()); // landVo.getPayDate() : 거래날짜
		 * itemVo.setAmount(landVo.getAcqPrice()+landVo.getAcqTax()+landVo.getEtcCost())
		 * ; // landVo.getAcqPrice() : 거래금액 (토지를 얻기 위해 세금을 포함한 금액)
		 * itemVo.setAmountFlag("d"); //d: 차변 왼쪽 itemVo.setAccountNo(1220101L); //계정과목 :
		 * 자산인가 토지인가 itemVoList.add(itemVo);
		 * 
		 * itemVo2.setAmount(landVo.getAcqPrice()+landVo.getAcqTax()+landVo.getEtcCost()
		 * ); itemVo2.setAmountFlag("c"); // c: 대변 오른쪽 itemVo2.setAccountNo(1110103L);
		 * //현금 itemVoList.add(itemVo2);
		 * 
		 * //매핑테이블 mappingVo.setVoucherUse("투자"); // 왜 샀는지 적어준다.
		 * mappingVo.setSystemCode(landVo.getId()); // 각 토지 코드번호
		 * mappingVo.setDepositNo(cus.getDepositNo()); // 계좌번호
		 * mappingVo.setCustomerNo(customerNo); //거래처번호
		 * mappingVo.setManageNo(taxbillNo);//세금계산서번호
		 * mappingVo.setBankCode(cus.getBankCode()); //은행코드
		 * mappingVo.setBankName(cus.getBankName()); //은행명
		 * mappingVo.setVoucherNo(landVno);
		 * 
		 * voucherVo.setNo(landVno); System.out.println("userTeam :" +
		 * user.getTeamName()); Long voucherNo = menu03Service.updateVoucher(voucherVo,
		 * itemVoList, mappingVo, user); landVo.setVoucherNo(voucherNo); }
		 */

		
		
		
	}
	
	//삭제
	@RequestMapping(value = { "/" + SUBMENU + "/delete" }, method=RequestMethod.POST)
	public String delete(@RequestParam(value="id") String id,
						 @RequestParam(value="payDate") String payDate,
						 @SessionAttribute("authUser") UserVo user, Model model) throws ParseException {
		

		id = "c" + id;
		String userId = user.getId();
		
		Long voucherNo = menu09Service.getVoucherNo(id);
		
		//마감 여부 체크
		if(!menu19Service.checkClosingDate(user, payDate)) {

			model.addAttribute("closingDate", true);
			return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add";
		} else {
			
			if(voucherNo != null) {
				
				//전표삭제
				List<VoucherVo> voucherVolist = new ArrayList<VoucherVo>();
				VoucherVo v = new VoucherVo();
				v.setNo(voucherNo);
				v.setRegDate(payDate);
				voucherVolist.add(v);
				menu03Service.deleteVoucher(voucherVolist, user);
				}
				
				menu09Service.delLand(id, userId);
			
				return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add";
		}
	}
	
}
