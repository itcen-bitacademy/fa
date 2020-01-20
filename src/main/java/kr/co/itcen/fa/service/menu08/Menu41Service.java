package kr.co.itcen.fa.service.menu08;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu08.Menu41Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu08.TaxbillVo;
import kr.co.itcen.fa.vo.menu08.VehicleVo;


/**
 * 
 *  @author 권영미
 *  차량관리
 */

@Service
public class Menu41Service {
	
	
	
	@Autowired
	private Menu41Repository menu41Repository;
	
	public void test() {
		
		
		menu41Repository.test();
	}
	
	
	//대분류 리스트 테스트
	public Map<String, Object> getSection() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sectionList", menu41Repository.getSection());
		return map;
	}
	
	//직급 리스트 테스트
	public Map<String, Object> getName() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jikNameList", menu41Repository.getJik());
		return map;
	}

	//거래처 리스트 테스트
	public Map<String, Object> getCustomer() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerList", menu41Repository.getCustomer());
		return map;
	}
	

	//리스트 등록
	public void insert(VehicleVo vehicleVo) {
		menu41Repository.insert(vehicleVo);
	}

	
	
	//리스트 수정
	public void update(VehicleVo vehicleVo) {
		menu41Repository.update(vehicleVo);
	}



	//리스트 삭제
	public void delete(String id) {
		System.out.println("삭제되는가" + id);
		menu41Repository.delete(id);
	}


	//전표 수정 -> 전표 보내기
	public CustomerVo getDepositNo(String customerNo) {
		CustomerVo cus = menu41Repository.getDepositNo(customerNo);
		return cus;
	}


	// 차량세금계산서테이블 넣기
	public void taxbill(TaxbillVo taxVo) {
		menu41Repository.insertTaxbill(taxVo);
		
	}

	//세금계산서를 포함한 차량 테이블 업데이트
	public void updateTax(String taxno, String veno, long voucherNo, String uId) {
		menu41Repository.updateTaxbill(taxno, veno, voucherNo, uId);
	}

	//세금계산서 정보 조회하기
	public  Map<String, Object> selectTaxList(String id) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("taxlist", menu41Repository.selectTaxList(id));
		map.put("lastnapbuDate", menu41Repository.selectTaxVo(id)); // 보증금 납부일 가져오기
		return map;
		
	}
	
	//세금계산서 정보 조회하기2
//	public DataResult<TaxbillVo> selectTaxList(String id, int page) {
//		
//		DataResult<TaxbillVo> dataResult = new DataResult<TaxbillVo>();
//		
//		int totalCount = menu41Repository.TaxListCount(id);
//		
//		PaginationUtil pagination = new PaginationUtil(page,totalCount, 11, 5);
//		dataResult.setPagination(pagination);
//		
//		
//		List<TaxbillVo> list = menu41Repository.selectTaxList(id, pagination);
//		dataResult.setDatas(list);
//		
//		return dataResult;
//		
////		Map<String, Object> map = new HashMap<String, Object>();
////		map.put("taxlist", menu41Repository.selectTaxList(id));
////		map.put("lastnapbuDate", menu41Repository.selectTaxVo(id)); // 보증금 납부일 가져오기
////		return map;
//		
//	}

	//vehicle 전표번호 가져오기
	public Long getVoucherNo(String id) {
		Long vNo = menu41Repository.getVoucherNo(id);
		return vNo;
	}

	//taxbill 전표번호 가져오기
	public List<Long> getTaxVoucherNo(String id) {
		List<Long> taxVNO = menu41Repository.getTaxVoucherNo(id);
		return taxVNO;
	}

	//세금계산서에서 지우기
	public void deleteTaxbill(String id) {
		menu41Repository.deleteTaxbill(id);
	}
	
	//페이징 하기
	public DataResult<VehicleVo> list(String id, int page) {
		DataResult<VehicleVo> dataResult = new DataResult<VehicleVo>();

		int totalCount = menu41Repository.listCount(id);
		
		//pagination
		PaginationUtil pagination = new PaginationUtil(page, totalCount, 11, 5);
		dataResult.setPagination(pagination);

		List<VehicleVo> list = menu41Repository.list(id, pagination);
		dataResult.setDatas(list);
		
		return dataResult;
	}

	//차량코드 중복 확인
	public boolean checkId(String id) {
		menu41Repository.checkId(id);
		return menu41Repository.checkId(id) != null;
	}

	//해당 페이지 세금계산서 리스트
	public Map<String, Object> selectpageTaxList(String id, int page) {
		
		int totalTaxCount = menu41Repository.listTaxCount(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagetaxlist", menu41Repository.selectpageTaxList(id, page));
	
		return map;
	}


	//세금계산서 페이징 그룹 리스트 계산
	public Map<String, Object> selectgroupTaxList(String id, int page_group) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("grouptaxlist", menu41Repository.selectgroupTaxList(id, page_group));
		
		return map;
	}


	//세금계산서 페이징 총 건수 
	public int taxcount(String id) {
		int count = menu41Repository.listTaxCount(id);
		return count;
	}


}
