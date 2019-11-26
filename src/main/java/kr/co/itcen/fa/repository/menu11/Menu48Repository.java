package kr.co.itcen.fa.repository.menu11;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu11.TestVo;

/**
 * 
 * @author 김준호
 * 장기차입금관리
 *
 */
@Repository
public class Menu48Repository {

	@Autowired
	private SqlSession sqlSession;
	
	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("김준호");
		sqlSession.insert("menu48.save", testVo);
	}
	
}
