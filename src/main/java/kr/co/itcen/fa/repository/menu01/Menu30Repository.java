package kr.co.itcen.fa.repository.menu01;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu01.TestVo;

/**
 * 
 * @author 김승곤
 * 계정거래처명세서조회
 *
 */

@Repository
public class Menu30Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public void test (){
		TestVo testVo = new TestVo();
		testVo.setName("30김승곤");
		sqlSession.insert("menu30.save", testVo);
	}
}
