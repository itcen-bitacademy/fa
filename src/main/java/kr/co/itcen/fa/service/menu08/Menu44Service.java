package kr.co.itcen.fa.service.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu08.Menu44Repository;


/**
 * 
 *  @author 김유진
 *  무형자산조회
 */

@Service
public class Menu44Service {
	
	@Autowired
	private Menu44Repository menu44Repository;
	
	public void test() {
		menu44Repository.test();
	}
}