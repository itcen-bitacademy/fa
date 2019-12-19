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
		System.out.println("조건조회");
		System.out.println(landVo.getFlag());
		
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
		map.put("pagination", pagination);
		
		System.out.println("내가 검색한것 id : " + landVo.getId() + "sectionName : " + landVo.getSectionName() + " payDate : " + landVo.getPayDate() + " customerName : " +
				landVo.getCustomerName() +"managerName : " + landVo.getManagerName() + "평수 : " + landVo.getLandArea() + "wideAddress : " + landVo.getWideAddress() +
				"cityAddress : " + landVo.getCityAddress() + "acqPrice : " + landVo.getAcqPrice() + "startDate : " + startDate + "endDate : " + endDate +
				"flag : " + landVo.getFlag()
				);
		List<LandVo> list = sqlSession.selectList("menu10.getList", map);
		return list;  
	}
	
	//조건조회화면 전체 개수
	public int listCount(LandVo landVo, String startDate, String endDate) {
		System.out.println("조건조회전체개수");
		System.out.println("landVo : " + landVo);
		
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("id", landVo.getId());
		map.put("sectionName", landVo.getSectionName());
		map.put("payDate", landVo.getPayDate());
		map.put("customerName", landVo.getCustomerName());
		map.put("managerName", landVo.getManagerName());
		map.put("landArea", landVo.getLandArea());
		System.out.println("fddfdfdf");
		System.out.println(landVo.getWideAddress());
		System.out.println(landVo.getCityAddress());
		System.out.println("dfdsdfsdfs");
		map.put("wideAddress", landVo.getWideAddress());
		map.put("cityAddress", landVo.getCityAddress());
		map.put("acqPrice", landVo.getAcqPrice());
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("flag", landVo.getFlag());
		
		return sqlSession.selectOne("menu10.pageCount", map);
	}

	public List<LandVo> list(String id, PaginationUtil pagination) {
		System.out.println("기본조회");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pagination", pagination);
		List<LandVo> list = sqlSession.selectList("menu10.list", map);
		
		
		return list;
	}
	
	//기본조회화면 전체 개수
	public int listCount(String id) {
		System.out.println("기본조회 전체개수");
		return sqlSession.selectOne("menu10.pageAllCount", id);
	}
	
}
