package kr.co.itcen.fa.controller.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu11.Menu51Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;

/**
 * 
 * @author 박준호 사채현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu51Controller.MAINMENU)
public class Menu51Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "51";

	@Autowired
	private Menu51Service menu51Service;

	// /11/51, /11/51/list
	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(
			Model model, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value = "sort", required = false) String sort, 
			PdebtVo pdebtVo) {
		DataResult<PdebtVo> dataResult = menu51Service.list(page, pdebtVo, sort);
		List<SectionVo> sectionlist = menu51Service.selectSection();

		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("sort", sort)
				.queryParam("debtDate", pdebtVo.getDebtDate())
				.queryParam("expDate", pdebtVo.getExpDate())
				.queryParam("intPayWay", pdebtVo.getIntPayWay())
				.queryParam("bankCode", pdebtVo.getBankCode())
				.build();
		
		String uri = uriComponents.toUriString();

		System.out.println("uri : " + uri.toString());
		System.out.println("dataResult : " + dataResult.toString());
		System.out.println("sectionlist : " + sectionlist.toString());
		
		model.addAttribute("uri", uri);
		model.addAttribute("dataResult", dataResult);
		model.addAttribute("sectionlist", sectionlist);
		model.addAttribute("sort", sort);

		return MAINMENU + "/" + SUBMENU + "/list";
	}

}
