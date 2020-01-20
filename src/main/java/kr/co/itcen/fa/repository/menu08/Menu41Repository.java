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
import kr.co.itcen.fa.vo.menu08.StaffVo;
import kr.co.itcen.fa.vo.menu08.TaxbillVo;
import kr.co.itcen.fa.vo.menu08.TestVo;
import kr.co.itcen.fa.vo.menu08.VehicleVo;


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

	//거래처 리스트 
	public List<CustomerVo> getCustomer() {
		List<CustomerVo> list = sqlSession.selectList("menu41.customer");
		System.out.println(list);
		return list;
	}

	//등록 리스트 삽입
	public boolean insert(VehicleVo vehicleVo) {
		int count = sqlSession.insert("menu41.insert", vehicleVo);
		return count == 1;
	}


	 
	
	//수정 리스트
	public boolean update(VehicleVo vehicleVo) {
		int count = sqlSession.update("menu41.update", vehicleVo);
		return count == 1;
	}


	
	//삭제 리스트 
	public void delete(String userId, String id) {
//		int count = sqlSession.delete("menu41.delete", id);
//		return count == 1;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("id", id);
		
		sqlSession.update("menu41.delete", map);	
	}

	//전표등록
	public CustomerVo getDepositNo(String customerNo) {
		CustomerVo cus = sqlSession.selectOne("menu41.getDepositNo", customerNo);
		return cus;
	}

	//세금계산서 번호 등록
	public boolean insertTaxbill(TaxbillVo taxVo) {

		int count = sqlSession.insert("menu41.insertTaxbill", taxVo);
		return count == 1;
	}

	//세금계산서 차량 테이블에 업데이트
	public boolean updateTaxbill(String taxno, String veno, long voucherNo, String uId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("taxno", taxno);
		map.put("veno", veno);
		map.put("voucherNo", voucherNo);
		map.put("userId", uId);
		int count = sqlSession.update("menu41.updateTaxbill", map);
		return count == 1;
		
	}

	//세금계산서 정보 조회
	public List<TaxbillVo> selectTaxList(String id) {
		List<TaxbillVo> list = sqlSession.selectList("menu41.selectTaxbill", id);
		System.out.println("세금계산서 정보" + list);
		return list;
	}

	//보증금 납부일 가져오기
	public String selectTaxVo(String id) {
		String taxVo = sqlSession.selectOne("menu41.selectTaxVo", id);
		return taxVo;
	}
	
	//리스트 전표번호 가져오기(차량코드id를 이용해서)
	public Long getVoucherNo(String id) {
	
		Long vNo = sqlSession.selectOne("menu41.selectVNO",id);
		return vNo;
	}

	//세금계산서 전표번호 가져오기(차량코드id를 이용해서)
	public List<Long> getTaxVoucherNo(String id) {
		
		List<Long> taxVNO = sqlSession.selectList("menu41.selectTaxVNO",id);
		return taxVNO;
	}

	//세금계산서 삭제
	public void deleteTaxbill(String userId, String id) {
//		int count = sqlSession.delete("menu41.deleteTaxbill", id);
//		return count == 1;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("id", id);
		
		sqlSession.update("menu41.deleteTaxbill", map);	
	}
	
	//페이지수 세기
	public int listCount(String id) {
		return sqlSession.selectOne("menu41.pageCount", id);
	}

	//페이지 리스트 조회하기
	//수정필요
	public List<VehicleVo> list(String id, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pagination", pagination);
		List<VehicleVo> list = sqlSession.selectList("menu41.list", map);
		return list;
	}

	//차량 코드 유효성 검사
	public String checkId(String id) {
		String check = sqlSession.selectOne("menu41.checkId", id);
		return check;
	}

	//세금계산서 정보 조회
	public List<TaxbillVo> selectTaxList(String id, PaginationUtil pagination) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pagination", pagination);
		List<TaxbillVo> list = sqlSession.selectList("menu41.selectTaxbill", id);
		System.out.println("세금계산서 정보" + list);
		return list;
	}


	//세금계산서 페이지 리스트
	public List<TaxbillVo> selectpageTaxList(String id, int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		page = (page-1) * 12;
		
		map.put("id", id);
		map.put("page", page);
		
		List<TaxbillVo> list = sqlSession.selectList("menu41.selectpageTaxbill", map);
		
		System.out.println("-----------pagelist------------");
		System.out.println(list);
		System.out.println("-------------------------------");
		return list;
	}

	//세금계산서 page 그룹 리스트
	public List<TaxbillVo> selectgroupTaxList(String id, int page_group) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		page_group = page_group * 60;
		
		map.put("id", id);
		map.put("page_group", page_group);
		
		List<TaxbillVo> list = sqlSession.selectList("menu41.selectgroupTaxbill", map);
		
		System.out.println("-----------grouplist------------");
		System.out.println(list);
		System.out.println("-------------------------------");
		
		return list;
	}

	//세금계산서 총 건수 
	public int listTaxCount(String id) {
		return sqlSession.selectOne("menu41.taxPageCount",id);
	}

	//세금계산서 번호 삭제
	public void deleteTaxbillNo(String userId, String taxbillNo) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("taxbillNo", taxbillNo);
		
		sqlSession.update("menu41.deleteTaxbillNo", map);		
	}



}
