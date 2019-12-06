package kr.co.itcen.fa.controller.menu11;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import kr.co.itcen.fa.service.menu11.Menu50Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;

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
			@ModelAttribute PdebtVo pdebtVo, 
			@AuthUser UserVo userVo) throws ParseException {
		pdebtVo.setInsertId(userVo.getId()); // 등록자 아이디 삽입
		
		DateFormat convertDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String deptExpDate = pdebtVo.getDebtExpDate(); // dateRangePicker에서 받아온 차입일자와 만기일자를 나누기 위해 변수 이용
		pdebtVo.setDebtDate(convertDateFormat.parse(deptExpDate.substring(0, 10))); // 차입일자 date format으로 변경
		pdebtVo.setExpDate(convertDateFormat.parse(deptExpDate.substring(13))); // 만기일자 date format으로 변경
		
		// 위험등급코드 및 위험등급명 나누어서 데이터베이스에 전달
		String dangerCode = pdebtVo.getDangerCode(); // 위험등급코드 가져오기
		String[] dangerArray = dangerCode.split("-");
		pdebtVo.setDangerCode(dangerArray[0]);
		pdebtVo.setDangerName(dangerArray[1]);
		
		Long money = (long) (pdebtVo.getDebtAmount() * pdebtVo.getIntRate() / 100);
		pdebtVo.setIntAmount(money);
		
		// 박은 값
		pdebtVo.setRepayBal(pdebtVo.getDebtAmount()); // 상환잔액을 차입금액으로 초기화
		pdebtVo.setDepositNo("123-123-1"); // 1팀값 참조
		pdebtVo.setAccountNo("110-123-123123"); // 1팀값 참조
		pdebtVo.setVoucherNo(1);
		
		System.out.println("pdebtVo : " + pdebtVo.toString());

		menu50Service.insert(pdebtVo); // 데이터베이스에 데이터 삽입
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	@RequestMapping(value = "/"+SUBMENU+"/update", method = RequestMethod.POST)
	public String update(
			PdebtVo pdebtVo,
			@AuthUser UserVo userVo) throws ParseException{
		System.out.println("update pdebtVo.toString() : " + pdebtVo.toString());
		
		DateFormat convertDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String deptExpDate = pdebtVo.getDebtExpDate(); // dateRangePicker에서 받아온 차입일자와 만기일자를 나누기 위해 변수 이용
		pdebtVo.setDebtDate(convertDateFormat.parse(deptExpDate.substring(0, 10))); // 차입일자 date format으로 변경
		pdebtVo.setExpDate(convertDateFormat.parse(deptExpDate.substring(13))); // 만기일자 date format으로 변경
		pdebtVo.setUpdateId(userVo.getId()); // 수정자 아이디 삽입
		
		Long money = (long) (pdebtVo.getDebtAmount() * pdebtVo.getIntRate() / 100);
		pdebtVo.setIntAmount(money);
		
		menu50Service.update(pdebtVo);
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	@RequestMapping(value = "/" + SUBMENU + "/delete", method = RequestMethod.POST)
	public String delete(@RequestParam Long[] no) {
		menu50Service.delete(no);
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}

}
