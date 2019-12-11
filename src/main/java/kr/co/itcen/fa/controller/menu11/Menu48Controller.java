package kr.co.itcen.fa.controller.menu11;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.dto.JSONResult;
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
import kr.co.itcen.fa.vo.menu11.RepayVo;

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
		model.addAttribute("year",year);
		
		
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
		
		MappingVo mappingVo = new MappingVo();
		voucherVo.setRegDate(vo.getDebtDate());
		
		
		
		itemVo.setAmount(vo.getDebtAmount());//예금
		itemVo.setAmountFlag("d");//차변
		itemVo.setAccountNo(1110103L);//계정과목코드
		itemVoList.add(itemVo);
		
		itemVo2.setAmount(vo.getDebtAmount());//장기차입금
		itemVo2.setAmountFlag("c");
		itemVo2.setAccountNo(2401101L);
		itemVoList.add(itemVo2);
		
		
		mappingVo.setVoucherUse(vo.getName());//사용목적
		mappingVo.setSystemCode(vo.getCode());//제코드l190
		mappingVo.setCustomerNo(vo.getBankCode());
		mappingVo.setDepositNo(vo.getDepositNo());//계좌번호
		
		Long no=menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, user);
		
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
		System.out.println(money);
		vo.setVoucherNo(menu48Service.select(vo.getNo()));
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		
		
		MappingVo mappingVo = new MappingVo();
		voucherVo.setNo(vo.getVoucherNo());
		
		
		voucherVo.setRegDate(vo.getDebtDate());
		itemVo.setAmount(vo.getDebtAmount());//장기차입금 금액
		itemVo.setAmountFlag("c");//차변
		itemVo.setAccountNo(2401101L);
		itemVo.setVoucherNo(vo.getVoucherNo());
		itemVoList.add(itemVo);
		
			
		itemVo2.setAmount(vo.getDebtAmount());//예금
		itemVo2.setAmountFlag("d");
		itemVo2.setAccountNo(1110103L);
		itemVo2.setVoucherNo(vo.getVoucherNo());
		itemVoList.add(itemVo2);
		
		mappingVo.setVoucherUse(vo.getName());//사용목적
		mappingVo.setSystemCode(vo.getCode());//제코드l190
		mappingVo.setCustomerNo(vo.getBankCode());
		mappingVo.setDepositNo(vo.getDepositNo());//계좌번호
		mappingVo.setVoucherNo(vo.getVoucherNo());
		
		
		Long n=menu03Service.updateVoucher(voucherVo, itemVoList, mappingVo, user);
		vo.setVoucherNo(n);
		menu48Service.update(vo);
		
		return "redirect:/"+MAINMENU+"/"+SUBMENU;
	}
	@RequestMapping(value = "/"+SUBMENU+"/delete", method = RequestMethod.POST)
	public String delete(@RequestParam Long[] no,@AuthUser UserVo uservo) {
		List<Long> list = menu48Service.selectVoucherNo(no);
		
		List<VoucherVo> voucherVolist = new ArrayList<VoucherVo>();
		for(Long no1: list) {
			VoucherVo v = new VoucherVo();
			v.setNo(no1);
			voucherVolist.add(v);
		}
		for(VoucherVo v : voucherVolist) {
			System.out.println(v);
		}
		
		
		menu03Service.deleteVoucher(voucherVolist, uservo);
		menu48Service.delete(no);
//		
		
		return "redirect:/"+MAINMENU+"/"+SUBMENU;
		
	}
	
	
	
	
}
