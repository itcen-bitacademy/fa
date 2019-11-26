package kr.co.itcen.fa.service.menu02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu02.Menu33Repository;


/**
 * 
 * @author 강민호
 * 매입품목관리
 *
 */

@Service
public class Menu33Service {
	
	@Autowired
	private Menu33Repository menu33Repository;
	
	public void test() {
		menu33Repository.test();
	}
}
