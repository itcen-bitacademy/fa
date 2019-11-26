package kr.co.itcen.fa.service.menu12;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu12.Menu54Repository;

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
}
