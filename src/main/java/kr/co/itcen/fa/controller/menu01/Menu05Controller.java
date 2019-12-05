package kr.co.itcen.fa.controller.menu01;


import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu05Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;
import kr.co.itcen.fa.vo.menu01.CardVo;


/**
 * 
 * @author 김승곤
 * 카드관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu05Controller.MAINMENU)
public class Menu05Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "05";

	@Autowired
	private Menu05Service menu05Service;

	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String list(Model model, 
		@RequestParam(value="page", required=false,defaultValue = "1") int page) {
		DataResult<CardVo> dataResult = menu05Service.list(page);
		
		model.addAttribute("dataResult", dataResult);
		return MAINMENU + "/" + SUBMENU + "/list";
	}
	
	// Create
	@ResponseBody
	@RequestMapping(value="/" + SUBMENU + "/create")
	public Map<String, Object> create(@ModelAttribute CardVo vo, @AuthUser UserVo uvo
			, @RequestParam(value = "page", required=false, defaultValue = "1")int page,
			@RequestParam("cardNo1") String cardNo1,@RequestParam("cardNo2") String cardNo2,
			@RequestParam("cardNo3") String cardNo3, @RequestParam("cardNo4") String cardNo4,
			@RequestParam("validityMM") String validityMM, @RequestParam("validityYY") String validityYY,
			@RequestParam("limitation") Optional<Integer> limitation) {
		String cardNo = cardNo1+"-"+cardNo2+"-" +cardNo3+"-" +cardNo4;
		vo.setCardNo(cardNo);
		
		String validity = validityMM + "/"+ validityYY ;
		vo.setValidity(validity);
		
		vo.setInsertUserId(uvo.getName());
		
		vo.setCardNoOld(null);
		
		vo.setLimitation(limitation.get());
		
		System.out.println(vo);
		
		page=1;
		Map<String, Object> dataResult = menu05Service.create(vo, page);
		
		
		return dataResult;
	}
	
	// Read
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/read")
	public Map<String, Object> read(@ModelAttribute CardVo vo, 
			@RequestParam("cardNo1") String cardNo1,@RequestParam("cardNo2") String cardNo2,
			@RequestParam("cardNo3") String cardNo3, @RequestParam("cardNo4") String cardNo4) {
		String cardNo = cardNo1+"-"+cardNo2+"-" +cardNo3+"-" +cardNo4;
		vo.setCardNo(cardNo);
		Map<String, Object> dataResult = menu05Service.read(vo);
		return dataResult;
	}
	
	// Update
	@ResponseBody
	@RequestMapping(value="/" + SUBMENU + "/update")
	public Map<String, Object> update(@ModelAttribute CardVo vo, @AuthUser UserVo uvo, 
			@RequestParam("validityMM") String validityMM, @RequestParam("validityYY") String validityYY,
			@RequestParam("limitation") Optional<Integer> limitation, @RequestParam("cardNoOld") String cardNoOld, 
			@RequestParam("cardNo1") String cardNo1,@RequestParam("cardNo2") String cardNo2,
			@RequestParam("cardNo3") String cardNo3, @RequestParam("cardNo4") String cardNo4,
			@RequestParam(value = "page", required=false, defaultValue = "1")int page) {
		String cardNo = cardNo1+"-"+cardNo2+"-" +cardNo3+"-" +cardNo4;
		vo.setCardNo(cardNo);
		
		String validity = validityMM + "/"+ validityYY ;				//두자 고정으로
		vo.setValidity(validity);
		vo.setUpdateUserId(uvo.getName());
		vo.setLimitation(limitation.get());
		
		
		Map<String, Object> dataResult = menu05Service.update(vo, page);
		return dataResult;
	}
	
	// Delete
	@ResponseBody
	@RequestMapping(value="/" + SUBMENU + "/delete")
	public Map<String, Object> remove(@ModelAttribute CardVo vo,
			@RequestParam("cardNo1") String cardNo1,@RequestParam("cardNo2") String cardNo2,
			@RequestParam("cardNo3") String cardNo3, @RequestParam("cardNo4") String cardNo4,
			@RequestParam(value = "page", required=false, defaultValue = "1")int page) {
		String cardNo = cardNo1+"-"+cardNo2+"-" +cardNo3+"-" +cardNo4;
		vo.setCardNo(cardNo);
		
		Map<String, Object> dataResult =menu05Service.delete(vo, page);
		dataResult.put("success", true);
		return dataResult;
	}
		
	
	
	
}