package kr.co.itcen.fa.service.menu17;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu17.Menu64Repository;
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
	public boolean insertIncomeStatement(Long no){

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
		
		List<FinancialStatementVo> list = menu64Repository.selectIncomeStatementDataList(no);
		
		FinancialStatementVo vo = new FinancialStatementVo();
		vo.setAccountStatementType(list.get(0).getAccountStatementType());
		vo.setClosingDateNo(list.get(0).getClosingDateNo());
		vo.setInsertUserid(list.get(0).getInsertUserid());
		vo.setInsertDay(list.get(0).getInsertDay());
		
		for(FinancialStatementVo dataVo : list) {
			String voAccountNo = String.valueOf(dataVo.getAccountNo());
			
			if("5000000".equals(voAccountNo)){ //영업수익 값 저장
				monthOperatingRevenue = dataVo.getMonthToAmount();
				operatingRevenue = dataVo.getAmount();
			}
			if("6000000".equals(voAccountNo)){ //매출원가 값 저장
				monthCostOfGoodsSold = dataVo.getMonthToAmount();
				costOfGoodsSold = dataVo.getAmount();
			}
			if("8000000".equals(voAccountNo)) { //매출총이익 Data추가 및 판매비와일반관리비 값 저장
				monthSellingAndAdministrativeExpenses = dataVo.getMonthToAmount();
				sellingAndAdministrativeExpenses = dataVo.getAmount();

				monthGrossMargin = (monthOperatingRevenue - monthCostOfGoodsSold);
				grossMargin = (operatingRevenue - costOfGoodsSold);
				
				vo.setAccountOrder(orderNum++);
				vo.setAccountName("매출총이익");
				vo.setMonthToAmount(monthGrossMargin);
				vo.setAmount(grossMargin);
				
				menu64Repository.insertIncomeStatementData(vo);
			}
			if("9100000".equals(voAccountNo)) { //영업손익 Data추가 및  영업외수익 값 저장
				monthOperatingProfitAndLoss = (monthGrossMargin - monthSellingAndAdministrativeExpenses);
				operatingProfitAndLoss = (grossMargin - sellingAndAdministrativeExpenses);

				monthNonOperatingIncome = dataVo.getMonthToAmount();
				nonOperatingIncome = dataVo.getAmount();
				
				vo.setAccountOrder(orderNum++);
				vo.setAccountName("영업손익");
				vo.setMonthToAmount(monthOperatingProfitAndLoss);
				vo.setAmount(operatingProfitAndLoss);
				
				menu64Repository.insertIncomeStatementData(vo);
			}
			if("9200000".equals(voAccountNo)){ //영업외비용 값 저장
				monthNonOperatingExpenses = dataVo.getMonthToAmount();
				nonOperatingExpenses = dataVo.getAmount();
			}
			if("9500000".equals(voAccountNo)) { //법인세비용차감전손익 Data추가 및  법인세비용 값 저장
				monthIncomeAndLossBeforeIncomeTaxes = (monthOperatingProfitAndLoss + monthNonOperatingIncome - monthNonOperatingExpenses);
				incomeAndLossBeforeIncomeTaxes = (operatingProfitAndLoss + nonOperatingIncome - nonOperatingExpenses);
				
				monthCorporationTax = dataVo.getMonthToAmount();
				corporationTax = dataVo.getAmount();
				
				vo.setAccountOrder(orderNum++);
				vo.setAccountName("법인세비용차감전손익");
				vo.setMonthToAmount(monthIncomeAndLossBeforeIncomeTaxes);
				vo.setAmount(incomeAndLossBeforeIncomeTaxes);
				
				menu64Repository.insertIncomeStatementData(vo);
			}
			
			dataVo.setAccountOrder(orderNum++);
			menu64Repository.insertIncomeStatementData(dataVo);
		}
		
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
