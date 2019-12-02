package kr.co.itcen.fa.repository.menu01;

import java.util.List;

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

	public Boolean create(CardVo vo) {
		int count = sqlSession.insert("menu05.create", vo);
		return (count==1);	
	}

	public List<CardVo> list() {
		return sqlSession.selectList("menu05.list");
	}

	public Boolean remove(CardVo vo) {
		int count = sqlSession.update("menu05.remove", vo);
		return (count==1);
	}

	public Boolean update(CardVo vo) {
		int count = sqlSession.update("menu05.update", vo);
		return (count==1);
	}
}
