package kr.co.itcen.fa.service.menu11;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu11.Menu47Repository;
import kr.co.itcen.fa.util.Pagination;
import kr.co.itcen.fa.vo.menu11.STermDebtVo;

/**
 * 
 * @author 반현길
 * 단기차입금현황조회
 *
 */
@Service
public class Menu47Service {
	
	@Autowired
	private Menu47Repository menu47Repository;
	
	public Map getListMap() {
		return search(null);
	}
	
	public Map search(STermDebtVo sTermDebtVo){
		return order(sTermDebtVo, null);
	}
	
	public Map order(STermDebtVo sTermDebtVo, String orderColumn){
		return paging(sTermDebtVo, orderColumn, 1);
	}
	
	public Map paging(STermDebtVo sTermDebtVo, String orderColumn, int page) {
		//조회조건에 따라 Row 총갯수를 구한다.
		int totalCnt = menu47Repository.getTotalCnt(sTermDebtVo);
		Pagination pagination = new Pagination(5, 5, page, totalCnt);
		Map map = pagination.getRowRangeMap();
		map.put("vo", sTermDebtVo);
		map.put("orderColumn", orderColumn);
		List<STermDebtVo> list = menu47Repository.getList(map);
		
		map.clear();
		map.put("list", list);
		map.put("pagination", pagination);
		return map;
	}
}
