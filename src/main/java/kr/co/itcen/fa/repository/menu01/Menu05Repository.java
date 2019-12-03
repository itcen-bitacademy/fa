package kr.co.itcen.fa.repository.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu01.CardVo;

/**
 * 
 * @author 김승곤
 * 카드관리
 *
 */

@Repository
public class Menu05Repository {
	@Autowired
	private SqlSession sqlSession;

	public Map<String, Object> create(CardVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		sqlSession.insert("menu05.create", vo);
		
		map.put("cardList", sqlSession.selectList("menu05.list"));
		return map;
	}
	

	public Map<String, Object> read(CardVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("cardList", sqlSession.selectList("menu05.read", vo));
		return map;
	}
	
	public Map<String, Object> update(CardVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		sqlSession.update("menu05.update", vo);
		
		map.put("cardList", sqlSession.selectList("menu05.list"));
		return map;
	}


	public Map<String, Object> delete(CardVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		sqlSession.update("menu05.delete", vo);
		
		map.put("cardList", sqlSession.selectList("menu05.list"));
		return map;
	}

	public Boolean Nexist(CardVo vo) {
		int exist = sqlSession.selectOne("menu05.nexist", vo);
		
		return exist == 1;
	}
	
	public Boolean Yexist(CardVo vo) {
		int exist = sqlSession.selectOne("menu05.yexist", vo);
		
		return exist == 1;
	}

	public boolean deleteAll(CardVo vo) {
		int count = sqlSession.delete("menu05.deleteAll", vo);
		
		return (count==1);
	}
	
	public List<CardVo> list() {
		return sqlSession.selectList("menu05.list");
	}


}
