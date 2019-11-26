package kr.co.itcen.fa.repository.menu01;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu01.TestVo;

/**
 * 
 * @author 김승곤
 * 카드관리
 *
 */

@Repository
public class Menu05Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void test (){
		TestVo testVo = new TestVo();
		testVo.setName("05김승곤");
		sqlSession.insert("menu05.save", testVo);
	}
}
