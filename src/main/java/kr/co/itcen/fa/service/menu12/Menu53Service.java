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
	
	
}

