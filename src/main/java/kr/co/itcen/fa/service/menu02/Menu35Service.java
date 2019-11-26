package kr.co.itcen.fa.service.menu02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu02.Menu35Repository;

/**
 * 
 * @author 이지은
 * 매입거래처관리
 *
 */

@Service
public class Menu35Service {
	@Autowired
	private Menu35Repository menu35Repository;
	
	public void test() {
		menu35Repository.test();
	}
}
