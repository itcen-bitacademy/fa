package kr.co.itcen.fa.repository.menu02;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu02.TestVo;

/**
 * 
 * @author 윤종진
 * 매입세금계산서현황조회
 *
 */

@Repository
public class Menu38Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("이름넣기"); // 이름
		
		sqlSession.insert("menu38.save", testVo);
	}
}
