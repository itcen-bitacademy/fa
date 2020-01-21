package kr.co.itcen.fa.controller.menu08;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.NoAuth;
import kr.co.itcen.fa.service.menu08.Menu44Service;
import kr.co.itcen.fa.vo.menu08.IntangibleAssetsVo;

/**
 * 
 * @author 김유진
 * 
 *         무형자산조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu44Controller.MAINMENU)
public class Menu44Controller {

	public static final String MAINMENU = "08";
	public static final String SUBMENU = "44";

	@Autowired
	private Menu44Service menu44Service;

	// main page
	@NoAuth
	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(IntangibleAssetsVo intangibleAssetsVo, 
			Model model,
			@RequestParam(value = "payDate", required = false) String payDate,
			@RequestParam(value = "kwd", required = false, defaultValue = "") String kwd,
			@RequestParam(value="page", required=false, defaultValue = "1") int page) {

		String uri="";
		String startDate = null;
		String endDate = null;
		DataResult<IntangibleAssetsVo> dataResult = new DataResult<IntangibleAssetsVo>();

		// 대분류코드, 거래처명 리스트
		Map<String, Object> map = new HashMap<>();
		map.putAll(menu44Service.getSection());
		model.addAllAttributes(map);
		
		if("".equals(intangibleAssetsVo.getFlag())) {
			intangibleAssetsVo.setFlag("");
		}else {
			intangibleAssetsVo.setFlag("s");
		}
		
		System.out.println("###flag:" + intangibleAssetsVo.getFlag());
		
		// 취득금액 조회
		if (intangibleAssetsVo.getAcqPrice() != null) {
			String acqPrice = intangibleAssetsVo.getAcqPrice().replace(",", "");
			intangibleAssetsVo.setAcqPrice(acqPrice);
		}
		
		// 매입일자를 조회했을 경우
		if(payDate != null && !payDate.equals("")) {
			String[] date = payDate.split(" - ");
			startDate = date[0];
			endDate = date[1];

			dataResult = menu44Service.getList(page, intangibleAssetsVo, startDate, endDate);
		}
		
		// list.jsp 페이지 기본 화면
		dataResult = menu44Service.getList(page, intangibleAssetsVo, startDate, endDate);
		model.addAttribute("dataResult", dataResult);
		model.addAttribute("vo", intangibleAssetsVo);
		model.addAttribute("page", page);
		
		UriComponents uriComponents=
				UriComponentsBuilder.newInstance()
				.queryParam("id",intangibleAssetsVo.getId())
				.queryParam("payDate",intangibleAssetsVo.getPayDate())
				.queryParam("sectionNo",intangibleAssetsVo.getSectionNo())
				.queryParam("customerName",intangibleAssetsVo.getCustomerName())
				.queryParam("address",intangibleAssetsVo.getAddress())
				.queryParam("acqPrice", intangibleAssetsVo.getAcqPrice())
				.queryParam("flag",intangibleAssetsVo.getFlag())
				.build();
		uri = uriComponents.toUriString();
		model.addAttribute("uri",uri);
		
		//model.addAttribute("intangibleAssetsVo", dataResult.getDatas());
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}
}
