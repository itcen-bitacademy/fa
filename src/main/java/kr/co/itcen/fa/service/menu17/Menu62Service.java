package kr.co.itcen.fa.service.menu17;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu17.Menu62Repository;


/**
 * 
 * @author 최웅
 * 합계잔액시산표조회
 */

@Service
public class Menu62Service {
	
	@Autowired
	private Menu62Repository menu62Repository;
	
	public void test() {
		menu62Repository.test();
	}
}
