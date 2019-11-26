package kr.co.itcen.fa.service.menu02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu02.Menu06Repository;

/**
 * 
 * @author 윤종진
 * 매입관리
 *
 */

@Service
public class Menu06Service {
	@Autowired
	private Menu06Repository menu06Repository;
	
	public void test() {
		menu06Repository.test();
	}
}
