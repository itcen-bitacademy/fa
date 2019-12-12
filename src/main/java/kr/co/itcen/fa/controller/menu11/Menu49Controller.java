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
import kr.co.itcen.fa.service.menu11.Menu49Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;

/**
 * 
 * @author 김준호
 * 장기차입금현황조회
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu49Controller.MAINMENU)
public class Menu49Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "49";
	
	@Autowired
	private Menu49Service menu49Service;
	
	                                   //   /11/49, /11/49/list
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model,
			@RequestParam(value="page", required=false,defaultValue = "1") int page,
		LTermdebtVo vo,
		@RequestParam(value="sort", required=false) String sort) {
		System.out.println(vo);
		if(vo.getDebtDate() == null || "".equals(vo.getDebtDate()))
			vo.setDebtDate("");
		if(vo.getIntPayWay() ==null || "".equals(vo.getIntPayWay()))
			vo.setIntPayWay("");
		if(vo.getBankName() == null || "".equals(vo.getBankName()))
			vo.setBankName("");
		if(vo.getExpDate() == null || "".equals(vo.getExpDate()))
			vo.setExpDate("");
		if("".equals(vo.getDeleteFlag()))
			vo.setDeleteFlag("");
		else vo.setDeleteFlag("N");
		
		if("".equals(vo.getRepayCompleFlag()))
			vo.setRepayCompleFlag("");
		else vo.setRepayCompleFlag("N");
		DataResult<LTermdebtVo> dataResult = menu49Service.list(page,vo,sort);
		List<SectionVo> sectionlist = menu49Service.selectSection();
		UriComponents uriComponents=
				UriComponentsBuilder.newInstance()
				.queryParam("sort",sort)
				.queryParam("debtDate",vo.getDebtDate())
				.queryParam("expDate",vo.getExpDate())
				.queryParam("intPayWay",vo.getIntPayWay())
				.queryParam("bankName",vo.getBankName())
				.queryParam("deleteFlag",vo.getDeleteFlag())
				.queryParam("repayCompleFlag",vo.getRepayCompleFlag())
				.build();
		String uri=uriComponents.toUriString();
		
		model.addAttribute("uri",uri);
		model.addAttribute("dataResult",dataResult);
		model.addAttribute("sectionlist",sectionlist);
		model.addAttribute("sort", sort);
		model.addAttribute("vo", vo);
		
		return MAINMENU + "/" + SUBMENU + "/list";
	}

}