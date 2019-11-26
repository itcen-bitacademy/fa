package kr.co.itcen.fa.repository.menu01;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu01.TestVo;

/**
 * 
 * @author 임성주
 * 계정별원장조회
 *
 */

@Repository
public class Menu31Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void test (){
		TestVo testVo = new TestVo();
		testVo.setName("김길동");
		sqlSession.insert("menu31.save", testVo);
	}
}
