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
	public String list(Model model,VehicleVo vehicleVo,
					@RequestParam(value="payDate", required=false) String payDate,
					@RequestParam(value="dueDate", required=false) String dueDate,
					@RequestParam(value="id", required=false, defaultValue = "") String id,
					@RequestParam(value="page", required=false, defaultValue = "1") int page
					  ) {
		
		
		if("".equals(vehicleVo.getFlag())) {
			vehicleVo.setFlag(""); //삭제포함된거
		}
		else { 
			vehicleVo.setFlag("so"); // 처음 s는 의미없고 처음일때 null이아니고 공백이 아닐때 작성된거랑 수정된거가 나와야됨
		}
		
		
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
		
		
		//dataresult 생성, 모델
	
			//조회버튼 클릭 리스트
			
			System.out.println("조회화면");
			//매입날짜 시작일, 종료일 구하기
			String startDate = null;
			String endDate = null;
			String dueStartDate = null;
			String dueEndDate = null;
			
					
			if(dueDate != null && !dueDate.equals("")) {
				String[] duedate = dueDate.split(" - ");
				dueStartDate = duedate[0];
				dueEndDate = duedate[1];
			}
			
			if(payDate != null &&!payDate.equals("")) {
			String[]date = payDate.split(" - ");
				startDate = date[0];	
				endDate = date[1];
			}
			DataResult<VehicleVo> dataResult = menu42Service.getList(vehicleVo, startDate, endDate, dueStartDate, dueEndDate, page);
			
			//8가지 
		
		  UriComponents uriComponents= UriComponentsBuilder.newInstance()
		  .queryParam("id",vehicleVo.getId()) //차량코드
		  .queryParam("sectionNo",vehicleVo.getSectionNo()) //대분류명
		  .queryParam("staffNo",vehicleVo.getStaffNo()) //직급
		  .queryParam("customerNo",vehicleVo.getCustomerNo()) //거래처 코드
		  .queryParam("customerName",vehicleVo.getCustomerName()) //거래처 담당자
		  .queryParam("dueDate",vehicleVo.getDueDate())// 납부일자
		  .queryParam("cityAddress",vehicleVo.getCityAddress()) //주소
		  .queryParam("payDate",vehicleVo.getPayDate())// 매입일자
		  .queryParam("flag",vehicleVo.getFlag()) .build(); String uri =
		  uriComponents.toUriString(); model.addAttribute("uri",uri);
		  
		  if(vehicleVo!=null) {
			  model.addAttribute("vehicleVo",vehicleVo);
		  }

		model.addAttribute("dataResult",dataResult);
		model.addAttribute("page" , page);
		
		
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
}
