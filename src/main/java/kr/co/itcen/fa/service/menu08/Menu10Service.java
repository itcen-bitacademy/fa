package kr.co.itcen.fa.service.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu08.Menu10Repository;


/**
 * 
 *  @author 정의돈
 *  토지현황조회
 */

@Service
public class Menu10Service {
	
	@Autowired
	private Menu10Repository menu10Repository;
	
	public void test() {
		menu10Repository.test();
	}
}
