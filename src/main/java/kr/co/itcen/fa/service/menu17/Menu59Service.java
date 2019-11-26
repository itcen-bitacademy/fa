package kr.co.itcen.fa.service.menu17;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu17.Menu59Repository;


/**
 * 
 * @author 이성훈
 * 재무제표계정관리
 */

@Service
public class Menu59Service {
	
	@Autowired
	private Menu59Repository menu59Repository;
	
	public void test() {
		menu59Repository.test();
	}
}
