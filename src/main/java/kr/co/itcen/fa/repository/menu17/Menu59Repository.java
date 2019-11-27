package kr.co.itcen.fa.repository.menu17;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu17.TestVo;

/**
 * 
 * @author 이성훈
 * 재무제표계정관리
 */

@Repository
public class Menu59Repository {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void test() {
		//TestVo testVo = new TestVo();
		//testVo.setName("이성훈");
		//sqlSession.insert("menu59.save",testVo);
	}
	
}
