package kr.co.itcen.fa.service.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu11.Menu48Repository;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;

/**
 * 
 * @author 김준호
 * 장기차입금관리
 *
 */
@Service
public class Menu48Service {
	
	@Autowired
	private Menu48Repository menu48Repository;
	
	public void test() {
		menu48Repository.test();
	}

	public Boolean insert(LTermdebtVo vo) {
		return menu48Repository.insert(vo);
	}

	public List<LTermdebtVo> list() {
		return menu48Repository.list();
	}

	public Boolean update(LTermdebtVo vo) {
		return menu48Repository.update(vo);
	}

	public Boolean delete(Long no) {
		return  menu48Repository.delete(no);
	}
}
