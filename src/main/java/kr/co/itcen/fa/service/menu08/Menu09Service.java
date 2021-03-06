package kr.co.itcen.fa.service.menu08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu08.Menu09Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu08.BuildingVo;
import kr.co.itcen.fa.vo.menu08.LandVo;


/**
 * 
 *  @author 정의돈
 *  토지관리
 */

@Service
public class Menu09Service {
	
	@Autowired
	private Menu09Repository menu09Repository;
	
	public void test() {
		menu09Repository.test();
	}

	public List<SectionVo> getSectionList() {
		List<SectionVo> list = menu09Repository.getSectionList();
		return list;
	}
	
	public Map<String, Object> getCustomerCodeList() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerList", menu09Repository.getCustomerList());
		
		return map;
	}

//	public Map<String, Object> getLandList() {
//		System.out.println("getLandList");
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("landList", menu09Repository.getLandList());
//		
//		return map;
//	}

	public void insertLand(LandVo landVo) {
		
		menu09Repository.insertLand(landVo);
		
	}

	public void delLand(String id, String userId) {
		menu09Repository.delLand(id, userId);	// 토지삭제
		
		
	}

	public void updateLand(LandVo landVo) {

		menu09Repository.updateLand(landVo);
		
	}

//	public Map<String, Object> getsearchList(String id) {
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("landList", menu09Repository.getSearchList(id));
//		
//		return map;
//	}

	public Boolean checkId(String id) {
		
		menu09Repository.checkId(id);
		return menu09Repository.checkId(id) != null;
	}

	public CustomerVo getDepositNo(String customerNo) {
		
		CustomerVo cus = menu09Repository.getDepositNo(customerNo);
		return cus;
	}

	public DataResult<LandVo> list(String id, int page) {
		DataResult<LandVo> dataResult = new DataResult<LandVo>();
		
		int totalCount = menu09Repository.listCount(id);
		
		//pagination
		PaginationUtil pagination = new PaginationUtil(page, totalCount, 11, 5);
		dataResult.setPagination(pagination);
		List<LandVo> list = menu09Repository.list(id, pagination);
		dataResult.setDatas(list);
		
		return dataResult;
	}

	//토지코드에 따른 전표번호 얻기
	public Long getVoucherNo(String id) {
		Long voucherNo = menu09Repository.getVoucherNo(id);
		return voucherNo;
	}

	public void delTaxbill(String userId, String taxbillNo) {
		menu09Repository.deltaxbill(userId, taxbillNo);
	}
}
