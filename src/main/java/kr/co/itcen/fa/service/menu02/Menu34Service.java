package kr.co.itcen.fa.service.menu02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu02.Menu34Repository;

/**
 * 
 * @author 강민호
 * 매입품목현황조회
 *
 */

@Service
public class Menu34Service {
	@Autowired
	private Menu34Repository menu34Repository;
	
	public void test() {
		menu34Repository.test();
	}
}
