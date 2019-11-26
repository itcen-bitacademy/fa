package kr.co.itcen.fa.repository.menu01;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu01.TestVo;

/**
 * 
 * @author 황슬기 
 * 계좌조회
 *
 */

@Repository
public class Menu26Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void test (){
		TestVo testVo = new TestVo();
		testVo.setName("김길동26");
		sqlSession.insert("menu26.save", testVo);
	}
}
