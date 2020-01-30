package kr.co.itcen.fa.service.menu12;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu12.Menu67Repository;

/**
 * 
 * @author 안태영
 * 매출관리 : 통계조회 Service
 *
 */
@Service
public class Menu67Service {
	
	@Autowired
	private Menu67Repository menu67Repository;
	
	
	// 2019 세금계산서 발행 건수
	public Map get2019MonthTaxbill(int searchYear){
		
		List<Map> taxbill = menu67Repository.get2019MonthTaxbill(searchYear);
		
		System.out.println("taxbill2019 : " + taxbill);
			
		List<Long> sMonthSumList = getMonthSumList(taxbill);
	
		List<Integer> monthRangeList = getMonthRangeList();
		
		Map map = new HashMap();
		map.put("taxbill", sMonthSumList);
		map.put("xAxis", monthRangeList);
		return map;
	}
	
	// 2020 세금계산서 발행 건수
	public Map get2020MonthTaxbill(int searchYear){
			
			List<Map> taxbill = menu67Repository.get2020MonthTaxbill(searchYear);
			
			System.out.println("taxbill2020 : " + taxbill);
				
			List<Long> sMonthSumList = getMonthSumList(taxbill);
		
			List<Integer> monthRangeList = getMonthRangeList();
			
			Map map = new HashMap();
			map.put("taxbill", sMonthSumList);
			map.put("xAxis", monthRangeList);
			return map;
	}
	
	// 2019 월별 매출 합계
	public Map get2019MonthSales(int searchYear){
				
		List<Map> sales = menu67Repository.get2019MonthSales(searchYear);
		
		System.out.println("sales2019 : " + sales);
			
		List<Long> sMonthSumList = getMonthSumList(sales);
	
		List<Integer> monthRangeList = getMonthRangeList();
		
		Map map = new HashMap();
		map.put("sales", sMonthSumList);
		map.put("xAxis", monthRangeList);
		return map;
	}
	
	// 2020 월별 매출 합계
		public Map get2020MonthSales(int searchYear){
			
			List<Map> sales = menu67Repository.get2020MonthSales(searchYear);
			
			System.out.println("sales2020 : " + sales);
				
			List<Long> sMonthSumList = getMonthSumList(sales);
		
			List<Integer> monthRangeList = getMonthRangeList();
			
			Map map = new HashMap();
			map.put("sales", sMonthSumList);
			map.put("xAxis", monthRangeList);
			return map;
		}
	
	public List<Long> getMonthSumList(List<Map> list){
		List<Long> monthSumList = new ArrayList<Long>();
		for(int i=1; i<= 12; ++i) {							//(조회년도 -10) ~ 조회년도 : 10년간의 범위
			Long sum = 0L;
			
			for(Map map : list) {							//리스트를 순회하면서 해당월이 있는지 확인
				Integer month = (Integer)map.get("month");
				if(month == i) {							//해당월이 있으면 sum값으로 입력
					sum =getLongFromMap(map.get("sum"));
					break;
				}
			}
			monthSumList.add(sum);
		}
		
		return monthSumList;
	}
	
	public List<Integer> getMonthRangeList(){
		List<Integer> list = new ArrayList();

		for(int i=1; i<= 12; ++i) {					//1 ~ 12 
			list.add(i);
		}
		return list;
	}
	
	public Long getLongFromMap(Object value) {
		Long resultVal=0L;
		if(value instanceof BigDecimal) {
			BigDecimal v = (BigDecimal)value;
			resultVal= Long.valueOf(v.toString());
		}else {
			resultVal = (Long)value;
		}
			
		return resultVal;
	}
	
}
