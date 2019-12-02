package kr.co.itcen.fa.controller.menu01;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu25Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;


/**
 * 
 * @author 황슬기
 * 계좌관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu25Controller.MAINMENU)
public class Menu25Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "25";

	@Autowired
	private Menu25Service menu25Service;
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model) {
		System.out.println("list");
		menu25Service.test();
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// CRUD
	@RequestMapping("/" + SUBMENU + "/create")
	public String create(@ModelAttribute BankAccountVo bavo,
			@AuthUser UserVo uvo) {
		System.out.println("create");
		
		// InsertDay Data 삽입
		SimpleDateFormat formatter = new SimpleDateFormat ( "yyyy.MM.dd HH:mm:ss", Locale.KOREA );
		Date currentTime = new Date ( );
		String dTime = formatter.format ( currentTime );
		
		// User 정보 넣기 -> getLastUpdate가 내가 원하는기능이면 다시 붙이면됨
		bavo.setInsertUserId(uvo.getName());
		bavo.setInsertDay(dTime);
		
		System.out.println(uvo.getName());
		System.out.println(uvo.getLastUpdate());
		System.out.println(bavo.toString());
		
		menu25Service.create(bavo);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	@RequestMapping("/" + SUBMENU + "/read")
	public String read(@ModelAttribute BankAccountVo bavo	) {
		System.out.println("read");
		menu25Service.test();
		return MAINMENU + "/" + SUBMENU + "/list";
	}

	@RequestMapping("/" + SUBMENU + "/update")
	public String update(@ModelAttribute BankAccountVo bavo) {
		System.out.println("update");
		menu25Service.test();
		return MAINMENU + "/" + SUBMENU + "/list";
	}

	@RequestMapping("/" + SUBMENU + "/delete")
	public String delete(@ModelAttribute BankAccountVo bavo) {
		System.out.println("delete");
		menu25Service.test();
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}