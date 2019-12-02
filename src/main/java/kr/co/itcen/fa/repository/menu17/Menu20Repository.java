package kr.co.itcen.fa.repository.menu17;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
import kr.co.itcen.fa.vo.menu17.Menu17SearchForm;

/**
 * 
 * @author 김재원
 * 마감현황관리
 */

@Repository
public class Menu20Repository {
	
	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * 
	 * 마감일 년도 조회
	 */
	public List<String> selectClosingYear() {
		return sqlSession.selectList("menu20.selectClosingYear");
	}
	
	/**
	 * 
	 * 년도별 마감현황 갯수 조회
	 */
	public int selectClosingDateCountByYear(Menu17SearchForm menu17SearchForm) {
		return sqlSession.selectOne("menu20.selectClosingDateCountByYear", menu17SearchForm);
	}
	
	/**
	 * 
	 * 년도별 마감현황 조회
	 */
	public List<ClosingDateVo> selectClosingDateByYear(Menu17SearchForm menu17SearchForm) {
		return sqlSession.selectList("menu20.selectClosingDateByYear", menu17SearchForm);
	}

}
