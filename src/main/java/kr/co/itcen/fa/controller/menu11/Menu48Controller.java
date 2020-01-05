package kr.co.itcen.fa.controller.menu11;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu11.Menu48Service;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
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
	
	
	@Autowired
	private Menu19Service menu19Service;
	
	                                   //   /11/48, /11/48/add
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String list(Model model,@RequestParam(value="code",required = false, defaultValue = "") String code,
			@RequestParam(value="financialYear",required = false, defaultValue = "") String year,
			@RequestParam(value="page", required=false,defaultValue = "1") int page
			) {
		
		DataResult<LTermdebtVo> dataResult = menu48Service.list(page, year,code);
		List<SectionVo> sectionlist = menu48Service.selectSection();
		
		
		model.addAttribute("dataResult",dataResult);
		model.addAttribute("code",code);
		model.addAttribute("sectionlist",sectionlist);
		model.addAttribute("year",year);
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/list" },method = RequestMethod.POST)
	public String list(@RequestParam(value="code",required = false, defaultValue = "") String code,
			@RequestParam(value="financialYear",required = false, defaultValue ="") String year,
			@RequestParam(value="page", required=false,defaultValue = "1") int page) {
		
		return "redirect:/"+MAINMENU+"/"+SUBMENU + "?financialYear="+year+"&code="+code+"&page"+page;
	}
	
	@RequestMapping(value = "/"+SUBMENU+"/add", method = RequestMethod.POST)
	public String add(LTermdebtVo vo,@AuthUser UserVo user,Model model) {
		//마감 여부 체크
		try {
			String[] dates=vo.getDebtExpDate().split("~");
			vo.setDebtDate(dates[0]);
			vo.setExpDate(dates[1]);
			vo.setInsertId(user.getId());
			
			if(menu19Service.checkClosingDate(user, vo.getDebtDate())) { 
				
				menu48Service.insert(vo,user);
				return "redirect:/"+MAINMENU+"/"+SUBMENU;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("closeDate",true);
		return MAINMENU + "/" + SUBMENU + "/add";
		
	}
	
	@RequestMapping(value = "/"+SUBMENU+"/update", method = RequestMethod.POST)
	public String update(LTermdebtVo vo,@AuthUser UserVo user,Model model) {
		String[] dates=vo.getDebtExpDate().split("~");
		vo.setDebtDate(dates[0]);
		vo.setExpDate(dates[1]);
		vo.setUpdateId(user.getId());
		try {
			if(menu19Service.checkClosingDate(user, vo.getDebtDate())) { 
				menu48Service.update(vo,user);
				return "redirect:/"+MAINMENU+"/"+SUBMENU;
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("closeDate",true);
		return MAINMENU + "/" + SUBMENU + "/add";
		
	}
	
	@RequestMapping(value = "/"+SUBMENU+"/delete", method = RequestMethod.POST)
	public String delete(@RequestParam Long[] no,@AuthUser UserVo uservo,Model model) {
		List<LTermdebtVo> l_list=  menu48Service.selectList(no);
		for(int i=0;i<l_list.size();++i) {
			try {
				if(!menu19Service.checkClosingDate(uservo, l_list.get(i).getDebtDate())) {
					model.addAttribute("closeDate",true);
					return MAINMENU + "/" + SUBMENU + "/add";
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		menu48Service.delete(no,uservo);

		return "redirect:/"+MAINMENU+"/"+SUBMENU;
		
	}
	
	
	
	
}