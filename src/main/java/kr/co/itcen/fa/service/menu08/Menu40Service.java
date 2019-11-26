package kr.co.itcen.fa.service.menu08;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu08.Menu40Repository;


/**
 * 
 *  @author 김민준
 *  건물현황조회
 */

@Service
public class Menu40Service {
	
	@Autowired
	private Menu40Repository menu40Repository;
	
	public void test() {
		menu40Repository.test();
	}
}
