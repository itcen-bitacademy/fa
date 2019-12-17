package kr.co.itcen.fa.service.menu12;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu12.Menu58Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu02.CustomerVo;
import kr.co.itcen.fa.vo.menu02.PurchasemanagementVo;

/**
 * 
 * @author 양홍석
 * 월별거래처매입현황
 *
 */
@Service
public class Menu58Service {
	
	@Autowired
	private Menu58Repository menu58Repository;
	
	public DataResult<PurchasemanagementVo> getAllPurchase(PurchasemanagementVo purchasemanagementVo, int page) {
		DataResult<PurchasemanagementVo> dataResult = new DataResult<>();
		
		int totalCount = menu58Repository.selectAllPurchasCount(purchasemanagementVo);
		PaginationUtil pagination = new PaginationUtil(page, totalCount, 11, 5);
		dataResult.setPagination(pagination);
		System.out.println(purchasemanagementVo);
		System.out.println(totalCount);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("purchase", purchasemanagementVo);
		map.put("pagination", pagination);
		
		List<PurchasemanagementVo> list = menu58Repository.selectAllPurchase(map);
		dataResult.setDatas(list);
		
		return dataResult;
	}
	
	public CustomerVo get(String no) {
		return menu58Repository.get(no);
	}
}
