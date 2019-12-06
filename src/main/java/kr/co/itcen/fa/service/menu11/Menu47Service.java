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
	
	public List<STermDebtVo> getList(Pagination pagination) {
		Map map = pagination.getRowRangeMap();
		int totalCnt = menu47Repository.getTotalCount();
		pagination.processPaging(totalCnt);
		return menu47Repository.getList(map);
	}
	
	public List<STermDebtVo> search(STermDebtVo sTermDebtVo, Pagination pagination){
		Map map = pagination.getRowRangeMap();
		map.put("vo", sTermDebtVo);
		int totalCnt = menu47Repository.getTotalCount();
		pagination.processPaging(totalCnt);
		return menu47Repository.getList(map);
	}
	
	public List<STermDebtVo> order(STermDebtVo sTermDebtVo, String orderColumn, Pagination pagination){
		Map map = pagination.getRowRangeMap();
		map.put("vo", sTermDebtVo);
		map.put("orderColumn", orderColumn);
		int totalCnt = menu47Repository.getTotalCount();
		pagination.processPaging(totalCnt);
		return menu47Repository.getList(map);
	}
}
