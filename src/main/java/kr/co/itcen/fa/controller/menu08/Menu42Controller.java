package kr.co.itcen.fa.controller.menu08;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.NoAuth;
import kr.co.itcen.fa.service.menu08.Menu42Service;
import kr.co.itcen.fa.vo.menu08.VehicleVo;


/**
 * 
 * @author 권영미
 * 
 * 차량현황조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu42Controller.MAINMENU)
public class Menu42Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "42";
	
	
	@Autowired
	private Menu42Service menu42Service;
	
	
	//               /08   /   42     , /08/42/list
	@NoAuth
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model,@ModelAttribute VehicleVo vehicleVo,
					@RequestParam(value="payDate", required=false) String payDate,
					@RequestParam(value="dueDate", required=false) String dueDate,
					@RequestParam(value="id", required=false, defaultValue = "") String id,
					@RequestParam(value="page", required=false, defaultValue = "1") int page,
					@RequestParam(value="searchGubun", required=false) String gubun
					  ) {
		
		System.out.println(vehicleVo);
		//menu42Service.test();
		/*
		 *   JSP
		 *   08/42/list.jsp
		 * 
		 */
		Map<String, Object> map = new HashMap<>();
		
		
		//차량분류  select box
		map.putAll(menu42Service.getSection());
		model.addAllAttributes(map);
		
		//직급 select box
		map.putAll(menu42Service.getName());
		model.addAllAttributes(map);
		
		DataResult<VehicleVo> dataResult = new DataResult<VehicleVo>();
		
		//dataresult 생성, 모델
		if(gubun==null) {
			System.out.println("기본화면");
			dataResult = menu42Service.list(id, page);
			
		}else { //조회버튼 클릭 리스트
			
			System.out.println("조회화면");
			//매입날짜 시작일, 종료일 구하기
			String startDate = null;
			String endDate = null;
			String dueStartDate = null;
			String dueEndDate = null;
			
			if(!dueDate.equals("")) {
				String[] duedate = dueDate.split(" - ");
				dueStartDate = duedate[0];
				dueEndDate = duedate[1];
			}
			if(!payDate.equals("")) {
			String[]date = payDate.split(" - ");
			startDate = date[0];	
			endDate = date[1];
			}
			dataResult = menu42Service.getList(vehicleVo, startDate, endDate, dueStartDate, dueEndDate, page);
		}
		model.addAttribute("dataResult",dataResult);
		model.addAttribute("page" , page);
		
		UriComponents uriComponents=
				UriComponentsBuilder.newInstance()
				.queryParam("id",vehicleVo.getId())
				.queryParam("payDate",vehicleVo.getPayDate())
				.queryParam("sectionNo",vehicleVo.getSectionNo())
				.queryParam("customerNo",vehicleVo.getCustomerNo())
				.queryParam("cityAddress",vehicleVo.getCityAddress())
				.queryParam("flag",vehicleVo.getFlag())
				.build();
		String uri = uriComponents.toUriString();
		model.addAttribute("uri",uri);
		model.addAttribute("vo",vehicleVo);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
}
