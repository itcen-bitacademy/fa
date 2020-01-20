package kr.co.itcen.fa.service.menu08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu08.Menu43Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu08.IntangibleAssetsVo;
import kr.co.itcen.fa.vo.menu08.PurposeVo;


/**
 * 
 *  @author 김유진
 *  무형자산관리
 */

@Service
public class Menu43Service {
	
	@Autowired
	private Menu43Repository menu43Repository;
	
	public void test() {
		menu43Repository.test();
	}
	
	public void insert(IntangibleAssetsVo intangibleAssetsVo) {
		menu43Repository.insert(intangibleAssetsVo);
	}

	public DataResult<IntangibleAssetsVo> getList(int page, IntangibleAssetsVo intangibleAssetsVo, String startDate, String endDate) {
		DataResult<IntangibleAssetsVo> dataResult = new DataResult<IntangibleAssetsVo>();
		int totalCount = menu43Repository.selectCount(intangibleAssetsVo, startDate, endDate);
		
		//pagination
		PaginationUtil pagination = new PaginationUtil(page, totalCount, 11, 5);
		dataResult.setPagination(pagination);
		
		intangibleAssetsVo.setPagination(pagination);// paginnationUtil 세팅

		dataResult.setPagination(pagination);
		
		List<IntangibleAssetsVo> list = menu43Repository.getList(pagination, intangibleAssetsVo, startDate, endDate);
		dataResult.setDatas(list);
		
		return dataResult;
	}

	public void update(IntangibleAssetsVo intangibleAssetsVo) {
		menu43Repository.update(intangibleAssetsVo);
	}

	public void delete(String id, String userId, String taxbillNo) {
		menu43Repository.delete(id);
		
		// 세금계산서 삭제
		menu43Repository.delTaxbill(userId, taxbillNo);
		
	}

	public Map<? extends String, ? extends Object> getSection() {
		Map<String, Object> map = new HashMap<>();
		map.put("sectionList",menu43Repository.getSection());
		return map;
	}

	public Boolean checkId(String id) {
		return menu43Repository.get(id) != null;
	}

	public Map<? extends String, ? extends Object> getCustomer() {
		Map<String, Object> map = new HashMap<>();
		map.put("customerList",menu43Repository.getCustomer());
		return map;
	}
	
	public Map<? extends String, ? extends Object> getPurpose() {
		Map<String, Object> map = new HashMap<>();
		map.put("purposeList",menu43Repository.getPurpose());
		return map;
	}

	public CustomerVo getCustomerInfo(String customerNo) {
		return menu43Repository.getCustomerInfo(customerNo);
	}

	public Long getVoucherNo(IntangibleAssetsVo intangibleAssetsVo) {
		return menu43Repository.getVoucherNo(intangibleAssetsVo);
	}

	public PurposeVo getPurposeInfo(String purpose) {
		return menu43Repository.getPurposeInfo(purpose);
	}

}
