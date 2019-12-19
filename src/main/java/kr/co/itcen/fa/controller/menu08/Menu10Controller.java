package kr.co.itcen.fa.controller.menu08;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.NoAuth;
import kr.co.itcen.fa.service.menu08.Menu09Service;
import kr.co.itcen.fa.service.menu08.Menu10Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu08.LandVo;

/**
 * 
 * @author 정의돈
 * 
 *         토지현황조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu10Controller.MAINMENU)
public class Menu10Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "10";

	@Autowired
	private Menu09Service menu09Service;

	@Autowired
	private Menu10Service menu10Service;

	// /08 / 10 , /08/10/list
	@NoAuth
	@RequestMapping({"", "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model, @ModelAttribute LandVo landVo,
			@RequestParam(value="payDate", required=false) String payDate,
			@RequestParam(value="id", required=false, defaultValue = "") String id,
			@RequestParam(value="page", required=false, defaultValue = "1") int page,
			@RequestParam(value="searchGubun", required=false) String gubun) {
		/* menu10Service.test(); */
		
		if(landVo.getAcqPrice()!=null) {
		String acqPrice = landVo.getAcqPrice().replace("," ,"");
		landVo.setAcqPrice(acqPrice);
		}
		
		//대분류코드 select box
		List<SectionVo> list = menu09Service.getSectionList();
		model.addAttribute("sectionList2", list);
		
		DataResult<LandVo> dataResult = new DataResult<LandVo>();
		
		
		//dataresult 생성, 모델
		if(gubun==null) {
		System.out.println("기본화면");
		dataResult = menu10Service.list(id, page);
		}else { //조회버튼 클릭 리스트
			
			System.out.println("조회화면");
			
			//매입날짜 시작일, 종료일 구하기
			String startDate = null;
			String endDate = null;
			if(!payDate.equals("")) {
			String[] date = payDate.split(" - ");
			startDate = date[0];	
			endDate = date[1];
			}
			dataResult = menu10Service.getList(landVo, startDate, endDate, page);
			System.out.println(dataResult);
		}
		model.addAttribute("dataResult",dataResult);
		model.addAttribute("page" , page);
		
		

		return MAINMENU + "/" + SUBMENU + "/list";
	}

}