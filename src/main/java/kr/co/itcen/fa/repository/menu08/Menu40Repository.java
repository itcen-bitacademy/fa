package kr.co.itcen.fa.repository.menu08;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu08.TestVo;


/**
 * 
 *  @author 김민준
 *  건물현황조회
 */
@Repository
public class Menu40Repository {

	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("김민준현황");
		sqlSession.insert("menu40.save", testVo);
	}
}
