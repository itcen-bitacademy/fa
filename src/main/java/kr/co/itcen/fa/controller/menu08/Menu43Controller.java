package kr.co.itcen.fa.controller.menu08;

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

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu08.Menu43Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu08.IntangibleAssetsVo;

/**
 * 
 * @author 김유진
 * 
 *         무형자산관리
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu43Controller.MAINMENU)
public class Menu43Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "43";

	@Autowired
	private Menu43Service menu43Service;
	
	@Autowired
	private Menu03Service menu03Service;

	// main page
	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model,
			@RequestParam(value = "kwd", required = false, defaultValue = "") String kwd) {
		// 대분류코드, 거래처명 리스트
		Map<String, Object> map = new HashMap<>();
		map.putAll(menu43Service.getSection());
		map.putAll(menu43Service.getCustomer());
		model.addAllAttributes(map);
		
		// 품목코드로 조회
		if(kwd != null) {
			List<IntangibleAssetsVo> list = menu43Service.getList(kwd);
			model.addAttribute("kwd", kwd);
			model.addAttribute("list", list);
			
			return MAINMENU + "/" + SUBMENU + "/add";
		}
		
		kwd = null;
		List<IntangibleAssetsVo> list = menu43Service.getList(kwd);
		model.addAttribute("kwd", kwd);
		model.addAttribute("list", list);
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}

	// 무형자산 등록 : C
	@RequestMapping(value = { "/" + SUBMENU + "/add" }, method = RequestMethod.POST)
	public String insert(@ModelAttribute IntangibleAssetsVo intangibleAssetsVo,
			@AuthUser UserVo user) {
		intangibleAssetsVo.setInsertUserId(user.getId()); // session값으로 사용자 id가져오기
		
		menu43Service.insert(intangibleAssetsVo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	// 무형자산 항목 수정 : U
	@RequestMapping(value = { "/" + SUBMENU + "/update" }, method = RequestMethod.POST)
	public String update(@ModelAttribute IntangibleAssetsVo intangibleAssetsVo,
			@AuthUser UserVo user,
			@RequestParam(value = "taxbillNo", required = false) String taxbillNo,
			@RequestParam(value = "customerNo", required = false) String customerNo) {
		intangibleAssetsVo.setUpdateUserId(user.getId()); // session값으로 사용자 id가져오기
		
		// 전표 시작
	    if(taxbillNo!=null) {
	      
	     CustomerVo customerVo = menu43Service.getCustomerInfo(customerNo);
	         
	     VoucherVo voucherVo = new VoucherVo();
	     List<ItemVo> itemVoList = new ArrayList<ItemVo>();
	     ItemVo itemVoD = new ItemVo();      // 차변(왼쪽)
	     ItemVo itemVoC = new ItemVo();      // 대변(오른쪽)

	     //왼쪽 : 얻은것 무형자산 가격  :::: 오른쪽  계좌 가격 
	     MappingVo mappingVo = new MappingVo();
	      
	     // 차변(d) 무형자산
	     voucherVo.setRegDate(intangibleAssetsVo.getPayDate());
	     itemVoD.setAmount((long) (intangibleAssetsVo.getAcqPrice()+ intangibleAssetsVo.getAddiFee())); // 취득금액 + 부대비용
	     itemVoD.setAmountFlag("d");
	     itemVoD.setAccountNo(1230000L); // 계정과목 : 무형자산
	     itemVoList.add(itemVoD);
	     
	     // 대변(c) 현금
	     itemVoC.setAmount((long) (intangibleAssetsVo.getAcqPrice()+ intangibleAssetsVo.getAddiFee())); // 취득금액 + 부대비용
	     itemVoC.setAmountFlag("c");
	     itemVoC.setAccountNo(1110101L); // 계정과목: 현금
	     itemVoList.add(itemVoC);

	     
	     // 매핑테이블
	     mappingVo.setVoucherUse(intangibleAssetsVo.getPurpose());  // 왜 샀는지 적어준다(용도).
	     mappingVo.setSystemCode(intangibleAssetsVo.getCode());  // 각 무형자산 코드번호
	     mappingVo.setDepositNo(customerVo.getDepositNo());      // 계좌번호
	     mappingVo.setBankCode(customerVo.getBankCode());        // 은행 번호
	     mappingVo.setBankName(customerVo.getBankName());        // 은행 이름
	     mappingVo.setCustomerNo(customerNo); // 거래처번호
	     mappingVo.setManageNo(taxbillNo);    // 세금계산서 번호

	     menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, user);
	      
	     menu43Service.update(intangibleAssetsVo);
		 return "redirect:/" + MAINMENU + "/" + SUBMENU;
	    }
		
		menu43Service.update(intangibleAssetsVo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}

	// 무형자산 항목 삭제 : D
	@RequestMapping(value = { "/" + SUBMENU + "/delete" }, method = RequestMethod.POST)
	public String delete(@RequestParam(value = "id", required = false) String id) {
		menu43Service.delete(id);
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}

}
