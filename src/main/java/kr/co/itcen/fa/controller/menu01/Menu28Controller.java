package kr.co.itcen.fa.controller.menu01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.service.menu01.Menu28Service;
import kr.co.itcen.fa.vo.menu01.CustomerVo;

/**
 * 
 * @author 이종윤 
 * 거래처 현황 조회
 *
 */

@Auth
@Controller
@RequestMapping("/" + Menu28Controller.MAINMENU)
public class Menu28Controller {
	public static final String MAINMENU = "01";
	public static final String SUBMENU = "28";

	@Autowired
	private Menu28Service menu28Service;

	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/list" })
	public String test(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int page,
			CustomerVo customerVo) {
		if (customerVo.getDeleteFlag() == null) {
			customerVo.setDeleteFlag("N");
		}
		if(customerVo.getCustomerDiv() == null) {
			customerVo.setCustomerDiv("All");
		}
		DataResult<CustomerVo> dataResult = menu28Service.list(page, customerVo);
		model.addAttribute("dataResult", dataResult);

		return MAINMENU + "/" + SUBMENU + "/list";
	}

}
