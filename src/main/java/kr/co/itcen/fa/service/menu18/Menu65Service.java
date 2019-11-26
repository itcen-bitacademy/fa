package kr.co.itcen.fa.service.menu18;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu18.Menu65Repository;

/**
 * 
 *  @author 안대혁
 *  공통코드관리
 */
@Service
public class Menu65Service {
	
	@Autowired
	private Menu65Repository menu65Repository;
	
	public void test() {
		menu65Repository.test();
	}
}
