package kr.co.itcen.fa.controller.menu01;


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
import kr.co.itcen.fa.dto.JSONResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu05Service;
import kr.co.itcen.fa.vo.UserVo;
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
			@RequestParam("cardNo") String cardNo,
			@RequestParam("validity") String validity, 
			@RequestParam("limitation") Optional<Integer> limitation) {
		String CardNo = cardNo.replace(",", "-");
		vo.setCardNo(CardNo);
		
		String Validity = validity.replace(",", "/");
		vo.setValidity(Validity);
		
		vo.setInsertUserId(uvo.getId());
		
		vo.setCardNoOld(null);
		
		
		vo.setLimitation(limitation.get());
		
		System.out.println(vo);
		
		page=1;
		Map<String, Object> result = menu05Service.create(vo, page);
		
		
		return result;
	}
	
	// Read
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/read")
	public Map<String, Object> read(@ModelAttribute CardVo vo, 
			@RequestParam("cardNo") String cardNo) {
		String CardNo = cardNo.replace(",", "-");
		vo.setCardNo(CardNo);
		Map<String, Object> result = menu05Service.read(vo);
		return result;
	}
	
	// Update
	@ResponseBody
	@RequestMapping(value="/" + SUBMENU + "/update")
	public Map<String, Object> update(@ModelAttribute CardVo vo, @AuthUser UserVo uvo, 
			@RequestParam("validity") String validity, 
			@RequestParam("limitation") Optional<Integer> limitation, @RequestParam("cardNoOld") String cardNoOld, 
			@RequestParam("cardNo") String cardNo,
			@RequestParam(value = "page", required=false, defaultValue = "1")int page) {
		String CardNo = cardNo.replace(",", "-");
		vo.setCardNo(CardNo);
		
		String Validity = validity.replace(",", "/");
		vo.setValidity(Validity);
		vo.setUpdateUserId(uvo.getId());
		vo.setLimitation(limitation.get());
		
		
		Map<String, Object> result = menu05Service.update(vo, page);
		return result;
	}
	
	// Delete
	@ResponseBody
	@RequestMapping(value="/" + SUBMENU + "/delete")
	public Map<String, Object> remove(@ModelAttribute CardVo vo, @AuthUser UserVo uvo, 
			@RequestParam("cardNo") String cardNo,
			@RequestParam(value = "page", required=false, defaultValue = "1")int page) {
		String CardNo = cardNo.replace(",", "-");
		vo.setCardNo(CardNo);
		vo.setUpdateUserId(uvo.getId());
		Map<String, Object> result =menu05Service.delete(vo, page);
		result.put("success", true);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/"+SUBMENU+"/check")
	public JSONResult checkNo(@RequestParam(value="cardNo", required=true, defaultValue="") String cardNo) {
		CardVo exist = new CardVo();
		exist.setCardNo(cardNo);
		CardVo vo = menu05Service.exist(exist);
        return JSONResult.success(vo);
	}	
	
	
	
	
	// PopUp
	@ResponseBody
	@RequestMapping("/" + SUBMENU + "/gets")
	public Map<String, Object> gets(@RequestParam("cardNo") String cardNo) {
		System.out.println("gets");
			
		Map<String, Object> data = menu05Service.gets(cardNo);
		data.put("success", true);
		return data;
	}
	
	
}