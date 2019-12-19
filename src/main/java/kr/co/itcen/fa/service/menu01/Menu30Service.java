package kr.co.itcen.fa.service.menu01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu01.Menu30Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.ReceiptVo;
import kr.co.itcen.fa.vo.menu17.StatementDataVo;

/**
 * 
 * @author 김승곤 황슬기
 * 계정거래처명세서조회
 *
 */
@Service
public class Menu30Service {
	
	@Autowired
	private Menu30Repository menu30Repository;
	

	public DataResult<ReceiptVo> search(int page, ReceiptVo revo) {
		DataResult<ReceiptVo> dataResult = new DataResult<ReceiptVo>();
	
		System.out.println(revo);
		int totalCnt = menu30Repository.listCount(revo);
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		System.out.println(totalCnt);
		dataResult.setPagination(pagination);
		List<ReceiptVo> list = menu30Repository.list(pagination,revo);
		dataResult.setDatas(list);
		
		//테스트용
		System.out.println("결과 조회 :" + list.toString());
		
		return dataResult;
	}
	
	public void closingEntries(List<StatementDataVo> vo) {
		
	}
}
