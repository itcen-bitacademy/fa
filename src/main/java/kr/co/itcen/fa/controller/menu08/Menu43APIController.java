package kr.co.itcen.fa.controller.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

//import kr.co.itcen.fa.dto.JSONResult;  --> JSONResult 방식으로 할때
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu08.Menu43Service;

@Auth
@Controller
@RequestMapping("/" + Menu43Controller.MAINMENU)
public class Menu43APIController {
	
	@Autowired
	Menu43Service menu43Service;
	
	@ResponseBody
	@RequestMapping("/" + Menu43Controller.SUBMENU + "/checkId")
	public String checkId(@RequestParam(value="id", required=true, defaultValue="") String id) {
		/*Boolean exist = menu43Service.checkId(id);
		return JSONResult.success(exist);*/
		
		String check = null;
	    
	    if(id.length() == 10) {
	    	boolean overlap = menu43Service.checkId(id);
	        
	    	// 중복확인결과 중복이 없는경우
	        if(overlap == false) { 
	        	check = "true";
	        } 
	        // 중복확인결과 중복이 있는 경우
	        else { 
	            check = "false";
	        }
	         
	    } 
	    // 9글자가 아닌경우
	    else {
	         check = "none";
	    }
	    return check;
	}
}

