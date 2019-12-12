package kr.co.itcen.fa.service.menu11;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu11.Menu66Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu11.RepayVo;

/**
 * 
 * @author 박준호
 * 상환내역관리
 *
 */
@Service
public class Menu66Service {
	
	@Autowired
	private Menu66Repository menu66Repository;

	public DataResult<RepayVo> list(int page, String code) {
		DataResult<RepayVo> dataResult = new DataResult<RepayVo>();
		int totalCnt = menu66Repository.listCount(code);

		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		dataResult.setPagination(pagination);
		List<RepayVo> list = menu66Repository.list(code, pagination);
		dataResult.setDatas(list);

		return dataResult;
	}

//	public List<RepayVo> selectSection() {
//		return menu66Repository.selectSection();
//	}

}
