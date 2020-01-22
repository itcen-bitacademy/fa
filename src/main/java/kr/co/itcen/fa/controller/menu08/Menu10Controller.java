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
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

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
			@RequestParam(value="payDate", required=false, defaultValue = "") String payDate,
			@RequestParam(value="id", required=false, defaultValue = "") String id,
			@RequestParam(value="page", required=false, defaultValue = "1") int page) {
		/* menu10Service.test(); */
		
		String uri="";
		String startDate = null;
		String endDate = null;
		
		if("".equals(landVo.getFlag())) {
			landVo.setFlag("");
		}else {
			landVo.setFlag("s");
		}
		
		if(landVo.getAcqPrice()!=null) {
		String acqPrice = landVo.getAcqPrice().replace("," ,"");
		landVo.setAcqPrice(acqPrice);
		}

		
		if(!payDate.equals("")) {
			String[] date = payDate.split(" - ");
			startDate = date[0];	
			endDate = date[1];
			}
		
		//대분류코드 select box
		List<SectionVo> list = menu09Service.getSectionList();
		model.addAttribute("sectionList2", list);
		
		DataResult<LandVo> dataResult = new DataResult<LandVo>();
		//dataresult 생성, 모델
		
		dataResult = menu10Service.getList(landVo, startDate, endDate, page);
		model.addAttribute("dataResult",dataResult);
		model.addAttribute("page" , page);
		
		UriComponents uriComponents= UriComponentsBuilder.newInstance()
									.queryParam("id",landVo.getId())
									.queryParam("payDate",landVo.getPayDate())
									.queryParam("sectionNo",landVo.getSectionNo())
									.queryParam("sectionName",landVo.getSectionName())
									.queryParam("customerNo",landVo.getCustomerNo())
									.queryParam("wideAddress",landVo.getWideAddress())
									.queryParam("cityAddress",landVo.getCityAddress())
									.queryParam("flag", landVo.getFlag())
									.build();
		
		uri = uriComponents.toUriString();
		System.out.println("URI : " + uri);
		System.out.println("FLAG  : " + landVo.getFlag());
		
		model.addAttribute("landVo", landVo);
		model.addAttribute("dataResult",dataResult);
		model.addAttribute("page" , page);
		model.addAttribute("uri",uri);
		
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}

}