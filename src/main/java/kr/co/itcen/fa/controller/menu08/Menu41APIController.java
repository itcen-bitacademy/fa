package kr.co.itcen.fa.controller.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu08.Menu41Service;

@Auth
@Controller
@RequestMapping("/" + Menu41Controller.MAINMENU)
public class Menu41APIController {
	
	@Autowired
	Menu41Service menu41Service;

	//차량코드 중복확인
	@ResponseBody
    @RequestMapping("/" + Menu41Controller.SUBMENU + "/checkId")
	   public String checkId(@RequestParam(value = "id"/* , required=true, defaultValue="" */) String id ) {
	      String check = null;
	      
	      System.out.println("중복확인 해보자");
	      if(id.length() == 10) {
	         boolean overlap = menu41Service.checkId(id);
	         
	         if(overlap == false) { //중복확인결과 중복이 없는경우
	            check = "true";
	         }else { //중복확인결과 중복이 있는 경우
	            check = "false";
	         }
	         
	      }else { // 9글자가 아닌경우
	         check = "none";
	      }
	      
	      return check;
	   }
	}


