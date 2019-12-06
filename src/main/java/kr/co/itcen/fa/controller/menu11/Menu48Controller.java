package kr.co.itcen.fa.controller.menu11;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.service.menu11.Menu48Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;

/**
 * 
 * @author 김준호
 * 장기차입금관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu48Controller.MAINMENU)
public class Menu48Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "48";
	
	@Autowired
	private Menu48Service menu48Service;
	
	@Autowired
	private Menu03Service menu03Service;
	
	                                   //   /11/48, /11/48/add
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String list(Model model,@RequestParam(value="code",required = false, defaultValue = "") String code,
			@RequestParam(value="financialYear",required = false, defaultValue = "2019") String year,
			@RequestParam(value="page", required=false,defaultValue = "1") int page
			) {
		
		DataResult<LTermdebtVo> dataResult = menu48Service.list(page, year,code);
		List<SectionVo> sectionlist = menu48Service.selectSection();
		
		
		model.addAttribute("dataResult",dataResult);
		model.addAttribute("sectionlist",sectionlist);
		
		
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/list" },method = RequestMethod.POST)
	public String list(@RequestParam(value="code",required = false, defaultValue = "") String code,
			@RequestParam(value="financialYear",required = false, defaultValue = "2019") int year,
			@RequestParam(value="page", required=false,defaultValue = "1") int page) {
		
		return "redirect:/"+MAINMENU+"/"+SUBMENU + "?financialYear="+year+"&code="+code+"&page"+page;
	}
	@RequestMapping(value = "/"+SUBMENU+"/add", method = RequestMethod.POST)
	public String add(LTermdebtVo vo,@AuthUser UserVo user) {

		String[] dates=vo.getDebtExpDate().split("-");
		vo.setDebtDate(dates[0]);
		vo.setExpDate(dates[1]);
		vo.setInsertId(user.getId());
		Long money= (long) (vo.getDebtAmount()*vo.getIntRate()/100);
		vo.setIntAmount(money);
		
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		ItemVo itemVo3 = new ItemVo();
		
		MappingVo mappingVo = new MappingVo();
		voucherVo.setRegDate(vo.getDebtDate());
		itemVo.setAmount(vo.getDebtAmount());
		itemVo.setAmountFlag("c");
		itemVo.setAccountNo(2401000L);
		itemVoList.add(itemVo);
		
		itemVo2.setAmount(money);
		itemVo2.setAmountFlag("c");
		itemVo2.setAccountNo(9201000L);
		itemVoList.add(itemVo2);
		
		itemVo3.setAmount(vo.getDebtAmount()+money);
		itemVo3.setAmountFlag("d");
		itemVo3.setAccountNo(1110103L);
		itemVoList.add(itemVo3);
		
		mappingVo.setVoucherUse(vo.getName());//사용목적
		mappingVo.setSystemCode(vo.getCode());//제코드l190
		mappingVo.setDepositNo(vo.getDepositNo());//계좌번호
		
		Long no=menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, user);
		
		
		System.out.println(vo);
		vo.setVoucherNo(no);
		menu48Service.insert(vo);
		
		return "redirect:/"+MAINMENU+"/"+SUBMENU;
	}
	@RequestMapping(value = "/"+SUBMENU+"/update", method = RequestMethod.POST)
	public String update(LTermdebtVo vo,@AuthUser UserVo user) {
		String[] dates=vo.getDebtExpDate().split("-");
		System.out.println(user);
		System.out.println(vo);
		vo.setDebtDate(dates[0]);
		vo.setExpDate(dates[1]);
		vo.setUpdateId(user.getId());
		Long money= (long) (vo.getDebtAmount()*vo.getIntRate()/100);
		vo.setIntAmount(money);
		vo.setVoucherNo(menu48Service.select(vo.getNo()));
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		ItemVo itemVo3 = new ItemVo();
		
		
		MappingVo mappingVo = new MappingVo();
		System.out.println("vNo : " + vo.getVoucherNo());
		voucherVo.setNo(vo.getVoucherNo());
		voucherVo.setRegDate(vo.getDebtDate());
		itemVo.setAmount(vo.getDebtAmount());
		itemVo.setAmountFlag("c");
		itemVo.setAccountNo(2401000L);
		itemVo.setVoucherNo(vo.getVoucherNo());
		itemVoList.add(itemVo);
		
		itemVo2.setAmount(money);
		itemVo2.setAmountFlag("c");
		itemVo2.setAccountNo(9201000L);
		itemVo2.setVoucherNo(vo.getVoucherNo());
		itemVoList.add(itemVo2);
		
		itemVo3.setAmount(vo.getDebtAmount()+money);
		itemVo3.setAmountFlag("d");
		itemVo3.setAccountNo(1110103L);
		itemVo3.setVoucherNo(vo.getVoucherNo());
		itemVoList.add(itemVo3);
		
		mappingVo.setVoucherUse(vo.getName());//사용목적
		mappingVo.setSystemCode(vo.getCode());//제코드l190
		mappingVo.setDepositNo(vo.getDepositNo());//계좌번호
		mappingVo.setVoucherNo(vo.getVoucherNo());
		
		
		menu03Service.updateVoucher(voucherVo, itemVoList, mappingVo, user);
		menu48Service.update(vo);
		
		return "redirect:/"+MAINMENU+"/"+SUBMENU;
	}
	@RequestMapping(value = "/"+SUBMENU+"/delete", method = RequestMethod.POST)
	public String delete(@RequestParam Long[] no) {
	
		menu48Service.delete(no);
		
		return "redirect:/"+MAINMENU+"/"+SUBMENU;
	}
}
