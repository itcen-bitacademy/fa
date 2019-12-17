package kr.co.itcen.fa.service.menu12;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu12.Menu57Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu12.CustomerVo;
import kr.co.itcen.fa.vo.menu12.SalesVo;

/**
 * 
 * @author 곽세연
 * 월별거래처매출현황
 *
 */
@Service
public class Menu57Service {
	
	@Autowired
	private Menu57Repository menu57Repository;
	
	public DataResult<SalesVo> getAllSales(SalesVo vo, int page) {
		DataResult<SalesVo> dataResult = new DataResult<>();
		
		int totalCount = menu57Repository.selectAllSalesCount(vo);
		PaginationUtil pagination = new PaginationUtil(page, totalCount, 11, 5);
		dataResult.setPagination(pagination);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sales", vo);
		map.put("pagination", pagination);
		
		List<SalesVo> list = menu57Repository.selectAllSalse(map);
		dataResult.setDatas(list);
		
		return dataResult;
	}
	
	public CustomerVo get(String no) {
		return menu57Repository.get(no);
	}

}
