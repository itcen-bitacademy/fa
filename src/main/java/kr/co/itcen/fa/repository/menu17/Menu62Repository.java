package kr.co.itcen.fa.repository.menu17;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
import kr.co.itcen.fa.vo.menu17.Menu17SearchForm;
import kr.co.itcen.fa.vo.menu17.TrialBalanceVo;

/**
 * 
 * @author 최웅
 * 합계잔액시산표조회
 */

@Repository
public class Menu62Repository {

	@Autowired
	private SqlSession sqlSession;
	
	
	/**
	 * 
	 * 결산일별 시산표 데이터 조회
	 */
	public List<TrialBalanceVo> selectTrialBalanceByClosingDateNo(Menu17SearchForm menu17SearchForm) {
		return sqlSession.selectList("menu62.selectTrialBalanceByClosingDateNo", menu17SearchForm);
	}
	
	
	/**
	 * 
	 * 결산일별 시산표 데이터 삭제
	 */
	public int deleteTrialBalanceByClosingDateNo(TrialBalanceVo trialBalanceVo) {
		return sqlSession.delete("menu62.deleteTrialBalanceByClosingDateNo", trialBalanceVo);
	}
	
	
	/**
	 * 
	 * 결산완료된 마감일자 조회
	 */
	public List<ClosingDateVo> selectAllClosedDate() {
		return sqlSession.selectList("menu62.selectAllClosedDate");
	}
}
