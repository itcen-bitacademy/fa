package kr.co.itcen.fa.repository.menu08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu08.BuildingVo;
import kr.co.itcen.fa.vo.menu08.TestVo;


/**
 * 
 *  @author 김민준
 *  건물현황조회
 */
@Repository
public class Menu40Repository {

	@Autowired
	private SqlSession sqlSession;
	
	//전체 리스트
	public List<BuildingVo> list(BuildingVo vo, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vo", vo);
		System.out.println(vo);
		map.put("pagination", pagination);
		List<BuildingVo> list = sqlSession.selectList("menu40.list", map);
		
		return list;
	}

	public List<SectionVo> getSection() {
		List<SectionVo> sectionList = sqlSession.selectList("menu40.getSection");
		return sectionList;
	}
	
	public List<CustomerVo> getCustomer() {
		List<CustomerVo> customerList = sqlSession.selectList("menu40.getCustomer");
		return customerList;
	}

	public int listCount(BuildingVo vo) {
		return sqlSession.selectOne("menu40.pageCount", vo);
	}
}
