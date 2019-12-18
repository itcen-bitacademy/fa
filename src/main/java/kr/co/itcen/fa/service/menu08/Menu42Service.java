package kr.co.itcen.fa.service.menu08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu08.Menu42Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu08.LandVo;
import kr.co.itcen.fa.vo.menu08.VehicleVo;


/**
 * 
 *  @author 권영미
 *  차량현황조회
 */

@Service
public class Menu42Service {
	
	@Autowired
	private Menu42Repository menu42Repository;
	
	public void test() {
		menu42Repository.test();
	}

	//대분류 리스트 테스트
	public Map<String, Object> getSection() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sectionList", menu42Repository.getSection());
		return map;
	}
		
	//직급 리스트 테스트
	public Map<String, Object> getName() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jikNameList", menu42Repository.getJik());
		return map;
	}

	//리스트조회하기
	public Map<String, Object> selectList() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", menu42Repository.selectList());
		return map;
		
	}

	//기본 페이징된 화면
	public DataResult<VehicleVo> list(String id, int page) {
		
		DataResult<VehicleVo> dataResult = new DataResult<VehicleVo>();
		
		int totalCount = menu42Repository.listCount(id);
		
		//pagination
		PaginationUtil pagination = new PaginationUtil(page, totalCount, 11, 5);
		dataResult.setPagination(pagination);
		List<VehicleVo> list = menu42Repository.list(id, pagination);
		dataResult.setDatas(list);
		
		return dataResult;
	}

	//검색된 화면
	public DataResult<VehicleVo> getList(VehicleVo vehicleVo, String startDate, String endDate, int page) {
		
		DataResult<VehicleVo> dataResult = new DataResult<VehicleVo>();
		
		int totalCount = menu42Repository.listCount(vehicleVo, startDate, endDate);
		
		//pagination
		PaginationUtil pagination = new PaginationUtil(page, totalCount, 11, 5);
		dataResult.setPagination(pagination);
		
		List<VehicleVo> list = menu42Repository.getList(vehicleVo, startDate, endDate, pagination);
		dataResult.setDatas(list);
		
		return dataResult;
	}
}
