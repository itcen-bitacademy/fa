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
			bavo.setDeleteFlag("N");
		}
		
		int totalCnt = menu26Repository.selectCount(bavo);

		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		
		List<BankAccountVo> list = menu26Repository.list(bavo, pagination);
		
		dataResult.setPagination(pagination);
		dataResult.setDatas(list);
		
		return dataResult;
	}
	
	public Map<String, Object> read(BankAccountVo bavo, int page) {
		bavo.setDepositNo(bavo.getDepositNo()+"%");
		int totalCnt = menu26Repository.selectCount(bavo); 
		System.out.println("또달카운트 : " + totalCnt);

		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		Map<String, Object> map = new HashMap<String, Object>();
		
		map = menu26Repository.read(bavo, pagination);
		
		map.put("pagination", pagination);
		map.put("success", true);
		
		return map;
	}

}