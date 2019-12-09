package kr.co.itcen.fa.service.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu01.Menu24Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.CardVo;

/**
 * 
 * @author 김승곤
 * 카드현황조회
 *
 */
@Service
public class Menu24Service {
	
	@Autowired
	private Menu24Repository menu24Repository;
	

	public DataResult<CardVo> list(int page, CardVo vo) {
		DataResult<CardVo> dataResult = new DataResult<CardVo>();
		
		int totalCnt = menu24Repository.listCount(vo);
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		
		dataResult.setPagination(pagination);
		List<CardVo> list = menu24Repository.list(pagination,vo);
		dataResult.setDatas(list);
		
		return dataResult;
		
	}


	public Map<String, Object> read(CardVo vo, int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int totalCnt = menu24Repository.listCount(vo);
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		
		map = menu24Repository.read(pagination, vo);
		map.put("pagination", pagination);
		
		map.put("success", true);
		return map;
	}


}
