package kr.co.itcen.fa.repository.menu08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu08.LandVo;
import kr.co.itcen.fa.vo.menu08.TestVo;


/**
 * 
 *  @author 정의돈
 *  토지현황조회
 */
@Repository
public class Menu10Repository {

	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("정의돈현황");
		sqlSession.insert("menu10.save", testVo);
	}

	public List<LandVo> getList(LandVo landVo, String startDate, String endDate) {
		
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", landVo.getId());
		map.put("sectionName", landVo.getSectionName());
		map.put("payDate", landVo.getPayDate());
		map.put("customerName", landVo.getCustomerName());
		map.put("managerName", landVo.getManagerName());
		map.put("landArea", landVo.getLandArea());
		map.put("wideAddress", landVo.getWideAddress());
		map.put("cityAddress", landVo.getCityAddress());
		map.put("acqPrice", landVo.getAcqPrice());
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		
		List<LandVo> list = sqlSession.selectList("menu10.getList", map);
		return list;  
	}

	public List<LandVo> selectList() {
		List<LandVo> list = sqlSession.selectList("menu10.selectList");
		
		return list;
	}

	public int listCount(String id) {
		return sqlSession.selectOne("menu10.pageCount", id);
	}

	public List<LandVo> list(String id, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pagination", pagination);
		List<LandVo> list = sqlSession.selectList("menu10.list", map);
		
		return list;
	}
	
}
