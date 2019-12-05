package kr.co.itcen.fa.repository.menu17;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu17.ClosingDateVo;

/**
 * 
 * @author 유지훈
 * 대차대조표조회
 */

@Repository
public class Menu63Repository {

	@Autowired
	private SqlSession sqlSession;
	
	//대차대조표(BalanceSheet) Insert
	public int insertBalanceSheet(ClosingDateVo vo) {
		int check = sqlSession.insert("menu63.insertBalanceSheet", vo);
		return check;
	}
	
	//대차대조표(BalanceSheet) SelectList
	public Map<String, Object> get(Long no) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("balanceSheetDataList", sqlSession.selectList("menu63.getVoByClosingDateNo", no));
		return map;
	}

	//대차대조표(BalanceSheet) Delete
	public int deleteBalanceSheet(ClosingDateVo vo) {
		return sqlSession.delete("menu63.deleteByClosingDateNo", vo);
	}
	
	
	
}
