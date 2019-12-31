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
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu08.Menu39Service;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu08.BuildingVo;


/**
 * 
 * @author 김민준
 * 
 * 건물관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu39Controller.MAINMENU)
public class Menu39Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "39";
	
	
	@Autowired
	private Menu39Service menu39Service;
	
	//전표
	@Autowired
	private Menu03Service menu03Service;
	
	//마감일자
	@Autowired
	private Menu19Service menu19Service;
	
	
	//               /08   /   39     , /08/39/add
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String list(Model model, @RequestParam(value="id", required = false, defaultValue = "") String id,
			@RequestParam(value="page", required=false,defaultValue = "1") int page,
			@SessionAttribute("authUser") UserVo authUser) {
		
		//dataresult 생성
		DataResult<BuildingVo> dataResult = menu39Service.list(id, page); 
		model.addAttribute("dataResult",dataResult);
		
		//map 생성
		Map<String, Object> map = new HashMap<>();
		
		//대분류
		map.putAll(menu39Service.getSection());
		model.addAllAttributes(map);
		
		//거래처
		map.putAll(menu39Service.getCustomer());
		model.addAllAttributes(map);
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	//등록(C)
	@RequestMapping(value = "/" + SUBMENU + "/create" , method = RequestMethod.POST)
	public String add(@ModelAttribute BuildingVo buildingvo, @SessionAttribute("authUser") UserVo authUser, Model model) throws ParseException{
				
		//, 빼기
		String acqPrice = buildingvo.getAcqPrice().replace("," ,"");
		buildingvo.setAcqPrice(acqPrice);
		
		String publicValue = buildingvo.getPublicValue().replace("," ,"");
		buildingvo.setPublicValue(publicValue);
		
		String etcCost = buildingvo.getEtcCost().replace("," ,"");
		buildingvo.setEtcCost(etcCost);
		
		String acqTax = buildingvo.getAcqTax().replace("," ,"");
		buildingvo.setAcqTax(acqTax);
		
		if("".equals(buildingvo.getCombineNo())) {
			buildingvo.setCombineNo("-");
		}
		if("".equals(buildingvo.getEtcCost())) {
			buildingvo.setEtcCost("0");
		}
		if("".equals(buildingvo.getSectionNo())) {
			buildingvo.setSectionNo(null);
		}
		if("".equals(buildingvo.getCustomerNo())) {
			buildingvo.setCustomerNo(null);
		}

		buildingvo.setInsertUserid(authUser.getId());
		
		buildingvo.setId("b"+buildingvo.getId());
		
		//마감 여부 체크
	    if(!menu19Service.checkClosingDate(authUser, buildingvo.getPayDate())) {
	    	System.out.println("마감일 이상함");
	    	model.addAttribute("closingDate", true);
	    	return "redirect:/" + MAINMENU + "/" + SUBMENU ;
	    } else {
		    menu39Service.add(buildingvo);
		    return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add";
	    }
	}
	
	//조회(R)
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/search" }, method = RequestMethod.POST)
	public String list(@RequestParam(value="id", required = false, defaultValue = "") String id){
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU + "?id=" + id;
	}
	
	//수정(U)
	@RequestMapping(value = "/" + SUBMENU + "/update" , method = RequestMethod.POST)
	public String update(@ModelAttribute BuildingVo buildingvo, @SessionAttribute("authUser") UserVo authUser,
			@RequestParam(value="taxbillNo", required=false) String taxbillNo
            ,@RequestParam(value="customerNo", required=false) String customerNo
            ,@RequestParam(value="depositNo", required=false) String depositNo
            ,Model model) throws ParseException{
		
		//,빼기
		Long acqPrice = Long.parseLong(buildingvo.getAcqPrice().replace("," ,""));
		Long publicValue = Long.parseLong(buildingvo.getPublicValue().replace("," ,""));
		Long etcCost = Long.parseLong(buildingvo.getEtcCost().replace("," ,""));
		Long acqTax = Long.parseLong(buildingvo.getAcqTax().replace("," ,""));

		buildingvo.setUpdateUserid(authUser.getId());
		
		buildingvo.setId("b"+buildingvo.getId());
		
		Long bVoucherNo = menu39Service.getVoucherNo(buildingvo.getId());
		
		if("".equals(buildingvo.getCombineNo())) {
			buildingvo.setCombineNo("-");
		}
		if("".equals(buildingvo.getEtcCost())) {
			buildingvo.setEtcCost("0");
		}
		if("".equals(buildingvo.getSectionNo())) {
			buildingvo.setSectionNo(null);
		}
		if("".equals(buildingvo.getCustomerNo())) {
			buildingvo.setCustomerNo(null);
		}
		
		//마감 여부 체크
	    if(!menu19Service.checkClosingDate(authUser, buildingvo.getPayDate())) {
	    	System.out.println("마감일 이상함");
	    	model.addAttribute("closingDate", true);
	    	return "redirect:/" + MAINMENU + "/" + SUBMENU ;
	    } else {
			//전표추가
			if (taxbillNo != null && bVoucherNo == null) {
				
				//계좌(계좌번호, 은행코드, 은행이름)정보
				CustomerVo bankInfo = menu39Service.getBankInfo(customerNo);
				
				//전표
				VoucherVo voucherVo = new VoucherVo();
				
				List<ItemVo> itemVoList = new ArrayList<ItemVo>();
				ItemVo itemVo = new ItemVo(); // 차변
				ItemVo itemVo2 = new ItemVo(); // 대변

				// 왼쪽 : 얻은 건물 가격 |||| 오른쪽 : 계좌 가격

				// 거래금액
				MappingVo mappingVo = new MappingVo();
				
				voucherVo.setRegDate(buildingvo.getPayDate()); // buildingvo.getPayDate() : 거래날짜
				
				itemVo.setAmount(acqPrice + acqTax + etcCost); //  거래금액
				itemVo.setAmountFlag("d"); // 차변
				itemVo.setAccountNo(1220201L); //계정과목 : 건물
				itemVoList.add(itemVo);

				itemVo2.setAmount(acqPrice + acqTax + etcCost);
				itemVo2.setAmountFlag("c"); // 대변
				itemVo2.setAccountNo(1110103L); //계정과목 : 보통예끔
				itemVoList.add(itemVo2);

				//매핑테이블
			    mappingVo.setVoucherUse("민준용");  // 사용용도
			    mappingVo.setSystemCode(buildingvo.getId());  // 각 건물코드
			    mappingVo.setDepositNo(bankInfo.getDepositNo());  // 계좌번호
			    mappingVo.setCustomerNo(customerNo); //거래처번호
			    mappingVo.setManageNo(taxbillNo);//세금계산서번호
			    mappingVo.setBankCode(bankInfo.getBankCode()); //은행코드
				mappingVo.setBankName(bankInfo.getBankName()); //은행명
			    
			    //전표추가
			    long voucherNo = menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, authUser);
			    
			    buildingvo.setVoucherNo(voucherNo);
			}
			
			//전표수정
//			else if(bVoucherNo != null) {
//				
//				//계좌(계좌번호, 은행코드, 은행이름)정보
//				CustomerVo bankInfo = menu39Service.getBankInfo(customerNo);
//				
//				System.out.println("계좌, 은행 : " + bankInfo);
//				
//				//전표
//				VoucherVo voucherVo = new VoucherVo();
//				
//				List<ItemVo> itemVoList = new ArrayList<ItemVo>();
//				ItemVo itemVo = new ItemVo(); // 차변
//				ItemVo itemVo2 = new ItemVo(); // 대변
	//
//				// 왼쪽 : 얻은 건물 가격 |||| 오른쪽 : 계좌 가격
	//
//				// 거래금액
//				MappingVo mappingVo = new MappingVo();
//				
//				voucherVo.setRegDate(buildingvo.getPayDate()); // buildingvo.getPayDate() : 거래날짜
//				
//				itemVo.setAmount(buildingvo.getAcqPrice()+buildingvo.getAcqTax()+buildingvo.getEtcCost()); //  거래금액
//				itemVo.setAmountFlag("d"); // 차변
//				itemVo.setAccountNo(1220201L); //계정과목 : 건물
//				itemVoList.add(itemVo);
	//
//				itemVo2.setAmount(buildingvo.getAcqPrice()+buildingvo.getAcqTax()+buildingvo.getEtcCost());
//				itemVo2.setAmountFlag("c"); // 대변
//				itemVo2.setAccountNo(1110101L); //계정과목 : 현금
//				itemVoList.add(itemVo2);
	//
//				//매핑테이블
//			    mappingVo.setVoucherUse("민준용");  // 사용용도
//			    mappingVo.setSystemCode(buildingvo.getId());  // 각 건물코드
//			    mappingVo.setDepositNo(bankInfo.getDepositNo());  // 계좌번호
//			    mappingVo.setCustomerNo(customerNo); //거래처번호
//			    mappingVo.setManageNo(taxbillNo);//세금계산서번호
//			    mappingVo.setVoucherNo(bVoucherNo); //전표번호 매핑
//				
//				voucherVo.setNo(bVoucherNo); //전표vo 에도 번호매핑
//				
//			    //전표수정
//			    long voucherNo= menu03Service.updateVoucher(voucherVo, itemVoList, mappingVo, authUser);
//			    
//			    buildingvo.setVoucherNo(voucherNo);
//			}
			
	    	buildingvo.setAcqPrice(Long.toString(acqPrice));
	    	buildingvo.setPublicValue(Long.toString(publicValue));
	    	buildingvo.setEtcCost(Long.toString(etcCost));
	    	buildingvo.setAcqTax(Long.toString(acqTax));
	    	
	    	menu39Service.modify(buildingvo);
	    	return "redirect:/" + MAINMENU + "/" + SUBMENU + "/add";
	    }
		
	}
	
	//삭제(D)
	@RequestMapping(value = "/" + SUBMENU + "/delete" , method = RequestMethod.POST)
	public String delete(@RequestParam(value="id", required = false, defaultValue = "") String id,
			@SessionAttribute("authUser") UserVo authUser, BuildingVo buildingvo, Model model) throws ParseException{
		
		Long bVoucherNo = menu39Service.getVoucherNo(id);
		
		//전표삭제
		if(bVoucherNo != null) {
			List<VoucherVo> voucherVolist = new ArrayList<VoucherVo>();
			VoucherVo voucherVo = new VoucherVo();
			
			voucherVo.setNo(bVoucherNo); // 수정뒤 전표no >> 전표vo의 no
			voucherVo.setRegDate(buildingvo.getPayDate()); // buildingvo의 매입일자 >> 전표vo의 regdate (마감일자 check)
			voucherVolist.add(voucherVo); // 전표vo의 no >> 전표list의 no
			menu03Service.deleteVoucher(voucherVolist, authUser);
		}
		
		//마감 여부 체크
	    if(!menu19Service.checkClosingDate(authUser, buildingvo.getPayDate())) {
	    	System.out.println("마감일 이상함");
	    	return MAINMENU + "/" + SUBMENU + "/add";
	    } else {
	    	model.addAttribute("closingDate", true);
	    	menu39Service.delete(id);
		    return "redirect:/" + MAINMENU + "/" + SUBMENU;
	    }
	}

}
