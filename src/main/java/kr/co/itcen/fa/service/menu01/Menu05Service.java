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
		if(menu05Repository.Nexist(vo)!=null) {				// 삭제되지 않은 내용 중 중복된 카드넘버
			return false;									// create 되지 않음	
		}
		if(menu05Repository.Yexist(vo)!=null){				// 삭제된 내용 중 중복된 카드넘버		
			menu05Repository.create(vo);		
			vo.setCardNo("d"+vo.getCardNo());
			return menu05Repository.delete(vo);					// 삭제된 vo 삭제
		}

		return menu05Repository.create(vo);
	}

	public List<CardVo> list() {
		return menu05Repository.list();
		
	}

	public boolean remove(CardVo vo) {
		return menu05Repository.remove(vo);					// 플래그 변화 및 카드 넘버에 d 추가
		
	}

	public boolean update(CardVo vo) {
		if(menu05Repository.Nexist(vo)!=null) {				// 삭제되지 않은 내용 중 중복된 카드넘버
			return false;									// update 되지 않음
		}
		if(menu05Repository.Yexist(vo)!=null){				// 삭제된 내용 중 중복된 카드넘버
			menu05Repository.update(vo);			
			vo.setCardNo("d"+vo.getCardNo());
			return menu05Repository.delete(vo);				// 삭제된 vo 삭제
		}
		return menu05Repository.update(vo);
	}
	

}
