package kr.co.itcen.fa.service.menu08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu08.Menu40Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu08.BuildingVo;


/**
 * 
 *  @author 김민준
 *  건물현황조회
 */

@Service
public class Menu40Service {
	
	@Autowired
	private Menu40Repository menu40Repository;
	
	//조회
	public DataResult<BuildingVo> list(BuildingVo buildingvo, int page, String startDate, String endDate) {
		DataResult<BuildingVo> dataResult = new DataResult<BuildingVo>();
		
		int totalCount = menu40Repository.listCount(buildingvo, startDate, endDate);
		
		//pagination
		PaginationUtil pagination = new PaginationUtil(page, totalCount, 11, 5);
		dataResult.setPagination(pagination);
		List<BuildingVo> list = menu40Repository.list(buildingvo, pagination, startDate, endDate);
		dataResult.setDatas(list);
		
		return dataResult;
	}
	
	//대분류 리스트
	public Map<String, Object> getSection() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sectionList", menu40Repository.getSection());
		return map;
	}
	
	//거래처 리스트
	public Map<String, Object> getCustomer() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerList", menu40Repository.getCustomer());
		return map;
	}
}
