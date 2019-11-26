package kr.co.itcen.fa.repository.menu02;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu02.TestVo;

/**
 * 
 * @author 이지은
 * 매입거래처관리
 *
 */

@Repository
public class Menu35Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("이름넣기"); // 이름
		
		sqlSession.insert("menu35.save", testVo);
	}
}
