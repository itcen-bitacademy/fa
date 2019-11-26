package kr.co.itcen.fa.repository.menu18;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu18.TestVo;

/**
 * 
 * @author 안대혁
 * 공통코드 관리
 */
@Repository
public class Menu65Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("안대혁");
		sqlSession.insert("menu65.save", testVo);
	}
}
