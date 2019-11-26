package kr.co.itcen.fa.repository.menu11;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu11.TestVo;

/**
 * 
 * @author 박준호
 * 사채관리
 *
 */
@Repository
public class Menu16Repository {

	@Autowired
	private SqlSession sqlSession;
	
	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("박준호");
		sqlSession.insert("menu16.save", testVo);
	}
	
}
