package kr.co.itcen.fa.repository.menu01;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu11.TestVo;

/**
 * 
 * @author 이종윤
 * 계정거래처원장조회
 *
 */

@Repository
public class Menu32Repository {
	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("계정거래처원장조회");
		sqlSession.insert("menu32.save", testVo);
	}



}
