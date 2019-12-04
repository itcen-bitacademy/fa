package kr.co.itcen.fa.service.menu17;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu17.Menu61Repository;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
import kr.co.itcen.fa.vo.menu17.Menu17SearchForm;
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
	public DataResult<Object> executeSettlement(Menu17SearchForm menu17SearchForm) {
		DataResult<Object> dataResult = new DataResult<>();
		
		// 결산 순서 유효성검사 
		ClosingDateVo lastestUnclosingDateVo = menu61Repository.selectLastestUnclosingDatePerYear(menu17SearchForm);
		if (lastestUnclosingDateVo.getNo() != menu17SearchForm.getClosingDateNo()) {
			dataResult = new DataResult<>();
			dataResult.setStatus(false);
			dataResult.setError("이전월의 결산작업을 먼저 실행해주세요.");
			
			return dataResult;
		}
		
		// 시산표 작성 
		// 해당년도 전월 결산완료일 조회 - 1월일 경우 전월데이터값은 없는것으로 간주 
		ClosingDateVo lastestClosingDateVo = menu61Repository.selectLastestClosedDateByClosingDateNoPerYear(menu17SearchForm);
		if (lastestClosingDateVo == null) {
			lastestClosingDateVo = new ClosingDateVo();
			lastestClosingDateVo.setNo(0L);
		}
		menu17SearchForm.setLastestClosingDateNo(lastestClosingDateVo.getNo());
		
		// 전월 데이터 포함 시산값 조회
		List<TrialBalanceVo> emptyTrialBalance = menu61Repository.selectEmptyTrialBalance(menu17SearchForm);
		
		// 시산표 맵으로 변경 
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
		
		// 빈값 계정 제거 
		List<TrialBalanceVo> insertTrialBalanceList = emptyTrialBalance.stream().filter(t -> t.getCreditTotal() != null || t.getCreditSpotMonth() != null || t.getDebtorTotal() != null || t.getDebtorSpotMonth() != null).collect(Collectors.toList());

		// 시산표 저장 
//		for (TrialBalanceVo tbVo : emptyTrialBalance) {			// null포함 시산표 전체 저장 
		for (TrialBalanceVo tbVo : insertTrialBalanceList) {
			tbVo.setCloSingDateNo(menu17SearchForm.getClosingDateNo());
			tbVo.setInsertUserid(menu17SearchForm.getInsertUserid());
			menu61Repository.insertTrialBalance(tbVo);
		}
		
		// TODO: 재무제표 작성 

		// 결산완료 마감일 업데이트 
		menu61Repository.executeSettlement(menu17SearchForm);
		
		return dataResult;
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
	 * 시산표 데이터 적산
	 */
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
	
	
	/**
	 * 
	 * 해당 마감일의 시산표 및 재무제표 데이터 삭제 
	 */
	public DataResult<Object> deleteTrialBalanceByClosingDateNo(ClosingDateVo closingDateVo) {
		// 시산표 데이터 삭제 
		menu61Repository.deleteTrialBalanceByClosingDateNo(closingDateVo);
		
		// TODO: 재무제표 데이터 삭제 
		
		return new DataResult<Object>();
	}
}
