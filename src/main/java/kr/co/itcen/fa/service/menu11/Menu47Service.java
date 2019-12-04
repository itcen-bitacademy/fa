package kr.co.itcen.fa.service.menu11;

import java.util.List;

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
		"A".is
		return menu47Repository.getSearchedList(sTermDebtVo);
	}
}
