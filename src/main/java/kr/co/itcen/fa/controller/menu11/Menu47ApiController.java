package kr.co.itcen.fa.controller.menu11;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu11.Menu47Service;
import kr.co.itcen.fa.util.Pagination;
import kr.co.itcen.fa.vo.menu11.STermDebtVo;

@Auth
@Controller
@RequestMapping("/api/" + Menu47Controller.MAINMENU)
public class Menu47ApiController {
	
	@Autowired
	public Menu47Service menu47Service;
	
	@ResponseBody
	@RequestMapping("/" + Menu47Controller.SUBMENU + "/search")
	public JSONResult search(STermDebtVo sTermDebtVo, @RequestParam(value="page", required=true) int page) {
		Pagination pagination = new Pagination(5, 5, page);
		List<STermDebtVo> list = menu47Service.search(sTermDebtVo, pagination);
		Map map = new HashMap<>();
		map.put("list", list);
		map.put("pagination", pagination);
		
		System.out.println(pagination.getStartPage() + " " + pagination.getEndPage());
		return JSONResult.success(map);
	}
	
	@ResponseBody
	@RequestMapping("/" + Menu47Controller.SUBMENU + "/order")
	public JSONResult order(STermDebtVo sTermDebtVo, @RequestParam(value="page", required=true) int page,
			@RequestParam(value="orderColumn", required=true) String orderColumn) {
		Pagination pagination = new Pagination(5, 5, page);
		List<STermDebtVo> list = menu47Service.order(sTermDebtVo, orderColumn, pagination);
		Map map = new HashMap<>();
		map.put("list", list);
		map.put("pagination", pagination);
		
		return JSONResult.success(map);
	}
	
}

