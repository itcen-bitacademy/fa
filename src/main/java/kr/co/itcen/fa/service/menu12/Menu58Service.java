package kr.co.itcen.fa.service.menu12;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu12.Menu58Repository;

/**
 * 
 * @author 양홍석
 * 월별거래처매입현황
 *
 */
@Service
public class Menu58Service {
	
	@Autowired
	private Menu58Repository menu58Repository;
	
	public void test() {
		menu58Repository.test();
	}

}
