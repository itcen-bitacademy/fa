package kr.co.itcen.fa.service.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu11.Menu46Repository;
import kr.co.itcen.fa.vo.menu11.STermDebtVo;

/**
 * 
 * @author 반현길
 * 단기차입금관리
 *
 */
@Service
public class Menu46Service {
	
	@Autowired
	private Menu46Repository menu46Repository;
	
	public List<STermDebtVo> getList() {
		return menu46Repository.getList();
	}
}
