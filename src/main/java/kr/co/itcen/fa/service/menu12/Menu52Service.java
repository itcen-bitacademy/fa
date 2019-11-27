package kr.co.itcen.fa.service.menu12;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu12.Menu52Repository;

/**
 * 
 * @author 양홍석
 * 매출거래처현황조회
 *
 */
@Service
public class Menu52Service {
	
	@Autowired
	private Menu52Repository menu52Repository;
	
	public void test() {
		menu52Repository.test();
	}

}
