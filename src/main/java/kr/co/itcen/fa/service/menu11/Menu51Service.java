package kr.co.itcen.fa.service.menu11;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu11.Menu51Repository;

/**
 * 
 * @author 박준호
 * 사채현황조회
 *
 */
@Service
public class Menu51Service {
	
	@Autowired
	private Menu51Repository menu51Repository;
	
	public void test() {
		menu51Repository.test();
	}
}
