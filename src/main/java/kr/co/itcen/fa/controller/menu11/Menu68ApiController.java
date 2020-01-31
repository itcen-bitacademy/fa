package kr.co.itcen.fa.controller.menu11;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu11.Menu46Service;

@Auth
@RequestMapping("/api/" + Menu68Controller.MAINMENU + "/" + Menu68Controller.SUBMENU)
@RestController
public class Menu68ApiController {
	
	@Autowired
	Menu46Service menu46Service;
	
	@ResponseBody
	@RequestMapping(value="/getYearDebtStat", method = RequestMethod.POST)
	public JSONResult getYearDebtStat() {			//insert 내테이블에만 할때 사용
		Map map = menu46Service.getYearDebtStat();
		return JSONResult.success(map);
	}
	
	@RequestMapping(value="/getMonthDebtStat", method = RequestMethod.POST)
	public JSONResult getMonthDebtStat(@RequestParam(value="searchYear", required=true) int searchYear) {			//insert 내테이블에만 할때 사용
		System.out.println("searchYear : " + searchYear);
		Map map = menu46Service.getMonthDebtStat(searchYear);
		return JSONResult.success(map);
	}
	
	@RequestMapping(value="/getYearIntStat", method = RequestMethod.POST)
	public JSONResult getYearIntStat() {
		Map map = menu46Service.getYearIntStat();
		return JSONResult.success(map);
	}
	
	@RequestMapping(value="/getDebtRatio", method = RequestMethod.POST)
	public JSONResult getDebtRatio() {
		List<Map> list = menu46Service.getDebtRatioStat();
		return JSONResult.success(list);
	}
	
}
