package kr.co.itcen.fa.service.menu11;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu11.Menu16Repository;

/**
 * 
 * @author 박준호
 * 사채관리
 *
 */
@Service
public class Menu16Service {
	
	@Autowired
	private Menu16Repository menu16Repository;
	
	public void test() {
		menu16Repository.test();
	}
}
