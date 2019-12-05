package kr.co.itcen.fa.service.menu17;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu17.Menu64Repository;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
import kr.co.itcen.fa.vo.menu17.FinancialStatementVo;


/**
 * 
 * @author 유지훈
 * 손익계산서조회
 */

@Service
public class Menu64Service {
	
	@Autowired
	private Menu64Repository menu64Repository;
	
	//손익계산서(IncomeStatement) insert Service
	public boolean insertIncomeStatement(ClosingDateVo closingDate){

		Long orderNum = 1L;
		Long operatingRevenue = 0L;						//영업수익
		Long monthOperatingRevenue = 0L;				//영업수익(당월)
		Long costOfGoodsSold = 0L;						//매출원가
		Long monthCostOfGoodsSold = 0L;					//매출원가(당월)
		Long grossMargin = 0L;							//매출총이익
		Long monthGrossMargin = 0L;						//매출총이익(당월)
		Long sellingAndAdministrativeExpenses = 0L;		//판매비와일반관리비
		Long monthSellingAndAdministrativeExpenses = 0L;//판매비와일반관리비(당월)
		Long operatingProfitAndLoss = 0L;				//영업손익
		Long monthOperatingProfitAndLoss = 0L;			//영업손익(당월)
		Long nonOperatingIncome = 0L;					//영업외수익
		Long monthNonOperatingIncome = 0L;				//영업외수익(당월)
		Long nonOperatingExpenses = 0L;					//영업외비용
		Long monthNonOperatingExpenses = 0L;			//영업외비용(당월)
		Long incomeAndLossBeforeIncomeTaxes = 0L;		//법인세비용차감전손익
		Long monthIncomeAndLossBeforeIncomeTaxes = 0L;	//법인세비용차감전손익(당월)
		Long corporationTax = 0L;						//법인세비용
		Long monthCorporationTax = 0L;					//법인세비용(당월)
		
		
		List<FinancialStatementVo> list = menu64Repository.selectIncomeStatementDataList(closingDate);
		FinancialStatementVo vo = new FinancialStatementVo();
		vo.setAccountStatementType(list.get(0).getAccountStatementType());
		vo.setClosingDateNo(list.get(0).getClosingDateNo());
		vo.setInsertUserid(list.get(0).getInsertUserid());
		vo.setInsertDay(list.get(0).getInsertDay());
		
		for(FinancialStatementVo dataVo : list) {
			Long voAccountNo = dataVo.getAccountNo();
			
			if(voAccountNo == 5000000){ //영업수익 값 저장
				monthOperatingRevenue = dataVo.getMonthToAmount();
				operatingRevenue = dataVo.getAmount();
			}
			if(voAccountNo == 6000000){ //매출원가 값 저장
				monthCostOfGoodsSold = dataVo.getMonthToAmount();
				costOfGoodsSold = dataVo.getAmount();
			}
			if(voAccountNo == 8000000) { // 판매비와일반관리비 값 저장
				monthSellingAndAdministrativeExpenses = dataVo.getMonthToAmount();
				sellingAndAdministrativeExpenses = dataVo.getAmount();
			}
			if(voAccountNo == 9100000) { // 영업외수익 값 저장
				monthNonOperatingIncome = dataVo.getMonthToAmount();
				nonOperatingIncome = dataVo.getAmount();
			}
			if(voAccountNo == 9200000) { // 영업외비용 값 저장
				monthNonOperatingExpenses = dataVo.getMonthToAmount();
				nonOperatingExpenses = dataVo.getAmount();
			}
			if(voAccountNo == 9500000) { // 법인세비용 값 저장
				monthCorporationTax = dataVo.getMonthToAmount();
				corporationTax = dataVo.getAmount();
			}
		}	
		
		vo.setAccountName("영업수익");
		vo.setAccountOrder(orderNum++);
		vo.setMonthToAmount(monthOperatingRevenue);
		vo.setAmount(operatingRevenue);
		menu64Repository.insertIncomeStatementData(vo);
		
		vo.setAccountName("매출원가");
		vo.setAccountOrder(orderNum++);
		vo.setMonthToAmount(monthCostOfGoodsSold);
		vo.setAmount(costOfGoodsSold);
		menu64Repository.insertIncomeStatementData(vo);
		
		vo.setAccountName("매출총이익");
		vo.setAccountOrder(orderNum++);
		monthGrossMargin = monthOperatingRevenue - monthCostOfGoodsSold;
		grossMargin = operatingRevenue - costOfGoodsSold;
		vo.setMonthToAmount(monthGrossMargin);
		vo.setAmount(grossMargin);
		menu64Repository.insertIncomeStatementData(vo);
		
		vo.setAccountName("판매비와일반관리비");
		vo.setAccountOrder(orderNum++);
		vo.setMonthToAmount(monthSellingAndAdministrativeExpenses);
		vo.setAmount(sellingAndAdministrativeExpenses);
		menu64Repository.insertIncomeStatementData(vo);
		
		vo.setAccountName("영업손익");
		vo.setAccountOrder(orderNum++);
		monthOperatingProfitAndLoss = monthGrossMargin - monthSellingAndAdministrativeExpenses;
		operatingProfitAndLoss = grossMargin - sellingAndAdministrativeExpenses;
		vo.setMonthToAmount(monthOperatingProfitAndLoss);
		vo.setAmount(operatingProfitAndLoss);
		menu64Repository.insertIncomeStatementData(vo);
		
		vo.setAccountName("영업외수익");
		vo.setAccountOrder(orderNum++);
		vo.setMonthToAmount(monthNonOperatingIncome);
		vo.setAmount(nonOperatingIncome);
		menu64Repository.insertIncomeStatementData(vo);
		
		vo.setAccountName("영업외비용");
		vo.setAccountOrder(orderNum++);
		vo.setMonthToAmount(monthNonOperatingExpenses);
		vo.setAmount(nonOperatingExpenses);
		menu64Repository.insertIncomeStatementData(vo);
		
		vo.setAccountOrder(orderNum++);
		vo.setAccountName("법인세비용차감전손익");
		monthIncomeAndLossBeforeIncomeTaxes = monthOperatingProfitAndLoss + monthNonOperatingIncome - monthNonOperatingExpenses;
		incomeAndLossBeforeIncomeTaxes = operatingProfitAndLoss + nonOperatingIncome - nonOperatingExpenses;
		vo.setMonthToAmount(monthIncomeAndLossBeforeIncomeTaxes);
		vo.setAmount(incomeAndLossBeforeIncomeTaxes);
		menu64Repository.insertIncomeStatementData(vo);
		
		vo.setAccountOrder(orderNum++);
		vo.setAccountName("법인세비용");
		vo.setMonthToAmount(monthCorporationTax);
		vo.setAmount(corporationTax);
		menu64Repository.insertIncomeStatementData(vo);
		
		vo.setAccountOrder(orderNum);
		vo.setAccountName("당기순손익");
		vo.setMonthToAmount(monthIncomeAndLossBeforeIncomeTaxes - monthCorporationTax);
		vo.setAmount(incomeAndLossBeforeIncomeTaxes - corporationTax);
		menu64Repository.insertIncomeStatementData(vo);
		
		return true;
	}
	
	
	//손익계산서(IncomeStatement) get Service
	public Map<String,Object> get(Long no) {
		return menu64Repository.get(no);
	}
	
}
