package kr.co.itcen.fa.repository.menu12;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu12.TestVo;

/**
 * 
 * @author 안태영
 * 매출세금계산서관리
 *
 */
@Repository
public class Menu53Repository {
	
	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("53화면 테스트완료");
		sqlSession.insert("menu53.save", testVo);
	}

}
