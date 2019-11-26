package kr.co.itcen.fa.service.menu17;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu17.Menu20Repository;

/**
 * 
 * @author 김재원
 * 마감현황관리
 */

@Service
public class Menu20Service {
	
	@Autowired
	private Menu20Repository menu20Repository;
	
	public void test() {
		menu20Repository.test();
	}
}
