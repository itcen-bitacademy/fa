package kr.co.itcen.fa.controller.menu01;


import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;


/**
 * 
 * @author 임성주
 * 전표관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu03Controller.MAINMENU)
public class Menu03Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "03";

	@Autowired
	private Menu03Service menu03Service;
	
	@Autowired
	private Menu19Service menu19Service;
	
	// 전표관리 페이지
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/read" })
	public String view(@ModelAttribute VoucherVo voucherVo, @RequestParam(defaultValue = "1") int page, Model model) {
		System.out.println("여기 1");
		System.out.println("getUseYn1 : " + voucherVo.getUseYn() );
		if(voucherVo.getUseYn() == null) {
			voucherVo.setUseYn(true);
			System.out.println("왜 안타니");
		}
		System.out.println("getUseYn2 : " + voucherVo.getUseYn() );
		// 전표 검색
		DataResult<VoucherVo> dataResult = menu03Service.selectVoucherCount(voucherVo, page);
		
		// 계정조회
		model.addAttribute("accountList", menu03Service.getAllAccountList());
		
		// 데이블 셋팅
		model.addAttribute("dataResult", dataResult);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// 전표 작성 & 리스트 반환
	@RequestMapping(value= "/" + SUBMENU + "/add", method=RequestMethod.POST)
	public String voucherWrite(@ModelAttribute VoucherVo voucherVo, @AuthUser UserVo userVo, @RequestParam(defaultValue = "1") int page
			, Model model) throws ParseException {
		// 마감 여부 체크
		
		System.out.println("asdf: " + voucherVo.getRegDate());
		//String businessDateStr = menu03Service.businessDateStr();
		if(menu19Service.checkClosingDate(userVo, voucherVo.getRegDate())) {
			voucherVo.setOrderNo(1);
			menu03Service.createVoucher(voucherVo, userVo);
		}
		// 전표등록, 리스트
		DataResult<VoucherVo> dataResult = menu03Service.selectAllVoucherCount(page);
		model.addAttribute("dataResult", dataResult);
		return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/read";
	}
	
	// 전표 삭제 1팀
	@RequestMapping(value = "/" + SUBMENU + "/delete", method=RequestMethod.POST)
	public String delete(@ModelAttribute VoucherVo voucherVo, @AuthUser UserVo userVo) throws ParseException {
		System.out.println("delete");
		System.out.println(voucherVo.getInsertTeam());
		System.out.println(voucherVo.getInsertTeam().equals(userVo.getTeamName()));
		System.out.println("voucherNo : " + voucherVo.getNo());
		System.out.println("regDate : " + voucherVo.getRegDate());
		if(!voucherVo.getInsertTeam().equals(userVo.getTeamName())) {
			return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/read";
		}
		System.out.println("delete2");
		//String businessDateStr = menu03Service.businessDateStr();
		
		voucherVo.setRegDate(menu03Service.getRegDate(voucherVo));
		
		if(menu19Service.checkClosingDate(userVo, voucherVo.getRegDate())) {
			menu03Service.deleteVoucher(voucherVo);
		}
		
		return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/read";
	}
	
//	// 전표 수정 1팀
//	@RequestMapping(value = "/" + SUBMENU + "/update", method=RequestMethod.POST)
//	public String update(@ModelAttribute VoucherVo voucherVo, @AuthUser UserVo userVo) throws ParseException {
//		voucherVo.setUpdateUserid(userVo.getId());
//		if(!voucherVo.getInsertTeam().equals(userVo.getTeamName())) {
//			return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/read";
//		}
//		System.out.println("orderNo : " + voucherVo.getOrderNo());
//		if(menu19Service.checkClosingDate(userVo, voucherVo.getRegDate())) {
//			menu03Service.updateVoucher(voucherVo);
//		}
//		
//		return "redirect:/"+ MAINMENU + "/" + SUBMENU + "/read";
//	}
	
	// 거래처, 은행, 계좌, 카드 조회
	@ResponseBody
	@RequestMapping(value = "/" + SUBMENU + "/getCustomer", method=RequestMethod.GET)
	public Map<String, Object> customerList(@RequestParam String customerNo) {
		Map<String, Object> data = menu03Service.getCustomer(customerNo);
		data.put("success", true);
		return data;
	}
	
	// 전표 추가
	@ResponseBody
	@RequestMapping(value = "/" + SUBMENU + "/save", method=RequestMethod.POST)
	public Map<String, Object> save(HttpServletRequest request, @AuthUser UserVo userVo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String itemList = request.getParameter("itemList");
		System.out.println(itemList);
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			VoucherVo[] voucherList = mapper.readValue(itemList, VoucherVo[].class);
//			System.out.println(voucherList);
			System.out.println(voucherList[0]);
			System.out.println(voucherList[0].getOrderNo());
//			System.out.println(voucherList[1]);
//			System.out.println(voucherList[1].getAccountName());
			
			if(menu19Service.checkClosingDate(userVo, voucherList[0].getRegDate())) {
				VoucherVo voucherVo = new VoucherVo();
				voucherVo.setRegDate(voucherList[0].getRegDate());
				voucherVo.setInsertUserid(userVo.getId());
				
				List<ItemVo> itemList2 = new ArrayList<ItemVo>();
				List<MappingVo> mappingList = new ArrayList<MappingVo>();
				
				for(int i = 0; i < voucherList.length; i++) {
					ItemVo itemVo = new ItemVo();
					itemVo.setAmount(voucherList[i].getAmount());
					System.out.println("amount : " + itemVo.getAmount());
					itemVo.setAmountFlag(voucherList[i].getAmountFlag());
					itemVo.setAccountNo(voucherList[i].getAccountNo());
					itemVo.setInsertUserid(userVo.getId());
					itemVo.setOrderNo(voucherList[i].getOrderNo());
					itemList2.add(itemVo);
				
					MappingVo mappingVo = new MappingVo();
					mappingVo.setVoucherUse(voucherList[i].getVoucherUse());
					mappingVo.setCustomerNo(voucherList[i].getCustomerNo());
					mappingVo.setDepositNo(voucherList[i].getDepositNo());
					mappingVo.setManageNo(voucherList[i].getManageNo());
					mappingVo.setCardNo(voucherList[i].getCardNo());
					mappingVo.setInsertTeam(userVo.getTeamName());
					mappingVo.setInsertUserid(userVo.getId());
					mappingVo.setOrderNo(voucherList[i].getOrderNo());
					
					mappingList.add(mappingVo);
				}
				System.out.println("controller");
				menu03Service.createVoucher(voucherVo, itemList2, mappingList, userVo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("111");
		return resultMap;
	}
	
	// 전표번호로 전표정보 조회하기
	@ResponseBody
	@RequestMapping(value = "/" + SUBMENU + "/getVoucher", method=RequestMethod.GET)
	public Map<String, Object> voucherList(@RequestParam Long voucherNo) {
		System.out.println("voucherNo : " + voucherNo);
		System.out.println(voucherNo);
		Map<String, Object> data = menu03Service.getVoucher(voucherNo);
		data.put("success", true);
		return data;
	}
	
	// 1팀 전표 수정 최종
	@ResponseBody
	@RequestMapping(value = "/" + SUBMENU + "/update", method=RequestMethod.POST)
	public Map<String, Object> update(HttpServletRequest request, @AuthUser UserVo userVo) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String itemList = request.getParameter("itemList");
		System.out.println(itemList);
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			VoucherVo[] voucherList = mapper.readValue(itemList, VoucherVo[].class);
			
			
			String insertTeam = menu03Service.selectTeam(voucherList[0].getNo());
			System.out.println("insertTeam : " + insertTeam);
			System.out.println(insertTeam);
			
			if(!insertTeam.equals(userVo.getTeamName())) {
				return null;
			}
			
			if(menu19Service.checkClosingDate(userVo, voucherList[0].getRegDate())) {
				VoucherVo voucherVo = new VoucherVo();
				voucherVo.setNo(voucherList[0].getNo());
				voucherVo.setUpdateUserid(userVo.getId());
				voucherVo.setRegDate(voucherList[0].getRegDate());
				voucherVo.setInsertUserid(userVo.getId());
				
				List<ItemVo> itemList2 = new ArrayList<ItemVo>();
				List<MappingVo> mappingList = new ArrayList<MappingVo>();
				
				for(int i = 0; i < voucherList.length; i++) {
					ItemVo itemVo = new ItemVo();
					itemVo.setAmount(voucherList[i].getAmount());
					System.out.println("amount : " + itemVo.getAmount());
					itemVo.setAmountFlag(voucherList[i].getAmountFlag());
					itemVo.setAccountNo(voucherList[i].getAccountNo());
					itemVo.setUpdateUserid(userVo.getId());
					itemVo.setOrderNo(voucherList[i].getOrderNo());
					itemList2.add(itemVo);
				
					MappingVo mappingVo = new MappingVo();
					mappingVo.setVoucherUse(voucherList[i].getVoucherUse());
					mappingVo.setCustomerNo(voucherList[i].getCustomerNo());
					mappingVo.setDepositNo(voucherList[i].getDepositNo());
					mappingVo.setManageNo(voucherList[i].getManageNo());
					mappingVo.setCardNo(voucherList[i].getCardNo());
					mappingVo.setUpdateUserid(userVo.getId());
					mappingVo.setOrderNo(voucherList[i].getOrderNo());
					mappingVo.setInsertTeam(insertTeam);
					
					mappingList.add(mappingVo);
				}
				System.out.println("controller");
				
				menu03Service.updateVoucher(voucherVo, itemList2, mappingList, userVo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("111");
		return resultMap;
	}
	
	
}