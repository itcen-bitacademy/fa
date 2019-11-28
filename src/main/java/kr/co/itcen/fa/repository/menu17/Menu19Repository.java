package kr.co.itcen.fa.repository.menu17;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu17.ClosingDate;
import kr.co.itcen.fa.vo.menu17.TestVo;

/**
 * 
 * @author 김재원
 * 마감일자관리
 */

@Repository
public class Menu19Repository {
	
	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("김재원");
		sqlSession.insert("menu19.save",testVo);
	}

	
	/**
	 * 
	 * 마감일 등록
	 */
	public int insertClosingDate(ClosingDate closingDate) {
		return sqlSession.insert("menu19.insertClosingDate", closingDate);
	}
}
