package kr.co.itcen.fa.service.menu12;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu12.Menu56Repository;

/**
 * 
 * @author 곽세연
 * 품목대분류별 매입매출현황
 *
 */
@Service
public class Menu56Service {
	
	@Autowired
	private Menu56Repository menu56Repository;
	
	public void test() {
		menu56Repository.test();
	}

}
