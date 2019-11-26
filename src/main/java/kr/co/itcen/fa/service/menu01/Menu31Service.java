package kr.co.itcen.fa.service.menu01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu01.Menu31Repository;

/**
 * 
 * @author 임성주
 * 계정별원장조회
 *
 */
@Service
public class Menu31Service {
	
	@Autowired
	private Menu31Repository menu31Repository;
	
	public void test() {
		menu31Repository.test();
	}
}
