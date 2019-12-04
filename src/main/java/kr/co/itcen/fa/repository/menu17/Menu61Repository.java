package kr.co.itcen.fa.repository.menu17;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
import kr.co.itcen.fa.vo.menu17.Menu17SearchForm;
import kr.co.itcen.fa.vo.menu17.TestStatementDataVo;
import kr.co.itcen.fa.vo.menu17.TrialBalanceVo;

/**
 * 
 * @author 최웅
 * 결산작업
 */

@Repository
public class Menu61Repository {

	@Autowired
	private SqlSession sqlSession;
	
	/**
	 * 
	 * 해당마감일 결산처리 업데이트
	 */
	public int executeSettlement(Menu17SearchForm menu17SearchForm) {
		return sqlSession.update("menu61.updateClosingYnByNo", menu17SearchForm);
	}
	
	
	/**
	 * 
	 * 해당년도의 마지막 마감일자 조회
	 */
	public ClosingDateVo selectLastestClosedDateByClosingDateNoPerYear(Menu17SearchForm menu17SearchForm) {
		return sqlSession.selectOne("menu61.selectLastestClosedDateByClosingDateNoPerYear", menu17SearchForm);
	}
	
	
	/**
	 * 
	 * 해당년도의 미결산 마감일중 다음순서의 마감일정보 조회 - 결산작업 실행시 해당 마감일의 결산순서 유효성 검사 
	 */
	public ClosingDateVo selectLastestUnclosingDatePerYear(Menu17SearchForm menu17SearchForm) {
		return sqlSession.selectOne("menu61.selectLastestUnclosingDatePerYear", menu17SearchForm);
	}
	
	/**
	 * 
	 * 시산표 데이터 입력
	 */
	public int insertTrialBalance(TrialBalanceVo trialBalanceVo) {
		return sqlSession.insert("menu61.insertTrialBalance", trialBalanceVo);
	}
	
	
	/**
	 * 
	 * 계정명만 존재하는 빈 시산표 생성
	 */
	public List<TrialBalanceVo> selectEmptyTrialBalance(Menu17SearchForm menu17SearchForm) {
		return sqlSession.selectList("menu61.selectEmptyTrialBalance", menu17SearchForm);
	}
	
	
	/**
	 * 
	 * 테스트 전표 데이터 
	 */
	public List<TestStatementDataVo> testStatementData() {
		return sqlSession.selectList("menu61.testStatementData");
	}
	
	/**
	 * 
	 * 해당 마감일의 시산표 삭제 
	 */
	public int deleteTrialBalanceByClosingDateNo(ClosingDateVo closingDateVo) {
		return sqlSession.delete("menu61.deleteTrialBalanceByClosingDateNo", closingDateVo);
	}
}
