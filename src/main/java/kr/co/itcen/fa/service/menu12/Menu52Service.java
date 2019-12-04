package kr.co.itcen.fa.service.menu12;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu12.Menu52Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu12.CustomerVo;

/**
 * 
 * @author 양홍석
 * 매출거래처현황조회
 *
 */
@Service
public class Menu52Service {
	
	@Autowired
	private Menu52Repository menu52Repository;

	public int getTotalCnt() {
		return menu52Repository.findCustomerCnt();
	}

	public List<CustomerVo> getAllCustomer(CustomerVo customerVo, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customer", customerVo);
		map.put("pagination", pagination);
		
		return menu52Repository.findAllCustomer(map);
	}

}
