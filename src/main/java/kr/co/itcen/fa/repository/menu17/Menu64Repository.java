package kr.co.itcen.fa.repository.menu17;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
import kr.co.itcen.fa.vo.menu17.FinancialStatementVo;

/**
 * 
 * @author 유지훈
 * 손익계산서조회
 */

@Repository
public class Menu64Repository {

	@Autowired
	private SqlSession sqlSession;
	
	
	// 1. 손익계산서(IncomeStatement)에 필요한 Data select
	public List<FinancialStatementVo> selectIncomeStatementDataList(ClosingDateVo vo) {
		return sqlSession.selectList("menu64.selectIncomeStatementDataList", vo);
	}

	// 2. 손익계산서(IncomeStatement) Data insert
	public int insertIncomeStatementData(FinancialStatementVo vo) {
		int result = sqlSession.insert("menu64.insertIncomeStatementData", vo);
		return result;
	}
	
	// 손익계산서(IncomeStatement) 조회
	public Map<String,Object> get(Long no) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("incomeStatementDataList", sqlSession.selectList("menu64.getVoByClosingDateNo", no));
		return map;
	}

}
