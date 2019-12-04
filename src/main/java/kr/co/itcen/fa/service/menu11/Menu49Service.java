package kr.co.itcen.fa.service.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu11.Menu49Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;

/**
 * 
 * @author 김준호
 * 장기차입금현황조회
 *
 */
@Service
public class Menu49Service {
	
	@Autowired
	private Menu49Repository menu49Repository;
	
	public void test() {
		menu49Repository.test();
	}

	public DataResult<LTermdebtVo> list(int page,LTermdebtVo vo,String sort) {
		DataResult<LTermdebtVo> dataResult = new DataResult<LTermdebtVo>();
		
		int totalCnt = menu49Repository.listCount(vo);
		
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		dataResult.setPagination(pagination);
		List<LTermdebtVo> list = menu49Repository.list(pagination,vo,sort);
		dataResult.setDatas(list);
		
		return dataResult;
	}

	public List<SectionVo> selectSection() {
		// TODO Auto-generated method stub
		return menu49Repository.selectSection();
	}
}
