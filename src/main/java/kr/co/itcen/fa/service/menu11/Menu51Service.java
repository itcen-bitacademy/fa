package kr.co.itcen.fa.service.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu11.Menu51Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu11.PdebtVo;

/**
 * 
 * @author 박준호 사채현황조회
 *
 */
@Service
public class Menu51Service {

	@Autowired
	private Menu51Repository menu51Repository;

	public DataResult<PdebtVo> list(int page,PdebtVo vo,String sort) {
		DataResult<PdebtVo> dataResult = new DataResult<PdebtVo>();
		
		int totalCnt = menu51Repository.listCount(vo);
		
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		dataResult.setPagination(pagination);
		List<PdebtVo> list = menu51Repository.list(pagination,vo,sort);
		dataResult.setDatas(list);
		
		return dataResult;
	}
	
	public List<SectionVo> selectSection() {
		return menu51Repository.selectSection();
	}

}
