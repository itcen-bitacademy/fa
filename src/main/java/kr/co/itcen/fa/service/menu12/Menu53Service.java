package kr.co.itcen.fa.service.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu12.Menu53Repository;
import kr.co.itcen.fa.vo.menu12.SellTaxbillVo;

/**
 * 
 * @author 안태영 (53)
 * 매출세금계산서관리
 *
 */
@Service
public class Menu53Service {
	
	@Autowired
	private Menu53Repository menu53Repository;

	// test 코드
	public void test() {
		//menu53Repository.test();
	}
	
	// 매출날짜와 매출코드를 기반으로 목록을 가져오는 기능
	public List<SellTaxbillVo> getAllList(String date, String no){
		return menu53Repository.getAllList(date, no);
	}
	
	
	// 매출세금계산서에서 발행되는 정보를 입력하는 기능
	public void insert(SellTaxbillVo selltaxbillvo) {
		menu53Repository.insert(selltaxbillvo);
	}
	
	// 매출세금계산서 발생했을시 
	public void salesUpdate(SellTaxbillVo selltaxbillvo) {
		menu53Repository.salesUpdate(selltaxbillvo);
	}
	
	// 매출세금계산서가 발행되고 비고를 수정할 때 사용
	public void taxbillupdate(SellTaxbillVo selltaxbillvo) {
		menu53Repository.taxbillupdate(selltaxbillvo);
	}
	
	// 매출세금계산서 항목 중 비고를 업데이트 했을때, 전표에 사용목적도 함께 업데이트 되도록 하는 기능
	public void voucherSystem(SellTaxbillVo sellTaxbillVo) {
		menu53Repository.voucherSystem(sellTaxbillVo);
	}
		
}

