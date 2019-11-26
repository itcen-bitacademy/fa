package kr.co.itcen.fa.service.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu08.Menu09Repository;


/**
 * 
 *  @author 정의돈
 *  토지관리
 */

@Service
public class Menu09Service {
	
	@Autowired
	private Menu09Repository menu09Repository;
	
	public void test() {
		menu09Repository.test();
	}
}
