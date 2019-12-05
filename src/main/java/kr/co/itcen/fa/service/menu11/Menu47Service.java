package kr.co.itcen.fa.service.menu11;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu11.Menu47Repository;
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
	
	public List<STermDebtVo> getList() {
		return menu47Repository.getList();
	}
	
	public List<STermDebtVo> search(STermDebtVo sTermDebtVo){
		return menu47Repository.getList(sTermDebtVo);
	}
	
	public List<STermDebtVo> order(STermDebtVo sTermDebtVo, String orderColumn){
		Map map = new HashMap<String, Object>();
		map.put("vo", sTermDebtVo);
		map.put("orderColumn", orderColumn);
		
		List<STermDebtVo> list = menu47Repository.getList(map);
		return list;
	}
}
