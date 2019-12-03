package kr.co.itcen.fa.service.menu01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu01.Menu24Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.CardVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;

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
	

	public DataResult<LTermdebtVo> list(int page, CardVo vo) {
		DataResult<LTermdebtVo> dataResult = new DataResult<LTermdebtVo>();
		int totalCnt = menu24Repository.listCount(vo);
		
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		dataResult.setPagination(pagination);
		List<LTermdebtVo> list = menu24Repository.list(pagination,vo);
		dataResult.setDatas(list);
		
		return dataResult;
		
	}
}
