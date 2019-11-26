package kr.co.itcen.fa.service.menu17;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu17.Menu61Repository;


/**
 * 
 * @author 최웅
 * 결산작업
 */

@Service
public class Menu61Service {
	
	@Autowired
	private Menu61Repository menu61Repository;
	
	public void test() {
		menu61Repository.test();
	}
}
