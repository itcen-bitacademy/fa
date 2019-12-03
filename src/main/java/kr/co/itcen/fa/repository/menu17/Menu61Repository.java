package kr.co.itcen.fa.repository.menu17;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
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
	public int executeSettlement(ClosingDateVo closingDateVo) {
		return sqlSession.update("menu61.updateClosingYnByNo", closingDateVo);
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
	public List<TrialBalanceVo> selectEmptyTrialBalance() {
		return sqlSession.selectList("menu61.selectEmptyTrialBalance");
	}
	
	
	/**
	 * 
	 * 테스트 전표 데이터 
	 */
	public List<TestStatementDataVo> testStatementData() {
		return sqlSession.selectList("menu61.testStatementData");
	}
}
