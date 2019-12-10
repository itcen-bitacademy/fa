package kr.co.itcen.fa.service.menu08;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu08.Menu44Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu08.IntangibleAssetsVo;


/**
 * 
 *  @author 김유진
 *  무형자산조회
 */

@Service
public class Menu44Service {
	
	@Autowired
	private Menu44Repository menu44Repository;
	
	public void test() {
		menu44Repository.test();
	}

	public Map<? extends String, ? extends Object> getSection() {
		Map<String, Object> map = new HashMap<>();
		map.put("sectionList",menu44Repository.getSection());
		return map;
	}

	public DataResult<IntangibleAssetsVo> getList(int page, IntangibleAssetsVo intangibleAssetsVo) {
		DataResult<IntangibleAssetsVo> dataResult = new DataResult<>(); // 본인의 vo 형식을 리스트에 담음
		
		int totalCount = menu44Repository.selectCount(intangibleAssetsVo);
		
		PaginationUtil paginationUtil = new PaginationUtil(page, totalCount, 11, 5);
		dataResult.setPagination(paginationUtil); // dataResult타입에 pagination에 값 세팅 
		
		intangibleAssetsVo.setPagination(paginationUtil);// paginnationUtil 세팅
		
		List<IntangibleAssetsVo> list = menu44Repository.getList(intangibleAssetsVo);//뽑은 list를 dataResult타입을 list에 세팅 => 1개~ 11개 모두 리스트에 세팅
		dataResult.setDatas(list);
		
		return dataResult;
	}

	public DataResult<IntangibleAssetsVo> getAllList(int page, IntangibleAssetsVo intangibleAssetsVo) {
		DataResult<IntangibleAssetsVo> dataResult = new DataResult<>(); // 본인의 vo 형식을 리스트에 담음
		
		int totalCount = menu44Repository.selectAllCount(intangibleAssetsVo);
		
		PaginationUtil paginationUtil = new PaginationUtil(page, totalCount, 11, 5);
		dataResult.setPagination(paginationUtil); // dataResult타입에 pagination에 값 세팅 
		
		intangibleAssetsVo.setPagination(paginationUtil);// paginnationUtil 세팅
		
		List<IntangibleAssetsVo> list = menu44Repository.getAllList(intangibleAssetsVo);//뽑은 list를 dataResult타입을 list에 세팅 => 1개~ 11개 모두 리스트에 세팅
		dataResult.setDatas(list);
		
		return dataResult;
	}

}