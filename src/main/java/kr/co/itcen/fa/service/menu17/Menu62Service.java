package kr.co.itcen.fa.service.menu17;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu17.Menu62Repository;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
import kr.co.itcen.fa.vo.menu17.Menu17SearchForm;
import kr.co.itcen.fa.vo.menu17.TrialBalanceVo;


/**
 * 
 * @author 최웅
 * 합계잔액시산표조회
 */

@Service
public class Menu62Service {
	
	@Autowired
	private Menu62Repository menu62Repository;
	
	/**
	 * 
	 * 결산일별 시산표 데이터 조회
	 */
	public List<TrialBalanceVo> selectTrialBalanceByClosingDateNo(Menu17SearchForm menu17SearchForm) {
		return menu62Repository.selectTrialBalanceByClosingDateNo(menu17SearchForm);
	}
	
	
	/**
	 * 
	 * 결산일별 시산표 데이터 삭제
	 */
	public int deleteTrialBalanceByClosingDateNo(TrialBalanceVo trialBalanceVo) {
		return menu62Repository.deleteTrialBalanceByClosingDateNo(trialBalanceVo);
	}

	
	/**
	 * 
	 * 결산완료된 마감일자 조회
	 */
	public List<ClosingDateVo> selectAllClosedDate() {
		return menu62Repository.selectAllClosedDate();
	}
}
