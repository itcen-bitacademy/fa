package kr.co.itcen.fa.service.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu08.Menu42Repository;


/**
 * 
 *  @author 권영미
 *  차량현황조회
 */

@Service
public class Menu42Service {
	
	@Autowired
	private Menu42Repository menu42Repository;
	
	public void test() {
		menu42Repository.test();
	}
}
