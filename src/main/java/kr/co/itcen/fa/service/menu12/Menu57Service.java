package kr.co.itcen.fa.service.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu12.Menu57Repository;
import kr.co.itcen.fa.vo.menu12.SalesVo;

/**
 * 
 * @author 곽세연
 * 월별거래처매출현황
 *
 */
@Service
public class Menu57Service {
	
	@Autowired
	private Menu57Repository menu57Repository;
	
	public void test() {
		menu57Repository.test();
	}
	//전체 리스트
	public List<SalesVo> getList(SalesVo vo){
		return menu57Repository.getList(vo);
	}
	
	//검색을 위한 거래처 명
	public List<SalesVo> getcustomerName(){
		return menu57Repository.getcustomerName();
	}
}
