package kr.co.itcen.fa.controller.menu12;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.controller.menu11.Menu46Controller;
import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu12.Menu67Service;


@Auth
@Controller
@RequestMapping("/api/" + Menu67Controller.MAINMENU)
public class Menu67ApiController {
	
	@Autowired
	Menu67Service menu67Service;
	
	@ResponseBody
	@RequestMapping(value="/" + Menu67Controller.SUBMENU + "/get2019MonthSales", method = RequestMethod.POST)
	public JSONResult get2019MonthSales(@RequestParam(value="searchYear", required=false, defaultValue="2019") int searchYear) {			
		
		System.out.println("2019 매출 총계");
		Map map = menu67Service.get2019MonthSales(searchYear);
		return JSONResult.success(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/" + Menu67Controller.SUBMENU + "/get2020MonthSales", method = RequestMethod.POST)
	public JSONResult get2020MonthSales(@RequestParam(value="searchYear", required=false, defaultValue="2020") int searchYear) {			
		
		System.out.println("2020 매출 총계");
		Map map = menu67Service.get2020MonthSales(searchYear);
		return JSONResult.success(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/" + Menu67Controller.SUBMENU + "/get2019MonthTaxbill", method = RequestMethod.POST)
	public JSONResult get2019MonthTaxbill(@RequestParam(value="searchYear", required=false, defaultValue="2019") int searchYear) {			
		
		System.out.println("2019 매출 세금계산서 발행건수");
		Map map = menu67Service.get2019MonthTaxbill(searchYear);
		return JSONResult.success(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/" + Menu67Controller.SUBMENU + "/get2020MonthTaxbill", method = RequestMethod.POST)
	public JSONResult get2020MonthTaxbill(@RequestParam(value="searchYear", required=false, defaultValue="2020") int searchYear) {			
		
		System.out.println("2020 매출 세금계산서 발행건수");
		Map map = menu67Service.get2020MonthTaxbill(searchYear);
		return JSONResult.success(map);
	}


}	
