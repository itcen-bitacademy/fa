package kr.co.itcen.fa.repository.menu12;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu12.TestVo;

/**
 * 
 * @author 양홍석 
 * 매출거래처관리
 *
 */
@Repository
public class Menu15Repository {

	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("양홍석");
		sqlSession.insert("menu15.save", testVo);
	}
	
	
}
