package kr.co.itcen.fa.controller.menu11;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu11.Menu50Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;

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

	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String list(
			Model model,
			@RequestParam(value = "code", required = false, defaultValue = "") String code,
			@RequestParam(value = "financialYear", required = false, defaultValue = "2019") String year,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
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
	@RequestMapping(value = "/" + SUBMENU + "/insert", method = RequestMethod.POST)
	public String insert(
			@ModelAttribute PdebtVo vo, 
			@AuthUser UserVo userVo) {
		System.out.println("50controller vo 1 : " + vo.toString());
		
//		Long intDebtAmount = 0L;
//		// 차입금액 콤마제거
//		if (convertDebtAmount.endsWith(",")) {
//			convertDebtAmount = convertDebtAmount.substring(0, convertDebtAmount.length() - 1);
//			intDebtAmount = Long.parseLong(convertDebtAmount);
//			vo.setDebtAmount(intDebtAmount);
//		}
		
		System.out.println("50controller vo 2 : " + vo.toString());
		vo.setInsertId(userVo.getId()); // 등록자 아이디 삽입
		
		String deptExpDate = vo.getDebtExpDate(); // dateRangePicker에서 받아온 차입일자와 만기일자를 나누기 위해 변수 이용
		String saveDeptDate = deptExpDate.substring(0, 10);
		String saveExpDate = deptExpDate.substring(13);
		vo.setDebtDate(saveDeptDate);
		vo.setExpDate(saveExpDate);
		
		// 위험등급코드 및 위험등급명 나누어서 데이터베이스에 전달
		String dangerCode = vo.getDangerCode(); // 위험등급코드 가져오기
		String[] dangerArray = dangerCode.split("-");
		vo.setDangerCode(dangerArray[0]);
		vo.setDangerName(dangerArray[1]);
		
		Long money = (long) (vo.getDebtAmount() * vo.getIntRate() / 100);
		vo.setIntAmount(money);
		vo.setAccountNo("11-11-111");
		
		/////////////////////////////////////
		//전표등록
		
		//객체 생성
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		ItemVo itemVo3 = new ItemVo();

		MappingVo mappingVo = new MappingVo();

		voucherVo.setRegDate(vo.getDebtDate());
		itemVo.setAmount(vo.getDebtAmount());
		itemVo.setAmountFlag("c");
		itemVo.setAccountNo(2401000L);
		itemVoList.add(itemVo);

		itemVo2.setAmount(money);
		itemVo2.setAmountFlag("c");
		itemVo2.setAccountNo(9201000L);
		itemVoList.add(itemVo2);

		itemVo3.setAmount(vo.getDebtAmount() + money);
		itemVo3.setAmountFlag("d");
		itemVo3.setAccountNo(1110103L);
		itemVoList.add(itemVo3);

		mappingVo.setVoucherUse(vo.getName());// 사용목적
		mappingVo.setSystemCode(vo.getCode());// 제코드l190
		mappingVo.setDepositNo(vo.getDepositNo());// 계좌번호

		Long no = menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, userVo);

		vo.setVoucherNo(no);

		menu50Service.insert(vo); // 데이터베이스에 데이터 삽입
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	@RequestMapping(value = "/"+SUBMENU+"/update", method = RequestMethod.POST)
	public String update(
			@ModelAttribute PdebtVo vo,
			@AuthUser UserVo userVo) throws ParseException{
		System.out.println(vo.getIntPayWay());
		
		String deptExpDate = vo.getDebtExpDate(); // dateRangePicker에서 받아온 차입일자와 만기일자를 나누기 위해 변수 이용
		String saveDeptDate = deptExpDate.substring(0, 10);
		String saveExpDate = deptExpDate.substring(13);
		vo.setDebtDate(saveDeptDate);
		vo.setExpDate(saveExpDate);
		
		vo.setUpdateId(userVo.getId()); // 수정자 아이디 삽입
		
		Long money = (long) (vo.getDebtAmount() * vo.getIntRate() / 100);
		vo.setIntAmount(money);
		
		vo.setVoucherNo(menu50Service.select(vo.getNo()));
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		ItemVo itemVo3 = new ItemVo();
		
		MappingVo mappingVo = new MappingVo();
		System.out.println("vNo : " + vo.getVoucherNo());
		voucherVo.setNo(vo.getVoucherNo());
		voucherVo.setRegDate(vo.getDebtDate());
		itemVo.setAmount(vo.getDebtAmount());
		itemVo.setAmountFlag("c");
		itemVo.setAccountNo(2401000L);
		itemVo.setVoucherNo(vo.getVoucherNo());
		itemVoList.add(itemVo);
		
		itemVo2.setAmount(money);
		itemVo2.setAmountFlag("c");
		itemVo2.setAccountNo(9201000L);
		itemVo2.setVoucherNo(vo.getVoucherNo());
		itemVoList.add(itemVo2);
		
		itemVo3.setAmount(vo.getDebtAmount()+money);
		itemVo3.setAmountFlag("d");
		itemVo3.setAccountNo(1110103L);
		itemVo3.setVoucherNo(vo.getVoucherNo());
		itemVoList.add(itemVo3);
		
		mappingVo.setVoucherUse(vo.getName());//사용목적
		mappingVo.setSystemCode(vo.getCode());//제코드l190
		mappingVo.setDepositNo(vo.getDepositNo());//계좌번호
		mappingVo.setVoucherNo(vo.getVoucherNo());
		
		menu03Service.updateVoucher(voucherVo, itemVoList, mappingVo, userVo);
		
		menu50Service.update(vo);
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	@RequestMapping(value = "/" + SUBMENU + "/delete", method = RequestMethod.POST)
	public String delete(@RequestParam Long[] no) {
		menu50Service.delete(no);
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	@ResponseBody
	@RequestMapping(value = "/"+SUBMENU+"/repay", method = RequestMethod.POST)
	public JSONResult repay(
			@RequestBody RepayVo vo, 
			@AuthUser UserVo uservo) {
		vo.setInsertId(uservo.getId());
		menu50Service.updateRepayVo(vo);
		menu50Service.insertRepayVo(vo);
		PdebtVo pdebtVo = menu50Service.getOne(vo.getDebtNo());
		if(pdebtVo.getRepayBal() >= pdebtVo.getDebtAmount())
			menu50Service.updateRepayFlag(pdebtVo.getNo());
		return JSONResult.success(pdebtVo);
	}
	
	@ResponseBody
	@RequestMapping("/"+SUBMENU+"/checkcode")
	public JSONResult checkCode(
			@RequestParam(value="code", required=true, defaultValue="") String code) {
		PdebtVo pdebtVo = menu50Service.existCode(code);
		System.out.println(pdebtVo);
        return JSONResult.success(pdebtVo);
	}

}
