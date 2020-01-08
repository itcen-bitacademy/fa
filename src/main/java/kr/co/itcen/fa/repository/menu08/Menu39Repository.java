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



/**
 * 
 *  @author 김민준
 *  건물관리
 */
@Repository
public class Menu39Repository {

	@Autowired
	private SqlSession sqlSession;

	
	public Boolean add(BuildingVo vo) {
		int count = sqlSession.insert("menu39.add", vo);
		return count == 1;
	}
	
	//전체리스트
	public List<BuildingVo> list(String id, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("pagination", pagination);
		
		List<BuildingVo> list = sqlSession.selectList("menu39.list", map);
		return list;
	}
	
	public Boolean update(BuildingVo vo) {
		int count = sqlSession.update("menu39.modify", vo);
		return count == 1;
	}
	
	public Boolean delete(String id) {
		int count = sqlSession.update("menu39.delete", id);
		return count == 1;
	}

	public List<SectionVo> getSection() {
		List<SectionVo> sectionList = sqlSession.selectList("menu39.getSection");
		return sectionList;
	}

	public List<CustomerVo> getCustomer() {
		List<CustomerVo> customerList = sqlSession.selectList("menu39.getCustomer");
		return customerList;
	}

	public CustomerVo getBankInfo(String customerNo) {
		return sqlSession.selectOne("menu39.getBankInfo", customerNo);
	}

	public int listCount(String id) {
		return sqlSession.selectOne("menu39.pageCount", id);
	}

	public Long getVoucherNo(String id) {
		Long vocherNo = sqlSession.selectOne("menu39.getVoucherNo", id);
		return vocherNo;
	}

	public BuildingVo checkId(String id) {
		return sqlSession.selectOne("menu39.checkId", id);
	}
}
