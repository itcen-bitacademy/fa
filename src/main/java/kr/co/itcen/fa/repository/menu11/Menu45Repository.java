package kr.co.itcen.fa.repository.menu11;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu11.BankVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;
import kr.co.itcen.fa.vo.menu11.TestVo;

/**
 * 
 * @author 이지수
 * 은행코드현황조회
 *
 */
@Repository
public class Menu45Repository {

	@Autowired
	private SqlSession sqlSession;

	// 은행명으로 은행정보 조회
	public List<BankVo> selectBankInfo(String bankname) {
		return sqlSession.selectList("menu45.selectAll", bankname);
	}

	// 은행코드현황조회 데이터 리스트로 출력
	public List<BankVo> list(String code, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("pagination", pagination);
		List<BankVo> list = sqlSession.selectList("menu45.list", map);
		return list;
	}

	// 은행 테이블의 정보 갯수 
	public int selectBankListCount(String code) {
		int count = sqlSession.selectOne("menu45.selectBankListCount",code);
		return count;
	}
	
}
