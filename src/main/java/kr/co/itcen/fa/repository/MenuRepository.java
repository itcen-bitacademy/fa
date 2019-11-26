package kr.co.itcen.fa.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.MenuVo;

@Repository
public class MenuRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void save(MenuVo menuVo) {
		sqlSession.insert("menu.save", menuVo);
	}

	public List<MenuVo> findAllByParentNoNull() {
		return sqlSession.selectList("menu.findAllByParentNoNull");
	}

	public List<MenuVo> findAll() {
		return sqlSession.selectList("menu.findAll");
	}	
}