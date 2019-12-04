package kr.co.itcen.fa.repository.menu08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu08.TestVo;
import kr.co.itcen.fa.vo.menu08.VehicleVo;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu08.StaffVo;


/**
 * 
 *  @author 권영미
 *  차량관리
 */
@Repository
public class Menu41Repository {

	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("권영미관리");
		sqlSession.insert("menu41.save", testVo);
	}
	
	//대분류 리스트
	public List<SectionVo> getSection() {
		List<SectionVo> list = sqlSession.selectList("menu41.section");
		System.out.println(list);
		return list;
	}
	
	//직급 리스트 
	public List<StaffVo> getJik() {
		List<StaffVo> list = sqlSession.selectList("menu41.name");
		System.out.println(list);
		return list;
	}

	//등록 리스트 삽입
	public boolean insert(VehicleVo vehicleVo) {
		int count = sqlSession.insert("menu41.insert", vehicleVo);
		return count == 1;
	}

	//등록 리스트 테이블에 조회
	public List<VehicleVo> selectList() {
		List<VehicleVo> list = sqlSession.selectList("menu41.select");
		System.out.println(list);
		return list;
	}
	
	//수정 리스트
	public boolean update(VehicleVo vehicleVo) {
		int count = sqlSession.update("menu41.update", vehicleVo);
		return count == 1;
		
	}

	//검색 리스트
	public List<VehicleVo> search(String id) {
		List<VehicleVo> list = sqlSession.selectList("menu41.search",id);
		return list;
		
	}
	
	//삭제 리스트 
	public boolean delete(String id) {
		int count = sqlSession.delete("menu41.delete", id);
		return count == 1;
	}

	
		
}
