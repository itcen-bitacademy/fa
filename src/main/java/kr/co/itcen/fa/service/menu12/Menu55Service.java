package kr.co.itcen.fa.service.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu12.Menu55Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu12.CurrentSituationVo;

/**
 * 
 * @author 곽세연
 * 품목별매입매출현황
 *
 */
@Service
public class Menu55Service {
	
	@Autowired
	private Menu55Repository menu55Repository;

	//전체 리스트
	public DataResult<CurrentSituationVo> getList(int page,CurrentSituationVo vo){
		DataResult<CurrentSituationVo> dataResult = new DataResult<CurrentSituationVo>();
		int totalCnt=menu55Repository.selectAllCount(vo);
		PaginationUtil pagination = new PaginationUtil(page, totalCnt,11, 5);
		
		dataResult.setPagination(pagination);
		List<CurrentSituationVo> list =menu55Repository.getList(pagination, vo);
		dataResult.setDatas(list);				
				
		return dataResult;
	}
	
	//품목을 가져오기 위한 코드
	public List<CurrentSituationVo> getitemcode(String itemcode) {
		return menu55Repository.getitemcode(itemcode);
	}




}
