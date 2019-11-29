package kr.co.itcen.fa.repository.menu17;

import java.util.List;

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
	
	/**
	 * 
	 * 마감일 전체 조회(마감일 순 내림차순)
	 */
	public List<ClosingDate> selectAllClosingDate() {
		// TODO: 페이징, 검색조건 추가
		return sqlSession.selectList("menu19.selectAllClosingDate");
	}
	
	
	/**
	 * 
	 * 마감일 수정(미결산 마감일만 수정 가능)
	 */
	public int updateClosingDate(ClosingDate closingDate) {
		return sqlSession.update("menu19.updateClosingDate", closingDate);
	}
	
	
	/**
	 * 
	 * 마감일 삭제(미결산 마감일만 삭제 가능)
	 */
	public int deleteClosingDate(ClosingDate closingDate) {
		return sqlSession.delete("menu19.deleteClosingDate", closingDate);
	}
}
