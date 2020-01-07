package kr.co.itcen.fa.service.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu12.Menu54Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu12.SellTaxbillVo;
import kr.co.itcen.fa.vo.menu12.TaxbillSearchVo;

/**
 * 
 * @author 안태영  (54)
 * 매출세금계산서현황조회
 *
 */
@Service
public class Menu54Service {
	
	@Autowired
	private Menu54Repository menu54Repository;

	public void test() {
		menu54Repository.test();
	}
	
	// 거래처에 대한 목록을 가져오는 기능
	public List<SellTaxbillVo> salesCustomer(){
		return menu54Repository.salesCustomer();
	}
	
	//품목에 대한 목록을 가져오는 기능
	public List<SellTaxbillVo> salesItems(){
		return menu54Repository.salesItems();
	}
	
	//세금계산서에 대한 목록을 가져오는 기능
	public List<SellTaxbillVo> taxbillList(){
		return menu54Repository.taxbillList();
	}
	
	//전체 리스트가 출력되게 하는 기능
	public DataResult<SellTaxbillVo> taxbillAllList(int page){
		DataResult<SellTaxbillVo> dataResult = new DataResult<>();
		
		int totalCount = menu54Repository.taxbillAllCount(); // 전체 목록에 대한 갯수를 가져오는 기능 !!!
		System.out.println("조회기능 없는 리스트 :" + totalCount);
		
		PaginationUtil paginationUtil = new PaginationUtil(page, totalCount, 11, 5);
		dataResult.setPagination(paginationUtil);
		
		TaxbillSearchVo searchvo = new TaxbillSearchVo();
		searchvo.setPagination(paginationUtil);
		
		List<SellTaxbillVo> list = menu54Repository.taxbillAllList(searchvo);
		dataResult.setDatas(list);
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getIdx());
		}
		
		return dataResult;
	}
	
	
	public DataResult<SellTaxbillVo> taxbillSearch(TaxbillSearchVo taxbillsearchvo, int page, int viewCount){
		DataResult<SellTaxbillVo> dataResult = new DataResult<>();
		
		System.out.println("검색 리스트 조회 - 서비스");
		
		// 검색 필터를 통해 출력되는 전체 리스트의 항목을 가져오는 기능
		int totalCount = menu54Repository.taxbillsearchcount(taxbillsearchvo);
		
		if(totalCount<=11) {
			viewCount = totalCount;
		}
		
		PaginationUtil paginationUtil = new PaginationUtil(page, totalCount, viewCount, 5);
		dataResult.setPagination(paginationUtil);
		
		taxbillsearchvo.setPagination(paginationUtil);
		
		List<SellTaxbillVo> list = menu54Repository.taxbillSearch(taxbillsearchvo);
		dataResult.setDatas(list);
		
		return dataResult;
	}
	
	public List<TaxbillSearchVo> subTaxbillno(TaxbillSearchVo vo){
		System.out.println("Ajax를 통한 세금계산서 번호 출력");
		List<TaxbillSearchVo> list = menu54Repository.subTaxbillno(vo);
		return list; 
	}
	
	
	
}
