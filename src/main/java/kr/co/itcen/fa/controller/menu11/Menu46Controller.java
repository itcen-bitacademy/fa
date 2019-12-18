package kr.co.itcen.fa.controller.menu11;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu11.Menu46Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu11.STermDebtVo;

/**
 * 
 * @author 반현길
 * 단기차입금관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu46Controller.MAINMENU)
public class Menu46Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "46";
	
	@Autowired
	private Menu46Service menu46Service;
	
	//기본
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String add(Model model) {
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	//입력
	@RequestMapping("/" + SUBMENU + "/insert")
	public String insert(STermDebtVo sTermDebtVo, @AuthUser UserVo authUser) throws ParseException {
		String debtExpDate = sTermDebtVo.getDebtExpDate(); // dateRangePicker에서 받아온 차입일자와 만기일자를 나누기 위해 변수 이용
		System.out.println(debtExpDate);
	    String saveDeptDate = debtExpDate.substring(0, 10);
	    String saveExpDate = debtExpDate.substring(13);
	    sTermDebtVo.setDebtDate(saveDeptDate); // 차입일자 등록
	    sTermDebtVo.setExpDate(saveExpDate); // 만기일지 등록
		
		sTermDebtVo.setInsertId(authUser.getId());
		
		//전표입력
		Long voucherNo = menu46Service.insertVoucherWithDebt(sTermDebtVo, authUser);
		
		//차입금 입력
		sTermDebtVo.setVoucherNo(voucherNo);
		menu46Service.insert(sTermDebtVo);
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	//수정
	@RequestMapping("/" + SUBMENU + "/update")
	public String update(STermDebtVo sTermDebtVo, @AuthUser UserVo authUser) throws ParseException {
		String deptExpDate = sTermDebtVo.getDebtExpDate(); // dateRangePicker에서 받아온 차입일자와 만기일자를 나누기 위해 변수 이용
	      String saveDeptDate = deptExpDate.substring(0, 10);
	      String saveExpDate = deptExpDate.substring(13);
	      sTermDebtVo.setDebtDate(saveDeptDate); // 차입일자 등록
	      sTermDebtVo.setExpDate(saveExpDate); // 만기일지 등록
		
		//전표입력
		Long voucherNo = menu46Service.updateVoucherWithDebt(sTermDebtVo, authUser);
		
		//차입금 수정
		sTermDebtVo.setVoucherNo(voucherNo);
		menu46Service.update(sTermDebtVo);
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
}
