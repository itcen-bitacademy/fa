package kr.co.itcen.fa.service.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu01.Menu05Repository;
import kr.co.itcen.fa.util.PaginationUtil;
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
	
	
	public Map<String, Object> create(CardVo vo, int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(menu05Repository.Nexist(vo)) {				// 삭제되지 않은 내용 중 중복된 카드넘버
			map.put("fail", true);  					
			return map;									// create 되지 않음	
		}
		if(menu05Repository.Yexist(vo)){				// 삭제된 내용 중 중복된 카드넘버		
		
			menu05Repository.deleteAll(vo);					// 삭제된 vo 삭제
		}
		
		int totalCnt = menu05Repository.listCount();
		PaginationUtil pagination = new PaginationUtil(page, totalCnt+1, 11, 5);
		System.out.println(pagination.getEndPage());
		
		map = menu05Repository.create(vo, pagination);
		map.put("pagination", pagination);
		
		map.put("success", true);
		return map;
	}

	public Map<String, Object> read(CardVo vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map = menu05Repository.read(vo); 
		map.put("success", true);
		return map;
	}
	
	public Map<String, Object> update(CardVo vo, int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(menu05Repository.Nexist(vo)) {			// 삭제되지 않은 내용 중 중복된 카드넘버
			map.put("fail", true);  						
			return map;									// update 되지 않음
		}
		if(menu05Repository.Yexist(vo)){				// 삭제된 내용 중 중복된 카드넘버
			
			menu05Repository.deleteAll(vo);				// 삭제된 vo 삭제
		}
			
		int totalCnt = menu05Repository.listCount();
		System.out.println(totalCnt);
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		
		
		map = menu05Repository.update(vo, pagination);
		map.put("pagination", pagination);
		map.put("success", true);
		return map;
	}
	
	public Map<String, Object> delete(CardVo vo, int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		int totalCnt = menu05Repository.listCount();
		PaginationUtil pagination = new PaginationUtil(page, totalCnt-1, 11, 5);
		
		map = menu05Repository.delete(vo, pagination);
		map.put("pagination", pagination);
		map.put("success", true);
		
		return map;					// 플래그 변화 및 카드 넘버에 d 추가
		
	}

	public DataResult<CardVo> list(int page) {
		DataResult<CardVo> dataResult = new DataResult<CardVo>();
		int totalCnt= menu05Repository.listCount();
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		
		List<CardVo> list = menu05Repository.list(pagination);
		dataResult.setPagination(pagination);
		dataResult.setDatas(list);
		
		return dataResult;
		
	}

	public Map<String, Object> gets(String cardNo) {
		Map<String, Object> map = menu05Repository.gets(cardNo);
		return map;
	}


	

}
