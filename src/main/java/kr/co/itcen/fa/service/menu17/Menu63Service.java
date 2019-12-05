package kr.co.itcen.fa.service.menu17;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu17.Menu63Repository;


/**
 * 
 * @author 유지훈
 * 대차대조표조회
 */

@Service
public class Menu63Service {
	
	@Autowired
	private Menu63Repository menu63Repository;
	
	public void test() {
		menu63Repository.test();
	}
	

}
