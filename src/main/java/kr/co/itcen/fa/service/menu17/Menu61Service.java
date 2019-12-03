package kr.co.itcen.fa.service.menu17;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu17.Menu61Repository;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
import kr.co.itcen.fa.vo.menu17.TestStatementDataVo;
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
		// 빈 시산표 생성
		List<TrialBalanceVo> emptyTrialBalance = menu61Repository.selectEmptyTrialBalance();
		// 시산표 맵으로 변경
		Map<Long, TrialBalanceVo> trialBalanceMap = emptyTrialBalance.stream().collect(Collectors.toMap(TrialBalanceVo::getAccountNo, trialBalance -> trialBalance));
		
		// 테스전표 데이터 조회
		// TODO: 실제 데이터로 변경
		// TODO: 조회기간 추가
		List<TestStatementDataVo> testList = menu61Repository.testStatementData();
		
		for (TestStatementDataVo vo : testList) {
			TrialBalanceVo tbVo = trialBalanceMap.get(vo.getAccountNo());
			if (vo.getAmountFlag().equalsIgnoreCase("c")) {
				tbVo.setCreditSpotMonth(vo.getAmount());
			} else {
				tbVo.setDebtorSpotMonth(vo.getAmount());
			}
		}
		
		return menu61Repository.executeSettlement(closingDateVo);
	}
	
	
	/**
	 * 
	 * 시산표 데이터 입력
	 */
	public int insertTrialBalance(TrialBalanceVo trialBalanceVo) {
		return menu61Repository.insertTrialBalance(trialBalanceVo);
	}
	
	/**
	 * 
	 * 결산 테스트 작업
	 */
	public int testSettlement() {
		// 빈 시산표 생성
		List<TrialBalanceVo> emptyTrialBalance = menu61Repository.selectEmptyTrialBalance();
		// 시산표 맵으로 변
		Map<Long, TrialBalanceVo> trialBalanceMap = emptyTrialBalance.stream().collect(Collectors.toMap(TrialBalanceVo::getAccountNo, trialBalance -> trialBalance));
		
		// 테스전표 데이터 조회
		// TODO: 실제 데이터로 변경
		// TODO: 조회기간 추가
		List<TestStatementDataVo> testList = menu61Repository.testStatementData();
		
		// 시산표 값 적산
		for (TestStatementDataVo vo : testList) {
			TrialBalanceVo tbVo = null;
			if (vo.getAccountNo() >= 5000000) {
				tbVo = trialBalanceMap.get(vo.getAccountNo());
				addAccountAmount(tbVo, vo, vo.getAmountFlag());
			}
			
			tbVo = trialBalanceMap.get(vo.getParent1());
			addAccountAmount(tbVo, vo, vo.getAmountFlag());
			
			if (vo.getParent2() == null || vo.getParent2().longValue() == 0) { continue; }
			tbVo = trialBalanceMap.get(vo.getParent2());
			addAccountAmount(tbVo, vo, vo.getAmountFlag());
			
			if (vo.getParent3() == null || vo.getParent3().longValue() == 0) { continue; }
			tbVo = trialBalanceMap.get(vo.getParent3());
			addAccountAmount(tbVo, vo, vo.getAmountFlag());
			
			if (vo.getParent4() == null || vo.getParent4().longValue() == 0) { continue; }
			tbVo = trialBalanceMap.get(vo.getParent4());
			addAccountAmount(tbVo, vo, vo.getAmountFlag());
			
			if (vo.getParent5() == null || vo.getParent5().longValue() == 0) { continue; }
			tbVo = trialBalanceMap.get(vo.getParent5());
			addAccountAmount(tbVo, vo, vo.getAmountFlag());
		}
		
		
		
		// null값 제거
		List<TrialBalanceVo> insertTrialBalanceList = emptyTrialBalance.stream().filter(t -> t.getCreditTotal() != null || t.getCreditSpotMonth() != null || t.getDebtorTotal() != null || t.getDebtorSpotMonth() != null).collect(Collectors.toList());
		
//		for (TrialBalanceVo tbVo : emptyTrialBalance) {
//			tbVo.setCloSingDateNo(52L);
//			tbVo.setInsertUserid("u024");
//			menu61Repository.insertTrialBalance(tbVo);
//		}
		
		for (TrialBalanceVo tbVo : insertTrialBalanceList) {
			tbVo.setCloSingDateNo(51L);
			tbVo.setInsertUserid("u024");
			menu61Repository.insertTrialBalance(tbVo);
		}
		
		return 1;
	}
	
	private void addAccountAmount(TrialBalanceVo tbVo, TestStatementDataVo vo, String type) {
		if (type.equalsIgnoreCase("C")) {	// 차변 계산
			// 당월 차변 계산
			Long creditSpotMonth = (tbVo.getCreditSpotMonth() == null) ? 0 : tbVo.getCreditSpotMonth();
			tbVo.setCreditSpotMonth(creditSpotMonth + vo.getAmount());
			
			// 차변 합계 계산
			Long creditTotal = (tbVo.getCreditTotal() == null) ? 0 : tbVo.getCreditTotal();
			tbVo.setCreditTotal(creditTotal + vo.getAmount());
		} else {							// 대변 계산
			// 당월 대변 계산
			Long debtorSpotMonth = (tbVo.getDebtorSpotMonth() == null) ? 0 : tbVo.getDebtorSpotMonth();
			tbVo.setDebtorSpotMonth(debtorSpotMonth + vo.getAmount());
			
			// 대변 합계 계산
			Long debtorTotal = (tbVo.getDebtorTotal() == null) ? 0 : tbVo.getDebtorTotal();
			tbVo.setDebtorTotal(debtorTotal + vo.getAmount());
			
		}
	}
}
