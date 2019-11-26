package kr.co.itcen.fa.service.menu12;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu12.Menu53Repository;

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

	public void test() {
		menu53Repository.test();
	}
}

