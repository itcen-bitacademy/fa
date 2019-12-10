package kr.co.itcen.fa.service.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu12.Menu14Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu02.PurchaseitemVo;
import kr.co.itcen.fa.vo.menu12.CustomerVo;
import kr.co.itcen.fa.vo.menu12.SalesSearchVo;
import kr.co.itcen.fa.vo.menu12.SalesVo;

/**
 * 
 * @author 김현곤
 * 매출현황조회
 *
 */

@Service
public class Menu14Service {
	
	@Autowired
	private Menu14Repository menu14Repository;

	public DataResult<SalesVo> getList(int page) {
		DataResult<SalesVo> dataResult = new DataResult<>();
		
		int totalCount = menu14Repository.selectAllCount();
		PaginationUtil paginationUtil = new PaginationUtil(page, totalCount, 11, 5);
		System.out.println(paginationUtil);
		dataResult.setPagination(paginationUtil);
		
		SalesSearchVo vo = new SalesSearchVo();
		vo.setPagination(paginationUtil);
		
		System.out.println(vo);
		
		List<SalesVo> list = menu14Repository.getList(vo);
		dataResult.setDatas(list);
		
		return dataResult;
	}

	public DataResult<SalesVo> getSerchList(SalesSearchVo vo, int page, int viewCount) {
		DataResult<SalesVo> dataResult = new DataResult<>();
		
		int totalCount = menu14Repository.searchCount(vo);
		if(totalCount<=11) { // 조회데이터 수 보다 전체 데이터 수가 작은경우
			viewCount = totalCount;
		}
		
		PaginationUtil paginationUtil = new PaginationUtil(page, totalCount, viewCount, 5);
		dataResult.setPagination(paginationUtil);
		
		vo.setPagination(paginationUtil);
		
		List<SalesVo> list = menu14Repository.getSerchList(vo);
		dataResult.setDatas(list);
		return dataResult;
	}

	public List<CustomerVo> getCustomerList() {
		return menu14Repository.getCustomerList();
	}

	public List<PurchaseitemVo> getItemList() {
		return menu14Repository.getItemList();
	}
}
