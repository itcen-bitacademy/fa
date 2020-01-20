package kr.co.itcen.fa.controller.menu11;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu11.Menu50Service;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;

/**
 * 
 * @author 박준호 사채관리
 *
 */
@Auth
@Controller
@RequestMapping("/" + Menu50Controller.MAINMENU)
public class Menu50Controller {
	public static final String MAINMENU = "11";
	public static final String SUBMENU = "50";

	@Autowired
	private Menu50Service menu50Service;

	@Autowired
	private Menu19Service menu19Service;

	@RequestMapping({ "/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String list(
			Model model, 
			@RequestParam(value = "code", required = false, defaultValue = "") String code,
			@RequestParam(value = "financialYear", required = false, defaultValue = "") String year,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		DataResult<PdebtVo> dataResult = menu50Service.list(page, year, code);
		List<SectionVo> sectionlist = menu50Service.selectSection();
		System.out.println("=================== list ===================");
		System.out.println("dataResult : " + dataResult.toString());
		System.out.println("code : " + code);
		System.out.println("sectionlist : " + sectionlist);
		System.out.println("year : " + year);
		System.out.println("contentsCount : " + dataResult.getPagination().getTotalCnt());
		System.out.println("=========================================");
		
		model.addAttribute("dataResult", dataResult);
		model.addAttribute("code", code);
		model.addAttribute("sectionlist", sectionlist);
		model.addAttribute("year", year);
		model.addAttribute("contentsCount", dataResult.getPagination().getTotalCnt()); // 게시물 수
		return MAINMENU + "/" + SUBMENU + "/add";
	}

	@RequestMapping(value = { "/" + SUBMENU, "/" + SUBMENU + "/list" }, method = RequestMethod.POST)
	public String list(
			@RequestParam(value = "code", required = false, defaultValue = "") String code,
			@RequestParam(value = "financialYear", required = false, defaultValue = "") int year,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {

		return "redirect:/" + MAINMENU + "/" + SUBMENU + "?financialYear=" + year + "&code=" + code + "&page" + page;
	}

	@RequestMapping(value = "/" + SUBMENU + "/add", method = RequestMethod.POST)
	public String insert(
			@ModelAttribute PdebtVo pdebtVo, 
			@AuthUser UserVo userVo, 
			Model model) {
		// 마감 여부 체크
		try {
			pdebtVo.setInsertId(userVo.getId()); // 등록자 아이디 삽입
			String deptExpDate = pdebtVo.getDebtExpDate(); // dateRangePicker에서 받아온 차입일자와 만기일자를 나누기 위해 변수 이용
			String saveDeptDate = deptExpDate.substring(0, 10);
			String saveExpDate = deptExpDate.substring(13);
			pdebtVo.setDebtDate(saveDeptDate); // 차입일자 등록
			pdebtVo.setExpDate(saveExpDate); // 만기일지 등록

			// 위험등급코드 및 위험등급명 나누어서 데이터베이스에 전달 - start
			String dangerCode = pdebtVo.getDangerCode(); // 위험등급코드 가져오기
			String[] dangerArray = dangerCode.split("-");
			pdebtVo.setDangerCode(dangerArray[0]);
			pdebtVo.setDangerName(dangerArray[1]);
			// 위험등급코드 및 위험등급명 나누어서 데이터베이스에 전달 - end

			if (menu19Service.checkClosingDate(userVo, pdebtVo.getDebtDate())) {
				menu50Service.insert(pdebtVo, userVo); // 데이터베이스에 데이터 삽입
				System.out.println("Insert 50 Controller");
				return "redirect:/"+MAINMENU+"/"+SUBMENU;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		model.addAttribute("closingDate", true); // 마감된 경우
		return MAINMENU + "/" + SUBMENU + "/add";
	}

	@RequestMapping(value = "/" + SUBMENU + "/update", method = RequestMethod.POST)
	public String update(
			@ModelAttribute PdebtVo pdebtVo, 
			@AuthUser UserVo userVo,
			Model model) throws IOException {
		// 마감 여부 체크
		try {
			String deptExpDate = pdebtVo.getDebtExpDate(); // dateRangePicker에서 받아온 차입일자와 만기일자를 나누기 위해 변수 이용
			String saveDeptDate = deptExpDate.substring(0, 10);
			String saveExpDate = deptExpDate.substring(13);
			pdebtVo.setDebtDate(saveDeptDate);
			pdebtVo.setExpDate(saveExpDate);
			pdebtVo.setUpdateId(userVo.getId()); // 수정자 아이디 삽입

			// 위험등급코드 및 위험등급명 나누어서 데이터베이스에 전달 - start
			String dangerCode = pdebtVo.getDangerCode(); // 위험등급코드 가져오기
			String[] dangerArray = dangerCode.split("-");
			pdebtVo.setDangerCode(dangerArray[0]);
			pdebtVo.setDangerName(dangerArray[1]);
			
			if (menu19Service.checkClosingDate(userVo, pdebtVo.getDebtDate())) {
				menu50Service.update(pdebtVo, userVo);
				return "redirect:/"+MAINMENU+"/"+SUBMENU;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		model.addAttribute("closingDate",true);
		return MAINMENU + "/" + SUBMENU + "/add";
	}

	@RequestMapping(value = "/" + SUBMENU + "/delete", method = RequestMethod.POST)
	public String delete(
			@RequestParam Long[] no, 
			@AuthUser UserVo userVo,
			Model model) {
		List<PdebtVo> pdebtVoList = menu50Service.selectList(no);

		for (int i = 0; i < pdebtVoList.size(); ++i) {
			try {
				if (!menu19Service.checkClosingDate(userVo, pdebtVoList.get(i).getDebtDate())) {
					model.addAttribute("closingDate", true); // 마감된 경우
					return MAINMENU + "/" + SUBMENU + "/add";
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}

		menu50Service.delete(no, userVo);

		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}

}
