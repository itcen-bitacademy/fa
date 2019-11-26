package kr.co.itcen.fa.service.menu11;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu11.Menu45Repository;

/**
 * 
 * @author 이지수
 * 은행코드현황조회
 *
 */
@Service
public class Menu45Service {
	
	@Autowired
	private Menu45Repository menu45Repository;
	
	public void test() {
		menu45Repository.test();
	}
}
