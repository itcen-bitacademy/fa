package kr.co.itcen.fa.service.menu12;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu12.Menu57Repository;

/**
 * 
 * @author 곽세연
 * 월별거래처매출현황
 *
 */
@Service
public class Menu57Service {
	
	@Autowired
	private Menu57Repository menu57Repository;
	
	public void test() {
		menu57Repository.test();
	}

}
