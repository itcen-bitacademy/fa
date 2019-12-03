package kr.co.itcen.fa.controller.menu11;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.security.Auth;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu11.Menu50Service;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu11.BankVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;
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

	// 사채현황관리 접속 - 사채현황 리스트 출력
	// /11/50
//	@RequestMapping(value = {"/" + SUBMENU })
//	public String index(
//			@RequestParam(value = "page") Optional<Integer> page,
//			Model model) {
//		PageVo pageInfo = null;
//		if (page.isPresent()) {
//			pageInfo = pagingProcess(page.get());
//		} else {
//			pageInfo = pagingProcess(1);
//		}
//		List<PdebtVo> list = menu50Service.list(pageInfo.getStartRow() - 1, pageInfo.getRowsPerPage());
//		
//		// 은행정보 불러오기
//		List<BankVo> bankList = menu50Service.bankInfoList();
//		
//		model.addAttribute("list", list);
//		model.addAttribute("bankList", bankList);
//		model.addAttribute("pageInfo", pageInfo);
//		
//		return MAINMENU + "/" + SUBMENU + "/add";
//	}
	
	@RequestMapping({"/" + SUBMENU, "/" + SUBMENU + "/add" })
	public String list(
			Model model,
			@RequestParam(value="code",required = false, defaultValue = "") String code,
			@RequestParam(value="financialYear",required = false, defaultValue = "2019") String year,
			@RequestParam(value="page", required=false, defaultValue = "1") int page) {
		DataResult<PdebtVo> dataResult = menu50Service.list(page, year, code);
		// 은행정보 불러오기
		List<BankVo> bankList = menu50Service.bankInfoList();
		System.out.println("dataResult : " + dataResult.toString());
		model.addAttribute("bankList", bankList);
		model.addAttribute("dataResult", dataResult);
		return MAINMENU + "/" + SUBMENU + "/add";
	}
	
	@RequestMapping(value = {"/" + SUBMENU, "/" + SUBMENU + "/list" },method = RequestMethod.POST)
	public String list(
			@RequestParam(value="code",required = false, defaultValue = "") String code,
			@RequestParam(value="financialYear",required = false, defaultValue = "2019") int year,
			@RequestParam(value="page", required=false,defaultValue = "1") int page) {
		
		return "redirect:/"+MAINMENU+"/"+SUBMENU + "?financialYear="+year+"&code="+code+"&page"+page;
	}
	
	// 11/50/add.jsp
	@RequestMapping(value = "/" + SUBMENU + "/insert", method = RequestMethod.POST)
	public String insert(
			@ModelAttribute PdebtVo pdebtVo, 
			@AuthUser UserVo userVo) throws ParseException {
		pdebtVo.setInsertId(userVo.getId()); // 등록자 아이디 삽입
		
		DateFormat convertDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String deptExpDate = pdebtVo.getDebtExpDate(); // dateRangePicker에서 받아온 차입일자와 만기일자를 나누기 위해 변수 이용
		pdebtVo.setDebtDate(convertDateFormat.parse(deptExpDate.substring(0, 10))); // 차입일자 date format으로 변경
		pdebtVo.setExpDate(convertDateFormat.parse(deptExpDate.substring(13))); // 만기일자 date format으로 변경
		
		// 위험등급코드 및 위험등급명 나누어서 데이터베이스에 전달
		String dangerCode = pdebtVo.getDangerCode(); // 위험등급코드 가져오기
		String[] dangerArray = dangerCode.split("-");
		pdebtVo.setDangerCode(dangerArray[0]);
		pdebtVo.setDangerName(dangerArray[1]);

		// 하드코딩으로 박은 값
		pdebtVo.setRepayBal(pdebtVo.getDebtAmount()); // 상환잔액을 차입금액으로 초기화
		pdebtVo.setDepositNo("123-123-1"); // 1팀값 참조
		pdebtVo.setAccountNo("110-123-123123"); // 1팀값 참조
		pdebtVo.setVoucherNo(1);

		menu50Service.insert(pdebtVo); // 데이터베이스에 데이터 삽입
		
		return "redirect:/" + MAINMENU + "/" + SUBMENU;
	}
	
	@RequestMapping(value = "/"+SUBMENU+"/update", method = RequestMethod.POST)
	public String update(
			PdebtVo pdebtVo,
			@AuthUser UserVo userVo) throws ParseException{
		pdebtVo.setUpdateId(userVo.getId()); // 수정자 아이디 삽입
		menu50Service.update(pdebtVo);
		return "redirect:/"+MAINMENU+"/"+SUBMENU;
	}
	
	// 페이징 처리 메소드
//	public PageVo pagingProcess(Integer page) {
//		int pageConvertToInt = 1;
//
//		if (page != 1) {
//			pageConvertToInt = page;
//		}
//
//		PageVo pageInfo = new PageVo();
//
//		int rowsPerPage = 11;
//		int pagesPerBlock = 5;
//		int currentPage = pageConvertToInt;
//		int currentBlock = 0;
//
//		if (currentPage % pagesPerBlock == 0) {
//			currentBlock = currentPage / pagesPerBlock;
//		} else {
//			currentBlock = (currentPage / pagesPerBlock) + 1;
//		}
//
//		// 한 페이지에 ◀ 1 2 3 4 5 ▶ 다섯개의 블럭 출력
//		// ◀ startRow 2 3 4 endRow ▶
//		int startRow = (currentPage - 1) * rowsPerPage + 1;
//		int endRow = currentPage * rowsPerPage;
//
//		// 현재 게시판에 있는 게시글의 총 갯수 출력
//		int totalRows = menu50Service.pdebtTotalcount();
//		System.out.println("totalRows : " + totalRows);
//
//		int totalPages = 0;
//
//		if (totalRows % rowsPerPage == 0) {
//			totalPages = totalRows / rowsPerPage;
//		} else {
//			totalPages = totalRows / rowsPerPage + 1;
//		}
//
//		int totalBlocks = 0;
//		if (totalPages % pagesPerBlock == 0) {
//			totalBlocks = totalPages / pagesPerBlock;
//		} else {
//			totalBlocks = totalPages / pagesPerBlock + 1;
//		}
//
//		pageInfo.setCurrentPage(currentPage); // 현재 페이지 
//		pageInfo.setCurrentBlock(currentBlock); // 현재 페이지를 가리키는 블럭
//		pageInfo.setRowsPerPage(rowsPerPage); // 데이터 11개 출력
//		pageInfo.setPagesPerBlock(pagesPerBlock);
//		pageInfo.setStartRow(startRow); // 데이터 시작
//		pageInfo.setEndRow(endRow); // 데이터 끝
//		pageInfo.setTotalBlocks(totalBlocks); // 총 블럭 갯수
//		pageInfo.setTotalPages(totalPages); // 총 페이지 수
//		pageInfo.setTotalRows(totalRows);
//
//		return pageInfo;
//	}
}
