package kr.co.itcen.fa.service.menu08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu08.Menu43Repository;
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

	public List<IntangibleAssetsVo> getList(String kwd) {
		return menu43Repository.getList(kwd);
	}

	public void update(IntangibleAssetsVo intangibleAssetsVo) {
		menu43Repository.update(intangibleAssetsVo);
	}

	public void delete(String id) {
		menu43Repository.delete(id);
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
