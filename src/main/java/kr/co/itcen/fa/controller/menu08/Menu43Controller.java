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

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu08.Menu43Service;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu08.IntangibleAssetsVo;
import kr.co.itcen.fa.vo.menu08.PurposeVo;

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

	@Autowired
	private Menu19Service menu19Service;

	// main page
	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model, @RequestParam(value = "kwd", required = false, defaultValue = "") String kwd) {
		// 대분류코드, 거래처명 리스트
		Map<String, Object> map = new HashMap<>();
		map.putAll(menu43Service.getSection());
		map.putAll(menu43Service.getCustomer());
		map.putAll(menu43Service.getPurpose());
		model.addAllAttributes(map);

		// 품목코드로 조회
		if (kwd != null) {
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
			@SessionAttribute("authUser") UserVo user,
			@RequestParam(value = "taxbillNo", required = false) String taxbillNo,
			@RequestParam(value = "customerNo", required = false) String customerNo, Model model)
			throws ParseException {
		intangibleAssetsVo.setInsertUserId(user.getId()); // session값으로 사용자 id가져오기

		// 마감 여부 체크
		if (!menu19Service.checkClosingDate(user, intangibleAssetsVo.getPayDate())) { // 매입일자 가져오기
			model.addAttribute("closingDate", true);
			return "redirect:/" + MAINMENU + "/" + SUBMENU;
		} else { // 입력 가능!
			menu43Service.insert(intangibleAssetsVo);
			return "redirect:/" + MAINMENU + "/" + SUBMENU;
		}
	}

	// 무형자산 항목 수정 : U
	@RequestMapping(value = { "/" + SUBMENU + "/update" }, method = RequestMethod.POST)
	public String update(@ModelAttribute IntangibleAssetsVo intangibleAssetsVo,
			@SessionAttribute("authUser") UserVo user,
			@RequestParam(value = "taxbillNo", required = false) String taxbillNo,
			@RequestParam(value = "customerNo", required = false) String customerNo,
			@RequestParam(value = "purpose", required = false) String purpose) {

		intangibleAssetsVo.setUpdateUserId(user.getId()); // session값으로 사용자 id가져오기
		Long voucherNo = menu43Service.getVoucherNo(intangibleAssetsVo);  // voucherNo는 db에서 직접 가져와야함

		// 전표 등록
		if (taxbillNo != null && voucherNo == null) {

			CustomerVo customerVo = menu43Service.getCustomerInfo(customerNo);

			VoucherVo voucherVo = new VoucherVo();
			List<ItemVo> itemVoList = new ArrayList<ItemVo>();
			MappingVo mappingVo = new MappingVo();

			ItemVo itemVoD = new ItemVo(); // 차변(왼쪽)
			ItemVo itemVoC = new ItemVo(); // 대변(오른쪽)

			// 왼쪽 : 얻은것 무형자산 가격 :::: 오른쪽 계좌 가격
			voucherVo.setRegDate(intangibleAssetsVo.getPayDate());
			intangibleAssetsVo.setVoucherNo(voucherVo.getNo());

			// 차변(d) : 영업권, 특허권, 상표권, 실용신안권, 의장권, 면허권, 개발비, 소프트웨어, 건설중인자산(무형) -> 전표에 등록
			PurposeVo purposeVo = menu43Service.getPurposeInfo(purpose);
			if(!purposeVo.getClassification().equals("산업재산권") && !purposeVo.getClassification().equals("무형자산")) {
				itemVoD.setAccountNo(purposeVo.getAccountNo());
				itemVoD.setAmount((long) (intangibleAssetsVo.getAcqPrice() + intangibleAssetsVo.getAddiFee())); // 취득금액
				itemVoD.setAmountFlag("d");
				itemVoList.add(itemVoD);
			}
			
			// 대변(c) : 현금
			itemVoC.setAmount((long) (intangibleAssetsVo.getAcqPrice() + intangibleAssetsVo.getAddiFee())); // 취득금액 +
																											// 부대비용
			itemVoC.setAmountFlag("c");
			itemVoC.setAccountNo(1110101L); // 계정과목: 현금
			itemVoList.add(itemVoC);

			// 매핑테이블
			mappingVo.setVoucherUse(intangibleAssetsVo.getPurpose()); // 왜 샀는지 적어준다(용도).
			mappingVo.setSystemCode(intangibleAssetsVo.getCode()); // 각 무형자산 코드번호
			mappingVo.setDepositNo(customerVo.getDepositNo()); // 계좌번호
			mappingVo.setBankCode(customerVo.getBankCode()); // 은행 번호
			mappingVo.setBankName(customerVo.getBankName()); // 은행 이름
			mappingVo.setCustomerNo(customerNo); // 거래처번호
			mappingVo.setManageNo(taxbillNo); // 세금계산서 번호

			Long voucher = menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, user);
			intangibleAssetsVo.setVoucherNo(voucher);

		} else if (voucherNo != null) {    // 전표 수정

			CustomerVo customerVo = menu43Service.getCustomerInfo(customerNo);
			
			VoucherVo voucherVo = new VoucherVo();
			List<ItemVo> itemVoList = new ArrayList<ItemVo>();
			MappingVo mappingVo = new MappingVo();

			ItemVo itemVoD = new ItemVo(); // 차변(왼쪽)
			ItemVo itemVoC = new ItemVo(); // 대변(오른쪽)

			// 왼쪽 : 얻은것 무형자산 가격 :::: 오른쪽 계좌 가격
			voucherVo.setRegDate(intangibleAssetsVo.getPayDate());
			intangibleAssetsVo.setVoucherNo(voucherVo.getNo());

			// 차변(d) : 영업권, 특허권, 상표권, 실용신안권, 의장권, 면허권, 개발비, 소프트웨어, 건설중인자산(무형) -> 전표에 등록
			PurposeVo purposeVo = menu43Service.getPurposeInfo(purpose);
			if(!purposeVo.getClassification().equals("산업재산권") && !purposeVo.getClassification().equals("무형자산")) {
				itemVoD.setAccountNo(purposeVo.getAccountNo());
				itemVoD.setAmount((long) (intangibleAssetsVo.getAcqPrice() + intangibleAssetsVo.getAddiFee())); // 취득금액
				itemVoD.setAmountFlag("d");
				itemVoList.add(itemVoD);
			}

			// 대변(c) : 현금
			itemVoC.setAmount((long) (intangibleAssetsVo.getAcqPrice() + intangibleAssetsVo.getAddiFee())); // 취득금액 +
																											// 부대비용
			itemVoC.setAmountFlag("c");
			itemVoC.setAccountNo(1110103L); // 계정과목: 보통예금
			itemVoList.add(itemVoC);

			// 매핑테이블
			mappingVo.setVoucherUse(intangibleAssetsVo.getPurpose()); // 왜 샀는지 적어준다(용도).
			mappingVo.setSystemCode(intangibleAssetsVo.getCode());    // 각 무형자산 코드번호
			mappingVo.setDepositNo(customerVo.getDepositNo());        // 계좌번호
			mappingVo.setBankCode(customerVo.getBankCode());          // 은행 번호
			mappingVo.setBankName(customerVo.getBankName());          // 은행 이름
			mappingVo.setCustomerNo(customerNo);                      // 거래처번호
			mappingVo.setManageNo(taxbillNo);                         // 세금계산서 번호
			mappingVo.setVoucherNo(voucherNo);                        // 전표 번호를 넣어야 수정된 것이 삭제가 됨 
			
			voucherVo.setNo(voucherNo);
			Long updateVoucher = menu03Service.updateVoucher(voucherVo, itemVoList, mappingVo, user);
			intangibleAssetsVo.setVoucherNo(updateVoucher);
		}

		menu43Service.update(intangibleAssetsVo);
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}

	// 무형자산 항목 삭제 : D
	@RequestMapping(value = { "/" + SUBMENU + "/delete" }, method = RequestMethod.POST)
	public String delete(IntangibleAssetsVo intangibleAssetsVo,
			@RequestParam(value = "id", required = false) String id,
			@SessionAttribute("authUser") UserVo user) {

		// 전표 삭제
		Long voucherNo = menu43Service.getVoucherNo(intangibleAssetsVo);  // voucherNo는 db에서 직접 가져와야함
		
		if(voucherNo != null) {
			List<VoucherVo> voucherVo = new ArrayList<VoucherVo>();
			VoucherVo v = new VoucherVo();
			
			v.setNo(voucherNo);
			voucherVo.add(v);
			menu03Service.deleteVoucher(voucherVo, user);
		}

		menu43Service.delete(id);
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}

}
