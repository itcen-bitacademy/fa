package kr.co.itcen.fa.service.menu02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu02.Menu36Repository;

/**
 * 
 * @author 이지은
 * 매입거래처현황조회
 *
 */

@Service
public class Menu36Service {
	@Autowired
	private Menu36Repository menu36Repository;
	
	public void test() {
		menu36Repository.test();
	}
}
