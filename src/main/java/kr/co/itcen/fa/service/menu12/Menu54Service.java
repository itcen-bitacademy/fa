package kr.co.itcen.fa.service.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu12.Menu54Repository;
import kr.co.itcen.fa.vo.menu12.SellTaxbillVo;

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
}
