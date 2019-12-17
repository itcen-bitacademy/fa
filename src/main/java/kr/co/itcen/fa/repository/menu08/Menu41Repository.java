package kr.co.itcen.fa.repository.menu08;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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


	public String selectTaxVo(String id) {
		
		String taxVo = sqlSession.selectOne("menu41.selectTaxVo", id);
			
		return taxVo;
	}

	public Long getVoucherNo(String id) {
	
		Long vNo = sqlSession.selectOne("menu41.selectVNO",id);
		return vNo;
	}

	public List getTaxVoucherNo(String id) {
		
		List<Long> taxVNO = sqlSession.selectList("menu41.selectTaxVNO",id);
		return taxVNO;
	}

	public boolean deleteTaxbill(String id) {
		int count = sqlSession.delete("menu41.deleteTaxbill", id);
		return count == 1;
	}

	

}
