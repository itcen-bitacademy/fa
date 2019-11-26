package kr.co.itcen.fa.service.menu02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu02.Menu07Repository;

/**
 * 
 * @author 윤종진
 * 매입현황조회
 *
 */

@Service
public class Menu07Service {
	@Autowired
	private Menu07Repository menu07Repository;
	
	public void test() {
		menu07Repository.test();
	}
}
