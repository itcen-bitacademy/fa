package kr.co.itcen.fa.controller.menu02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu02.Menu07Service;
import kr.co.itcen.fa.vo.menu02.PurchasemanagementVo;

/**
 * 
 * @author 윤종진
 * 매입현황조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu07Controller.MAINMENU)
public class Menu07Controller {
	public static final String MAINMENU = "02";
	public static final String SUBMENU = "07";
	
	@Autowired
	private Menu07Service menu07Service;
	

	@RequestMapping(value = {"/" + SUBMENU}, method = RequestMethod.GET)
	public String index(Model model, @RequestParam(defaultValue = "1") int page) {
		
		int countPage = 5;
		int curPage = page;
		int lastPage;
		
		int startPage = ((curPage - 1) / countPage) * countPage + 1;
		int endPage = startPage + countPage - 1;

		int blockNum = 0;

		blockNum = (int) Math.floor((curPage - 1) / countPage);
		int blockStartNum = (countPage * blockNum) + 1;
		int blockLastNum = blockStartNum + (countPage - 1);

		int total = menu07Service.getCount();

		if (total % 11 == 0) {
			lastPage = (int) Math.floor(total / 11);
		} else {
			lastPage = (int) Math.floor(total / 11) + 1;
		}

		
		List<PurchasemanagementVo> result = menu07Service.getList((curPage - 1) * 11);
		model.addAttribute("result", result);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("blockStartNum", blockStartNum);
		model.addAttribute("blockLastNum", blockLastNum);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("curPage", curPage);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}

	@ResponseBody
	@RequestMapping(value = {"/" + SUBMENU + "/search" }, method = RequestMethod.POST)
	public List<PurchasemanagementVo> search(Model model, @RequestBody PurchasemanagementVo vo,
			String[] purchaseDate, @RequestParam(defaultValue = "1") int page) {
		
		List<PurchasemanagementVo> result = menu07Service.getList(vo);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = {"/" + SUBMENU + "/paging"}, method = RequestMethod.POST)
	public List<PurchasemanagementVo> paging(Model model,  @RequestBody PurchasemanagementVo vo) {
		
		int curPage = vo.getPage();
		List<PurchasemanagementVo> result = null;
		
		if(vo.isSearchFlag() == false) {
			vo.setPage((curPage - 1) * 11);
			result = menu07Service.getList(vo);
		} else {
			result = menu07Service.getList((curPage - 1) * 11);
		}
		
		return result;
	}
}
