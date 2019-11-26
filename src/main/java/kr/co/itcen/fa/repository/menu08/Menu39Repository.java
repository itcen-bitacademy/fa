package kr.co.itcen.fa.repository.menu08;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu08.TestVo;


/**
 * 
 *  @author 김민준
 *  건물관리
 */
@Repository
public class Menu39Repository {

	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("김민준관리");
		sqlSession.insert("menu39.save", testVo);
	}
}
