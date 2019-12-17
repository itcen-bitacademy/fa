package kr.co.itcen.fa.controller.menu08;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu08.Menu40Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu08.BuildingVo;


/**
 * 
 * @author 김민준
 * 
 * 건물현황조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu40Controller.MAINMENU)
public class Menu40Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "40";
	
	
	@Autowired
	private Menu40Service menu40Service;
	
	
	//               /08   /   40     , /08/40/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model, @RequestParam(value="page", required=false,defaultValue = "1") int page, BuildingVo vo) {
		
		if(vo.getId() == null || "".equals(vo.getId()))
			vo.setId("");
		if(vo.getPayDate() == null || "".equals(vo.getPayDate()))
			vo.setPayDate("");
		if(vo.getSectionNo() == null || "".equals(vo.getSectionNo()))
			vo.setSectionNo("");
		if(vo.getCustomerNo() == null || "".equals(vo.getCustomerNo()))
			vo.setCustomerNo("");
		if(vo.getWideAddress() == null || "".equals(vo.getWideAddress()))
			vo.setWideAddress("");
		if(vo.getCityAddress() == null || "".equals(vo.getCityAddress()))
			vo.setCityAddress("");
		if(vo.getDetailAddress() == null || "".equals(vo.getDetailAddress()))
			vo.setDetailAddress("");
		if("".equals(vo.getFlag()))
			vo.setFlag("");
		else vo.setFlag("s");
		
		
		//dataresult 생성
		DataResult<BuildingVo> dataResult = menu40Service.list(vo, page); 
				
		model.addAttribute("dataResult",dataResult);
		
		//map 생성
		Map<String, Object> map = new HashMap<>();
		
		//대분류
		map.putAll(menu40Service.getSection());
		model.addAllAttributes(map);
		
		//거래처
		map.putAll(menu40Service.getCustomer());
		model.addAllAttributes(map);
		
		UriComponents uriComponents=
				UriComponentsBuilder.newInstance()
				.queryParam("id",vo.getId())
				.queryParam("payDate",vo.getPayDate())
				.queryParam("sectionNo",vo.getSectionNo())
				.queryParam("customerNo",vo.getCustomerNo())
				.queryParam("cityAddress",vo.getCityAddress())
				.queryParam("detailAddress",vo.getDetailAddress())
				.queryParam("flag",vo.getFlag())
				.build();
		String uri = uriComponents.toUriString();
		model.addAttribute("uri",uri);
		model.addAttribute("vo",vo);
				
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
}
