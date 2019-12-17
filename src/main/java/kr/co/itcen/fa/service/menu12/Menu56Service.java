package kr.co.itcen.fa.service.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu12.Menu56Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu12.CurrentSituationVo;

/**
 * 
 * @author 곽세연
 * 품목대분류별 매입매출현황
 *
 */
@Service
public class Menu56Service {
	
	@Autowired
	private Menu56Repository menu56Repository;

	//전체 리스트 
	public DataResult<CurrentSituationVo> getList(int page,CurrentSituationVo vo){
		DataResult<CurrentSituationVo> dataResult = new DataResult<CurrentSituationVo>();
		int totalCnt=menu56Repository.selectAllCount(vo);
		PaginationUtil pagination = new PaginationUtil(page,totalCnt,11,5);
		
		dataResult.setPagination(pagination);
		List<CurrentSituationVo> list =menu56Repository.getList(pagination, vo);
		dataResult.setDatas(list);
		return dataResult;
	}
	
	// 대분류  보여주기 위한 코드
	public List<SectionVo> getCategory(){
		return menu56Repository.getCategory(); 
	}
	
	// 품목 분류 보여주기 위한 코드
	public List<CurrentSituationVo> getItemname(String sectioncode){
		return menu56Repository.getItemname(sectioncode);
	}
	
}
