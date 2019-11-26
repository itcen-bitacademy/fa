package kr.co.itcen.fa.repository.menu01;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu01.TestVo;

/**
 * 
 * @author 김승곤
 * 카드현황조회
 *
 */

@Repository
public class Menu24Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void test (){
		TestVo testVo = new TestVo();
		testVo.setName("24김승곤");
		sqlSession.insert("menu24.save", testVo);
	}
}
