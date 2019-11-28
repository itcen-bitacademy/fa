package kr.co.itcen.fa.service.menu17;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu17.Menu19Repository;
import kr.co.itcen.fa.vo.menu17.ClosingDate;


/**
 * 
 * @author 김재원
 * 마감일자관리
 */

@Service
public class Menu19Service {
	
	@Autowired
	private Menu19Repository menu19Repository;
	
	public void test() {
		menu19Repository.test();
	}
	
	/**
	 * 
	 * 마감일 등록
	 */
	public int insertClosingDate(ClosingDate closingDate) {
		return menu19Repository.insertClosingDate(closingDate);
	}
}
