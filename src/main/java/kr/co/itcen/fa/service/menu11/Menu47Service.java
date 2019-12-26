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
		System.out.println("-----------------getListMap() Called---------------");
		STermDebtVo sTermDebtVo = new STermDebtVo();
		sTermDebtVo.setDeleteFlag("N");
		sTermDebtVo.setRepayCompleFlag("N");
		
		return getListMap(sTermDebtVo, 5, null, 1);
	}
	
	public Map getListMap(STermDebtVo sTermDebtVo, int pageSize, String orderColumn, int page) {
		System.out.println("-----------------getListMap(4) Called---------------");
		//조회조건에 따라 Row 총갯수를 구한다.
		int totalCnt = menu47Repository.getTotalCnt(sTermDebtVo);
		Pagination pagination = new Pagination(page, totalCnt, pageSize);
		
		//Mybatis로 전달할 데이터를 삽입
		Map map = pagination.getRowRangeMap();
		map.put("vo", sTermDebtVo);
		map.put("orderColumn", orderColumn);
		System.out.println("map: " + map);
		
		//리스트를 구한다
		List<STermDebtVo> list = menu47Repository.getList(map);
		
		//데이터를 넘긴다.
		map.clear();
		map.put("list", list);
		map.put("pagination", pagination);
		
		System.out.println("-----------------getListMap(4) End---------------");
		return map;
	}
}
