package kr.co.itcen.fa.service.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu08.Menu41Repository;


/**
 * 
 *  @author 권영미
 *  차량관리
 */

@Service
public class Menu41Service {
	
	@Autowired
	private Menu41Repository menu41Repository;
	
	public void test() {
		menu41Repository.test();
	}
}
