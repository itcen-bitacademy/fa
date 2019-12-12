package kr.co.itcen.fa.service.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu01.Menu26Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;

/**
 * 
 * @author 황슬기 
 * 계좌조회
 *
 */
@Service
public class Menu26Service {
	
	@Autowired
	private Menu26Repository menu26Repository;
	

	public DataResult<BankAccountVo> defaultRead(int page, BankAccountVo bavo) {
		DataResult<BankAccountVo> dataResult = new DataResult<BankAccountVo>();
		if(bavo.getDeleteFlag()==null) {
			bavo.setDepositNo("");
			bavo.setMakeDate("");
			bavo.setEnDate("");
			bavo.setDeleteFlag("N");
		}
		
		int totalCnt = menu26Repository.selectCount(bavo);

		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		
		List<BankAccountVo> list = menu26Repository.list(bavo, pagination);
		
		System.out.println("startoage:" + totalCnt);
		System.out.println("startoage:" + pagination.getStartPage());
		System.out.println("startoage:" + pagination.getEndPage());
		dataResult.setPagination(pagination);
		dataResult.setDatas(list);
		System.out.println(list.toString());
		
		return dataResult;
	}
	

}