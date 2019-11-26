package kr.co.itcen.fa.service.menu17;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu17.Menu60Repository;


/**
 * 
 * @author 이성훈
 * 재무제표계정현황조회
 */

@Service
public class Menu60Service {
	
	@Autowired
	private Menu60Repository menu60Repository;
	
	public void test() {
		menu60Repository.test();
	}
}
