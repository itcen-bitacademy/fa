package kr.co.itcen.fa.service.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu08.Menu39Repository;


/**
 * 
 *  @author 김민준
 *  건물관리
 */

@Service
public class Menu39Service {
	
	@Autowired
	private Menu39Repository menu39Repository;
	
	public void test() {
		menu39Repository.test();
	}
}
