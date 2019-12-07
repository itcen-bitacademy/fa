package kr.co.itcen.fa.service.menu17;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu17.Menu19Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
import kr.co.itcen.fa.vo.menu17.Menu17SearchForm;


/**
 * 
 * @author 김재원
 * 마감일자관리
 */

@Service
public class Menu19Service {
	
	@Autowired
	private Menu19Repository menu19Repository;
	
	@Autowired
	private Menu61Service menu61Service;
	
	@Autowired
	private Menu63Service menu63Service;
	
	@Autowired
	private Menu64Service menu64Service;
	
	public void test() {
		menu19Repository.test();
	}
	
	/**
	 * 
	 * 마감일 등록
	 */
	public DataResult<Object> insertClosingDate(ClosingDateVo closingDate) {
		DataResult<Object> dataResult = new DataResult<>();
		
		// 마감일자 중복검사 
		if (menu19Repository.selectCountByYearMonth(closingDate) < 1) {
			menu19Repository.insertClosingDate(closingDate);
		} else {
			dataResult.setStatus(false);
			dataResult.setError("해당월의 마감일자 데이터가 이미 존재합니다.");
		}
		
		return dataResult;
	}
	
	
	/**
	 * 
	 * 마감일 단일 조회 
	 */
	public ClosingDateVo selectClosingDateByNo(Menu17SearchForm menu17SearchForm) {
		return menu19Repository.selectClosingDateByNo(menu17SearchForm);
	}
	
	
	/**
	 * 
	 * 마감일 전체 조회(마감일순 내림차순)
	 */
	public DataResult<ClosingDateVo> selectAllClosingDate(int page) {
		DataResult<ClosingDateVo> dataResult = new DataResult<>();
		
		int totalCount = menu19Repository.selectAllClosingDateCount();
		PaginationUtil paginationUtil = new PaginationUtil(page, totalCount, 11, 5);
		dataResult.setPagination(paginationUtil);
		
		Menu17SearchForm menu17SearchForm = new Menu17SearchForm();
		menu17SearchForm.setPagination(paginationUtil);
		
		List<ClosingDateVo> list = menu19Repository.selectAllClosingDate(menu17SearchForm);
		dataResult.setDatas(list);
		
		return dataResult;
	}
	
	
	/**
	 * 
	 * 마감일 수정(미결산 마감일 및 가장 최근의 마감일만 수정 가능)
	 */
	@Transactional(rollbackFor = Exception.class)
	public DataResult<Object> updateClosingDate(ClosingDateVo closingDate) {
		DataResult<Object> dataResult = new DataResult<>();
		
		// 결산여부 검사 
		if (closingDate.isClosingYn()) {		// 결산완료 마감일을 수정할 경우 
			// 최근 마감일 조회 후 검사 
			ClosingDateVo lastestClosingDate = menu19Repository.selectLastestClosedDateByClosingDateNoPerYear(closingDate);
			if (lastestClosingDate == null || lastestClosingDate.getNo().longValue() != closingDate.getNo().longValue()) {
				dataResult.setStatus(false);
				dataResult.setError("가장 최근의 마감일만 수정할 수 있습니다.");
				
				return dataResult;
			}
		}
		
		// 시산표 및 재무제표 데이터 삭제
		// 시산표 데이터 삭제  
		menu61Service.deleteTrialBalanceByClosingDateNo(closingDate);
		// 대차대조표 데이터 삭제
		menu63Service.deleteBalanceSheet(closingDate);
		// 손익계산서 데이터 삭제
		menu64Service.deleteIncomeStatement(closingDate);
		
		
		// 마감일 수정 처리
		menu19Repository.updateClosingDate(closingDate);
		
		return dataResult;
	}
	
	
	/**
	 * 
	 * 마감일 삭제(미결산 마감일 및 가장 최근의 마감일만 삭제 가능)
	 */
	@Transactional(rollbackFor = Exception.class)
	public DataResult<Object> deleteClosingDate(ClosingDateVo closingDate) {
		DataResult<Object> dataResult = new DataResult<>();
		
		// 결산여부 검사 
		if (closingDate.isClosingYn()) {		// 결산완료 마감일을 수정할 경우 
			// 최근 마감일 조회 후 검사 
			ClosingDateVo lastestClosingDate = menu19Repository.selectLastestClosedDateByClosingDateNoPerYear(closingDate);
			if (lastestClosingDate == null || lastestClosingDate.getNo().longValue() != closingDate.getNo().longValue()) {
				dataResult.setStatus(false);
				dataResult.setError("가장 최근의 마감일만 삭제할 수 있습니다.");
				
				return dataResult;
			}
		}
		
		// 시산표 및 재무제표 데이터 삭제
		// 시산표 데이터 삭제  
		menu61Service.deleteTrialBalanceByClosingDateNo(closingDate);
		// 대차대조표 데이터 삭제
		menu63Service.deleteBalanceSheet(closingDate);
		// 손익계산서 데이터 삭제
		menu64Service.deleteIncomeStatement(closingDate);

		// 마감일 삭제처리 
		menu19Repository.deleteClosingDate(closingDate);
		
		return dataResult;
	}
	
	
	/**
	 * 
	 * 팀별 마감일(데이터 입력 가부) 조회
	 * @param session		- controller의 HttpSession
	 * @param businessDate	- 거래일자
	 * @return boolean
	 * 		true	: 입력 가능
	 * 		false	: 입력 불가능
	 */
	public boolean checkClosingDate(UserVo authUser, Date businessDate) {
		// 마감일 정보 조회  
		ClosingDateVo closingDateVo = menu19Repository.selectClosingDateByYearMonth(businessDate);
		
		if (closingDateVo == null) {
			return true;
		}
		
		Date closingDate = null;
		
		switch(authUser.getTeamNo()) {
		case "1":		// 전표팀 마감일
			closingDate = closingDateVo.getClosingStatementDate();
			break;
			
		case "2":		// 매입팀 마감일
			closingDate = closingDateVo.getClosingPurchaseDate();
			break;
			
		case "3":		// 자산팀 마감일
			closingDate = closingDateVo.getClosingAssetsDate();
			break;
			
		case "4":		// 부채팀 마감이
			closingDate = closingDateVo.getClosingDebtDate();
			break;
			
		case "5":		// 매출팀 마감일
			closingDate = closingDateVo.getClosingSalesDate();
			break;
			
		case "6":		// 결산팀 마감일
			closingDate = closingDateVo.getClosingSettlementDate();
			break;
		}
		
		Calendar now = Calendar.getInstance();
		
		return (now.getTimeInMillis() <= getEndDate(closingDate)) ? true : false;
	}
	
	private Long getEndDate(Date closingDate) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(closingDate);

        calendar.set(Calendar.HOUR_OF_DAY,
                     calendar.getActualMaximum(Calendar.HOUR_OF_DAY));
        calendar.set(Calendar.MINUTE,
                     calendar.getActualMaximum(Calendar.MINUTE));
        calendar.set(Calendar.SECOND,
                     calendar.getActualMaximum(Calendar.SECOND));
        calendar.set(Calendar.MILLISECOND,
                     calendar.getActualMaximum(Calendar.MILLISECOND));
        
        return calendar.getTimeInMillis();
	}
	
	
	/**
	 * 
	 * 해당마감일의 수정삭제 가능여부 조회 
	 */
	public DataResult<ClosingDateVo> isChangable(ClosingDateVo closingDateVo) {
		DataResult<ClosingDateVo> dataResult = null;
		
		ClosingDateVo lastestClosedDate = menu19Repository.selectLastestClosedDateByClosingDateNoPerYear(closingDateVo);
		
		if (lastestClosedDate != null && lastestClosedDate.getNo() == closingDateVo.getNo()) {
			dataResult = new DataResult<>(lastestClosedDate);
		} else {
			dataResult = new DataResult<>();
			dataResult.setStatus(false);
		}
		
		return dataResult;
	}
}
