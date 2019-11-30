package kr.co.itcen.fa.service.menu17;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu17.Menu61Repository;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
import kr.co.itcen.fa.vo.menu17.TrialBalanceVo;


/**
 * 
 * @author 최웅
 * 결산작업
 */

@Service
public class Menu61Service {
	
	@Autowired
	private Menu61Repository menu61Repository;
	
	/**
	 * 
	 * 해당 마감일 결산처리
	 */
	public int executeSettlement(ClosingDateVo closingDateVo) {
		// TODO: 결산처리 비즈니스(시산표, 재무제표)
		
		return menu61Repository.executeSettlement(closingDateVo);
	}
	
	
	/**
	 * 
	 * 시산표 데이터 입력
	 */
	public int insertTrialBalance(TrialBalanceVo trialBalanceVo) {
		return menu61Repository.insertTrialBalance(trialBalanceVo);
	}
}
