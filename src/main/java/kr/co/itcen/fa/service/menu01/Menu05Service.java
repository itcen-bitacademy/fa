package kr.co.itcen.fa.service.menu01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu01.Menu05Repository;
import kr.co.itcen.fa.vo.menu01.CardVo;

/**
 * 
 * @author 김승곤
 * 카드관리
 *
 */
@Service
public class Menu05Service {
	
	@Autowired
	private Menu05Repository menu05Repository;
	
	public boolean create(CardVo vo) {
		return menu05Repository.create(vo);
	}

	public List<CardVo> list() {
		return menu05Repository.list();
		
	}

	public boolean remove(CardVo vo) {
		return menu05Repository.remove(vo);
		
	}

	public boolean update(CardVo vo) {
		return menu05Repository.update(vo);
		
	}

	public boolean exist(CardVo vo) {
		return menu05Repository.exist(vo)!=null;
		
	}
}
