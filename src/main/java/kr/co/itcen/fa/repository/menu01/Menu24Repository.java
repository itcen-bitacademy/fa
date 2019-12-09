package kr.co.itcen.fa.repository.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.CardVo;
/**
 * 
 * @author 김승곤
 * 카드현황조회
 *
 */

@Repository
public class Menu24Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public int listCount(CardVo vo) {
		return sqlSession.selectOne("menu24.readCount",vo);
		
	}
	
	public List<CardVo> list(PaginationUtil pagination, CardVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("vo", vo);
		System.out.println(vo);
		List<CardVo> list= sqlSession.selectList("menu24.read",map);
		return list;
		
	}

	public Map<String, Object> read(PaginationUtil pagination, CardVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("vo", vo);
		map.put("cardList", sqlSession.selectList("menu05.read",map));
		return map;
	}


}
