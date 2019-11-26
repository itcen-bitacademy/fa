package kr.co.itcen.fa.service.menu02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu02.Menu37Repository;

/**
 * 
 * @author 이제구
 * 매입세금계산서관리
 *
 */

@Service
public class Menu37Service {
	@Autowired
	private Menu37Repository menu37Repository;
	
	public void test() {
		menu37Repository.test();
	}
}
