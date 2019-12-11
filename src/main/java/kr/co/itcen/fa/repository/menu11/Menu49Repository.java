package kr.co.itcen.fa.repository.menu11;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;
import kr.co.itcen.fa.vo.menu11.TestVo;

/**
 * 
 * @author 김준호
 * 장기차입금현황조회
 *
 */
@Repository
public class Menu49Repository {

	@Autowired
	private SqlSession sqlSession;
	
	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("김준호");
		sqlSession.insert("menu49.save", testVo);
	}

	public int listCount(LTermdebtVo vo) {
		return sqlSession.selectOne("menu49.selectAllCount",vo);
	}

	public List<LTermdebtVo> list(PaginationUtil pagination,LTermdebtVo vo,String sort) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("vo", vo);
		map.put("sort",sort);
		System.out.println(map.get("sort"));
		List<LTermdebtVo> list= sqlSession.selectList("menu49.selectAll",map);
		
		return list;
	}
	public List<SectionVo> selectSection() {
		
		return sqlSession.selectList("menu49.selectsection");
	}
	
}