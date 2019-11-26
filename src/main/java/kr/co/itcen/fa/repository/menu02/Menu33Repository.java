package kr.co.itcen.fa.repository.menu02;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu02.TestVo;

/**
 * 
 *  @author 강민호
 *  매입품목관리
 */

@Repository
public class Menu33Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("강민호");
		
		sqlSession.insert("menu33.save", testVo);
	}
}
