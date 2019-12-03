package kr.co.itcen.fa.controller.menu11;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu11.Menu48Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;

/**
 * 
 * @author 김준호
 * 장기차입금관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu48Controller.MAINMENU)
public class Menu48Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "48";
	
	@Autowired
	private Menu48Service menu48Service;
	
	                                   //   /11/48, /11/48/add
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String list(Model model,@RequestParam(value="code",required = false, defaultValue = "") String code,
			@RequestParam(value="financialYear",required = false, defaultValue = "2019") String year,
			@RequestParam(value="page", required=false,defaultValue = "1") int page
			) {
		
		DataResult<LTermdebtVo> dataResult = menu48Service.list(page, year,code);
		
		
		
		model.addAttribute("dataResult",dataResult);
		
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/list" },method = RequestMethod.POST)
	public String list(@RequestParam(value="code",required = false, defaultValue = "") String code,
			@RequestParam(value="financialYear",required = false, defaultValue = "2019") int year,
			@RequestParam(value="page", required=false,defaultValue = "1") int page) {
		
		return "redirect:/"+MAINMENU+"/"+SUBMENU + "?financialYear="+year+"&code="+code+"&page"+page;
	}
	@RequestMapping(value = "/"+SUBMENU+"/add", method = RequestMethod.POST)
	public String add(LTermdebtVo vo,@AuthUser UserVo user) {

		String[] dates=vo.getDebtExpDate().split("-");
		vo.setDebtDate(dates[0]);
		vo.setExpDate(dates[1]);
		vo.setInsertId(user.getId());
		menu48Service.insert(vo);
		return "redirect:/"+MAINMENU+"/"+SUBMENU;
	}
	@RequestMapping(value = "/"+SUBMENU+"/update", method = RequestMethod.POST)
	public String update(LTermdebtVo vo,@AuthUser UserVo user) {
		String[] dates=vo.getDebtExpDate().split("-");
		System.out.println(user);
		vo.setDebtDate(dates[0]);
		vo.setExpDate(dates[1]);
		vo.setUpdateId(user.getId());
		menu48Service.update(vo);
		
		return "redirect:/"+MAINMENU+"/"+SUBMENU;
	}
	@RequestMapping(value = "/"+SUBMENU+"/delete", method = RequestMethod.POST)
	public String delete(@RequestParam Long[] no) {
	
		menu48Service.delete(no);
		
		return "redirect:/"+MAINMENU+"/"+SUBMENU;
	}
}
