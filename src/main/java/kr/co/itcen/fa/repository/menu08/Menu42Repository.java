package kr.co.itcen.fa.repository.menu08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu08.LandVo;
import kr.co.itcen.fa.vo.menu08.StaffVo;
import kr.co.itcen.fa.vo.menu08.TestVo;
import kr.co.itcen.fa.vo.menu08.VehicleVo;


/**
 * 
 *  @author 권영미
 *  차량현황조회
 */
@Repository
public class Menu42Repository {

	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("권영미현황");
		sqlSession.insert("menu42.save", testVo);
	}

	//대분류 리스트
	public List<SectionVo> getSection() {
		List<SectionVo> list = sqlSession.selectList("menu42.section");
		System.out.println(list);
		return list;
	}
		
	//직급 리스트 
	public List<StaffVo> getJik() {
		List<StaffVo> list = sqlSession.selectList("menu42.name");
		System.out.println(list);
		return list;
	}

	//리스트 조회하기
	public List<VehicleVo> selectList() {
		List<VehicleVo> list = sqlSession.selectList("menu42.select");
		System.out.println(list);
		return list;
	}

	//기본조회 전체 개수
	public int listCount(String id) {
		return sqlSession.selectOne("menu42.pageAllCount", id);
	}
	
	//기본조회
	public List<VehicleVo> list(String id, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pagination", pagination);
		List<VehicleVo> list = sqlSession.selectList("menu42.list", map);
		
		return list;
	}

	public int listCount(VehicleVo vehicleVo, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<VehicleVo> getList(VehicleVo vehicleVo, String startDate, String endDate, PaginationUtil pagination) {
		// TODO Auto-generated method stub
		return null;
	}
}
