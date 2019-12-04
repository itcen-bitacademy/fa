package kr.co.itcen.fa.service.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	
	public Map<String, Object> create(CardVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(menu05Repository.Nexist(vo)) {				// 삭제되지 않은 내용 중 중복된 카드넘버
			map.put("fail", true);  					
			return map;									// create 되지 않음	
		}
		if(menu05Repository.Yexist(vo)){				// 삭제된 내용 중 중복된 카드넘버		
		
			menu05Repository.deleteAll(vo);					// 삭제된 vo 삭제
		}
		map = menu05Repository.create(vo);
		map.put("success", true);
		return map;
	}

	public Map<String, Object> read(CardVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = menu05Repository.read(vo);
		map.put("success", true);
		return map;
	}
	
	public Map<String, Object> update(CardVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(menu05Repository.Nexist(vo)) {			// 삭제되지 않은 내용 중 중복된 카드넘버
			map.put("fail", true);  						
			return map;									// update 되지 않음
		}
		if(menu05Repository.Yexist(vo)){				// 삭제된 내용 중 중복된 카드넘버
			
			menu05Repository.deleteAll(vo);				// 삭제된 vo 삭제
		}
			
		map = menu05Repository.update(vo);
		map.put("success", true);
		return map;
	}
	
	public Map<String, Object> delete(CardVo vo) {
		Map<String, Object> map =menu05Repository.delete(vo);
		return map;					// 플래그 변화 및 카드 넘버에 d 추가
		
	}

	public List<CardVo> list() {
		return menu05Repository.list();
		
	}


	

}
