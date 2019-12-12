package kr.co.itcen.fa.repository.menu11;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;
/**
 * 
 * @author 박준호
 * 상환내역관리
 *
 */
@Repository
public class Menu66Repository {

	@Autowired
	private SqlSession sqlSession;

	// 상환테이블 데이터 카운트
	public int listCount(String code, String debtType) {
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("========listCount========");
		System.out.println("code : " + code);
		System.out.println("debtType : " + debtType);
		map.put("code", code);
		map.put("debtType", debtType);
		return sqlSession.selectOne("menu66.selectAllCount", map);
	}
	
	// 상환테이블 리스트 데이터 출력
	public List<RepayVo> list(String code, String debtType, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("debtType", debtType);
		map.put("pagination", pagination);
		List<RepayVo> list = sqlSession.selectList("menu66.selectAll", map);
		System.out.println("Repository RepayVo list : " + list.get(0));
		return list;
	}

	public Boolean update(RepayVo vo) {
		int count = sqlSession.update("menu66.update", vo);
		return count == 1;
	}
	
}
