package kr.co.itcen.fa.service.menu17;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu17.Menu19Repository;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;


/**
 * 
 * @author 김재원
 * 마감일자관리
 */

@Service
public class Menu19Service {
	
	@Autowired
	private Menu19Repository menu19Repository;
	
	public void test() {
		menu19Repository.test();
	}
	
	/**
	 * 
	 * 마감일 등록
	 */
	public int insertClosingDate(ClosingDateVo closingDate) {
		return menu19Repository.insertClosingDate(closingDate);
	}
	
	/**
	 * 
	 * 마감일 전체 조회(마감일순 내림차순)
	 */
	public List<ClosingDateVo> selectAllClosingDate() {
		return menu19Repository.selectAllClosingDate();
	}
	
	
	/**
	 * 
	 * 마감일 수정(미결산 마감일만 수정 가능)
	 */
	public int updateClosingDate(ClosingDateVo closingDate) {
		return menu19Repository.updateClosingDate(closingDate);
	}
	
	
	/**
	 * 
	 * 마감일 삭제(미결산 마감일만 삭제 가능)
	 */
	public int deleteClosingDate(ClosingDateVo closingDate) {
		return menu19Repository.deleteClosingDate(closingDate);
	}
	
	
	/**
	 * 
	 * 팀별 데이터 입력 가부 조회
	 * @param session		- controller의 HttpSession
	 * @param businessDate	- 거래일자
	 * @return boolean
	 * 		true	: 입력 가능
	 * 		false	: 입력 불가능
	 */
	public boolean checkClosingDate(HttpSession session, Date businessDate) {
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		
		ClosingDateVo closingDateVo = null;
		
		switch(authUser.getTeamNo()) {
		case "1":		// 전표팀 마감일 조회
			closingDateVo = menu19Repository.selectStatementClosingDateByBusinessDate(businessDate);
			break;
			
		case "2":		// 매입팀 마감일 조회
			closingDateVo = menu19Repository.selectPurchaseClosingDateByBusinessDate(businessDate);
			break;
			
		case "3":		// 자산팀 마감일 조회
			closingDateVo = menu19Repository.selectAssetsClosingDateByBusinessDate(businessDate);
			break;
			
		case "4":		// 부채팀 마감이 조회
			closingDateVo = menu19Repository.selectDebtClosingDateByBusinessDate(businessDate);
			break;
			
		case "5":		// 매출팀 마감일 조회
			closingDateVo = menu19Repository.selectSalesClosingDateByBusinessDate(businessDate);
			break;
			
		case "6":		// 결산팀 마감일 조회
			closingDateVo = menu19Repository.selectSettlementClosingDate();
			break;
		}
		
		return (closingDateVo == null) ? false : true;
	}
}
