package kr.co.itcen.fa.service.menu02;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu02.Menu36Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu02.CustomerVo;

/**
 * 
 * @author 이지은
 * 매입거래처현황조회
 *
 */

@Service
public class Menu36Service {
	@Autowired
	private Menu36Repository menu36Repository;
	
	public void test() {
		menu36Repository.test();
	}
	
	public List<CustomerVo> list() {
		return menu36Repository.getList();
	}
	
	public DataResult<CustomerVo> selectAll(int page, CustomerVo customerVo) {
		DataResult<CustomerVo> dataResult = new DataResult<>();// 본인의 vo 형식을 리스트에 담음
		
		int totalCount = menu36Repository.selectAllCount(customerVo);//

		PaginationUtil paginationUtil = new PaginationUtil(page, totalCount, 11, 5);
		dataResult.setPagination(paginationUtil);//dataResult타입에 pagination에 값 세팅 
		System.out.println(totalCount);
		System.out.println(paginationUtil.getPageIndex()+","+paginationUtil.getListSize());

		// 검색기능을 구현했을때 사용하는 페이징
		//CustomerVo customerVo = new CustomerVo();//개인 조건을 넣어주는 폼 사용하기 나름
		//System.out.println(vo);
		customerVo.setPagination(paginationUtil);// paginnationUtil 세팅
		
		List<CustomerVo> list = menu36Repository.getList(customerVo);//뽑은 list를 dataResult타입을 list에 세팅 => 1개~ 11개 모두 리스트에 세팅
		dataResult.setDatas(list);
		
		return dataResult;
	}
	
	public Map<String, Object> gets(Map<String, String> parameters) {
		// TODO Auto-generated method stub
		Map<String, Object> map = menu36Repository.gets(parameters);
		return map;
	}
}
