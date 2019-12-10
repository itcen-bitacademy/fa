package kr.co.itcen.fa.controller.menu11;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu11.Menu46Service;

@Auth
@Controller
@RequestMapping("/api/" + Menu46Controller.MAINMENU)
public class Menu46ApiController {
	
	@Autowired
	Menu46Service menu46Service;
	
	@ResponseBody
	@RequestMapping("/" + Menu46Controller.SUBMENU + "/search")
	public JSONResult search(@RequestParam(value="code", required=false) String code, 
			@RequestParam(value="financialYear", required=false) String financialYear,
			@RequestParam(value="pageSize", required=false, defaultValue="5") int pageSize) {
		
		Map map = menu46Service.search(code, financialYear, pageSize);
		
		return JSONResult.success(map);
	}
	
	@ResponseBody
	@RequestMapping("/" + Menu46Controller.SUBMENU + "/paging")
	public JSONResult paging(@RequestParam(value="code", required=false) String code, 
			@RequestParam(value="financialYear", required=false) String financialYear,
			@RequestParam(value="pageSize", required=false, defaultValue="5") int pageSize,
			@RequestParam(value="page", required=true) int page){
		
		System.out.println("pageSize : " + pageSize);
		Map map = menu46Service.paging(code, financialYear, pageSize, page);
		
		return JSONResult.success(map);
	}
	//배열로 넘어온거는 '[]' 붙여줘야한다.
	@ResponseBody
	@RequestMapping("/" + Menu46Controller.SUBMENU + "/deleteChecked")
	public JSONResult deleteChecked(@RequestParam(value="sendData[]", required=true) List<Long> noList) {
		menu46Service.deleteChecked(noList);
		Map map = menu46Service.getListMap();
		return JSONResult.success(map);
	}
}
