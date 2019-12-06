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

/**
 * 
 * @author 박준호 사채현황조회
 *
 */
@Repository
public class Menu51Repository {

	@Autowired
	private SqlSession sqlSession;

	public int listCount(PdebtVo vo) {
		return sqlSession.selectOne("menu51.selectAllCount", vo);
	}

	public List<PdebtVo> list(PaginationUtil pagination, PdebtVo vo, String sort) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("vo", vo);
		map.put("sort",sort);
		List<PdebtVo> list = sqlSession.selectList("menu51.selectAll", map);
		return list;
	}

	public List<SectionVo> selectSection() {
		return sqlSession.selectList("menu51.selectsection");
	}

}
