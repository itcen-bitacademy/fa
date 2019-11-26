package kr.co.itcen.fa.service.menu01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu01.Menu05Repository;
import kr.co.itcen.fa.repository.menu01.Menu25Repository;

/**
 * 
 * @author 김승곤
 * 카드관리
 *
 */
@Service
public class Menu05Service {
	
	@Autowired
	private Menu05Repository menu05Repository;
	
	public void test() {
		menu05Repository.test();
	}
}
