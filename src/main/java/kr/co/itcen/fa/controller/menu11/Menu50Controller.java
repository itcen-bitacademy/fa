package kr.co.itcen.fa.controller.menu11;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu11.Menu50Service;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;
import kr.co.itcen.fa.vo.menu12.SalesVo;

/**
 * 
 * @author 박준호 사채관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu50Controller.MAINMENU)
public class Menu50Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "50";

	@Autowired
	private Menu50Service menu50Service;
	
	@Autowired
	private Menu03Service menu03Service;
	
	@Autowired
	private Menu19Service menu19Service;

	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String list(
			Model model,
			@RequestParam(value = "code", required = false, defaultValue = "") String code,
			@RequestParam(value = "financialYear", required = false, defaultValue = "2019") String year,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		System.out.println("50 add controller!!");
		DataResult<PdebtVo> dataResult = menu50Service.list(page, year, code);
		List<SectionVo> sectionlist = menu50Service.selectSection();
		model.addAttribute("dataResult", dataResult);
		model.addAttribute("sectionlist", sectionlist);
		model.addAttribute("contentsCount", dataResult.getPagination().getTotalCnt()); // 게시물 수
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/list" },method = RequestMethod.POST)
	public String list(
			@RequestParam(value="code",required = false, defaultValue = "") String code,
			@RequestParam(value="financialYear",required = false, defaultValue = "2019") int year,
			@RequestParam(value="page", required=false,defaultValue = "1") int page) {
		
		return "redirect:/"+MAINMENU+"/"+SUBMENU + "?financialYear="+year+"&code="+code+"&page"+page;
	}
	
	// 11/50/add.jsp
	@RequestMapping(value = "/" + SUBMENU + "/add", method = RequestMethod.POST)
	public String insert(
			@ModelAttribute PdebtVo vo, 
			@AuthUser UserVo userVo) {
		// 마감 여부 체크
		try {
			vo.setInsertId(userVo.getId()); // 등록자 아이디 삽입

			String deptExpDate = vo.getDebtExpDate(); // dateRangePicker에서 받아온 차입일자와 만기일자를 나누기 위해 변수 이용
			String saveDeptDate = deptExpDate.substring(0, 10);
			String saveExpDate = deptExpDate.substring(13);
			vo.setDebtDate(saveDeptDate); // 차입일자 등록
			vo.setExpDate(saveExpDate); // 만기일지 등록

			// 위험등급코드 및 위험등급명 나누어서 데이터베이스에 전달 - start
			String dangerCode = vo.getDangerCode(); // 위험등급코드 가져오기
			String[] dangerArray = dangerCode.split("-");
			vo.setDangerCode(dangerArray[0]);
			vo.setDangerName(dangerArray[1]);
			// 위험등급코드 및 위험등급명 나누어서 데이터베이스에 전달 - end

			/////////////////////////////////////
			// 전표등록
			// G: 단기차입금
			// H: 장기차입금
			// I: 사채
			// 객체 생성
			if (menu19Service.checkClosingDate(userVo, vo.getDebtDate())) {
				VoucherVo voucherVo = new VoucherVo();
				List<ItemVo> itemVoList = new ArrayList<ItemVo>();
				ItemVo itemVo = new ItemVo();
				ItemVo itemVo2 = new ItemVo();

				MappingVo mappingVo = new MappingVo();
				voucherVo.setRegDate(vo.getDebtDate());

				// 예금
				itemVo.setAmount(vo.getDebtAmount());
				itemVo.setAmountFlag("d"); // 차변 - d : [예금] 자산의 증가 - 내 계좌로 돈이 들어오기 때문에..
				itemVo.setAccountNo(1110103L); // 보통예금 : 1110103
				itemVoList.add(itemVo);

				// 차입금
				itemVo2.setAmount(vo.getDebtAmount()); // 사채차입금액 입력
				itemVo2.setAmountFlag("c"); // 대변 - c : [부채] 부채의 증가 - 빚이 생김
				itemVo2.setAccountNo(2402101L); // 사채 : 계정과목코드 1팀 테이블 tb_account 확인
				itemVoList.add(itemVo2);

				mappingVo.setVoucherUse(vo.getName());// 사용목적
				mappingVo.setSystemCode(vo.getCode());// 시스템코드
				mappingVo.setCustomerNo(vo.getBankCode());
				mappingVo.setDepositNo(vo.getDepositNo());// 계좌번호

				Long no = menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, userVo);
				vo.setVoucherNo(no);
				menu50Service.insert(vo); // 데이터베이스에 데이터 삽입
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	@RequestMapping(value = "/"+SUBMENU+"/update", method = RequestMethod.POST)
	public String update(
			@ModelAttribute PdebtVo vo, 
			@RequestParam String majorCode,
			SalesVo salesVo, 
			@AuthUser UserVo userVo, 
			Model model) throws ParseException {
		// 마감 여부 체크
		try {
			String deptExpDate = vo.getDebtExpDate(); // dateRangePicker에서 받아온 차입일자와 만기일자를 나누기 위해 변수 이용
			String saveDeptDate = deptExpDate.substring(0, 10);
			String saveExpDate = deptExpDate.substring(13);
			vo.setDebtDate(saveDeptDate);
			vo.setExpDate(saveExpDate);
			vo.setUpdateId(userVo.getId()); // 수정자 아이디 삽입
			
			// 위험등급코드 및 위험등급명 나누어서 데이터베이스에 전달 - start
			String dangerCode = vo.getDangerCode(); // 위험등급코드 가져오기
			String[] dangerArray = dangerCode.split("-");
			vo.setDangerCode(dangerArray[0]);
			vo.setDangerName(dangerArray[1]);
			
			System.out.println(vo.getMajorCode());
			System.out.println(vo.getDangerCode());
			vo.setMajorCode(majorCode);

			if (menu19Service.checkClosingDate(userVo, vo.getDebtDate())) {

				vo.setVoucherNo(menu50Service.select(vo.getNo()));
				VoucherVo voucherVo = new VoucherVo();
				List<ItemVo> itemVoList = new ArrayList<ItemVo>();
				ItemVo itemVo = new ItemVo();
				ItemVo itemVo2 = new ItemVo();
				MappingVo mappingVo = new MappingVo();

				voucherVo.setNo(vo.getVoucherNo());
				voucherVo.setRegDate(vo.getDebtDate());

				// 예금
				itemVo.setAmount(vo.getDebtAmount()); // 예금
				itemVo.setAmountFlag("d"); // 차변 - d : [예금] 자산의 증가 - 내 계좌로 돈이 들어오기 때문에..
				itemVo.setAccountNo(1110103L); // 보통예금 : 1110103
				itemVo.setVoucherNo(vo.getVoucherNo());
				itemVoList.add(itemVo);

				// 차입금
				itemVo2.setAmount(vo.getDebtAmount()); // 사채차입금액 입력
				itemVo2.setAmountFlag("c"); // 대변 - c : [부채] 부채의 증가 - 빚이 생김
				itemVo2.setAccountNo(2402101L); // 사채 : 계정과목코드 1팀 테이블 tb_account 확인
				itemVo2.setVoucherNo(vo.getVoucherNo());
				itemVoList.add(itemVo2);

				mappingVo.setVoucherUse(vo.getName());// 사용목적
				mappingVo.setSystemCode(vo.getCode());// 제코드l190
				mappingVo.setCustomerNo(vo.getBankCode());
				mappingVo.setDepositNo(vo.getDepositNo());// 계좌번호
				mappingVo.setVoucherNo(vo.getVoucherNo());

				Long no = menu03Service.updateVoucher(voucherVo, itemVoList, mappingVo, userVo);
				vo.setVoucherNo(no);
				menu50Service.update(vo);
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	@RequestMapping(value = "/" + SUBMENU + "/delete", method = RequestMethod.POST)
	public String delete(
			@RequestParam Long[] no, 
			@AuthUser UserVo uservo) throws ParseException {
		List<PdebtVo> pdebtVoList = menu50Service.selectList(no);

		for (int i = 0; i < pdebtVoList.size(); ++i) {
			try {
				if (menu19Service.checkClosingDate(uservo, pdebtVoList.get(i).getDebtDate())) {
					return "redirect:/" + MAINMENU + "/" + SUBMENU;
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		List<Long> list = menu50Service.selectVoucherNo(no);
		List<VoucherVo> voucherVolist = new ArrayList<VoucherVo>();
		
		for (Long no1 : list) {
			VoucherVo v = new VoucherVo();
			v.setNo(no1);
			voucherVolist.add(v);
		}
		
		for (VoucherVo v : voucherVolist) {
			System.out.println(v);
		}

		menu03Service.deleteVoucher(voucherVolist, uservo);
		menu50Service.delete(no);

		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}

}
