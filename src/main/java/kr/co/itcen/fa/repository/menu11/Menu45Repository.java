package kr.co.itcen.fa.repository.menu11;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu11.TestVo;

/**
 * 
 * @author 이지수
 * 은행코드현황조회
 *
 */
@Repository
public class Menu45Repository {

	@Autowired
	private SqlSession sqlSession;
	
	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("이지수");
		sqlSession.insert("menu45.save", testVo);
	}
	
}
