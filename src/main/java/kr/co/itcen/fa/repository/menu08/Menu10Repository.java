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

	public List<LandVo> getList(LandVo landVo, String startDate, String endDate, PaginationUtil pagination) {
		
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
		map.put("flag", landVo.getFlag());
		System.out.println("flag" + landVo.getFlag());
		map.put("pagination", pagination);
		List<LandVo> list = sqlSession.selectList("menu10.getList", map);
		System.out.println("ㄴㅅㄴ" + list);
		return list;  
	}
	
	//조건조회화면 전체 개수
	public int listCount(LandVo landVo, String startDate, String endDate) {
		
		System.out.println("landVo : " + landVo);
		
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
		
		return sqlSession.selectOne("menu10.pageCount", map);
	}

	public List<LandVo> list(String id, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pagination", pagination);
		List<LandVo> list = sqlSession.selectList("menu10.list", map);
		
		return list;
	}
	
	//기본조회화면 전체 개수
	public int listCount(String id) {
		return sqlSession.selectOne("menu10.pageAllCount", id);
	}
	
}
