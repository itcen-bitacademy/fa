package kr.co.itcen.fa.repository.menu17;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu17.ClosingDateVo;

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
	
}
