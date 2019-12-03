package kr.co.itcen.fa.service.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu12.Menu56Repository;
import kr.co.itcen.fa.vo.menu12.CurrentSituationVo;

/**
 * 
 * @author 곽세연
 * 품목대분류별 매입매출현황
 *
 */
@Service
public class Menu56Service {
	
	@Autowired
	private Menu56Repository menu56Repository;
	
	public void test() {
		menu56Repository.test();
	}
	
	public List<CurrentSituationVo> getlist() {
		return menu56Repository.getlist();
	}

}
