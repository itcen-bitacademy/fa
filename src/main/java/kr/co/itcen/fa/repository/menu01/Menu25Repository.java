package kr.co.itcen.fa.repository.menu01;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu01.BankAccountVo;
import kr.co.itcen.fa.vo.menu01.TestVo;

/**
 * 
 * @author 황슬기 
 * 계좌관리
 *
 */

@Repository
public class Menu25Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void test (){
		TestVo testVo = new TestVo();
		testVo.setName("김길동");
	//	sqlSession.insert("menu25.save", testVo);
	}

	public void create(BankAccountVo bavo) {
		// 다른 조와 데이터 통합 전 임의의 Test data insert
		bavo.setAccountNo("12348");
		// 191202 sql문 구현 필요함
		sqlSession.insert("menu25.create", bavo);
	}
}
