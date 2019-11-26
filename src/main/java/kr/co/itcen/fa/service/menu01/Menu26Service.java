package kr.co.itcen.fa.service.menu01;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu01.Menu26Repository;

/**
 * 
 * @author 황슬기 
 * 계좌조회
 *
 */
@Service
public class Menu26Service {
	
	@Autowired
	private Menu26Repository menu26Repository;
	
	public void test() {
		menu26Repository.test();
	}
}