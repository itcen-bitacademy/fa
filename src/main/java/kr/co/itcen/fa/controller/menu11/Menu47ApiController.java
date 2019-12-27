package kr.co.itcen.fa.controller.menu11;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping(value="/" + Menu47Controller.SUBMENU + "/getList", method=RequestMethod.POST)
	public JSONResult getList(STermDebtVo sTermDebtVo,
			@RequestParam(value="pageSize", required=false, defaultValue="5") int pageSize,
			@RequestParam(value="orderColumn", required=false, defaultValue="") String orderColumn,
			@RequestParam(value="page", required=true) int page) {
		
		Map map = menu47Service.getListMap(sTermDebtVo, pageSize, orderColumn, page);
		System.out.println("getList : " + sTermDebtVo);
		System.out.println("page : " + page);
		return JSONResult.success(map);
	}
	
}

