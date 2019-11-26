package kr.co.itcen.fa.service.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu08.Menu43Repository;


/**
 * 
 *  @author 김유진
 *  무형자산관리
 */

@Service
public class Menu43Service {
	
	@Autowired
	private Menu43Repository menu43Repository;
	
	public void test() {
		menu43Repository.test();
	}
}
