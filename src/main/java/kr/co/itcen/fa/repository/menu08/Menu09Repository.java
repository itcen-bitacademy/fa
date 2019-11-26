package kr.co.itcen.fa.repository.menu08;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu08.TestVo;


/**
 * 
 *  @author 정의돈
 *  토지관리
 */
@Repository
public class Menu09Repository {

	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("정의돈");
		sqlSession.insert("menu09.save", testVo);
	}
}
