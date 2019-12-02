package kr.co.itcen.fa.repository.menu02;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu02.BuyTaxbillVo;
import kr.co.itcen.fa.vo.menu02.TestVo;

/**
 * 
 * @author 이제구
 * 매입세금계산서관리
 *
 */

@Repository
public class Menu37Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("이름넣기"); // 이름
		
		sqlSession.insert("menu37.save", testVo);
	}

	public void customerRead() {
		BuyTaxbillVo buyTaxbillVo = sqlSession.selectOne("menu37.customerRead");
	}

	//1. insert를 할때 if문으로 3팀인지 2팀인지 구별후 매입세금계산서번호를 넣는다.
	//2. 내꺼에 넣는다.
	public void insert(BuyTaxbillVo vo) {
		
		sqlSession.insert("menu37.insert", vo);
	}
	
	

	
}
