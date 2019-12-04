package kr.co.itcen.fa.service.menu17;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu17.Menu59Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu17.AccountManagementVo;
import kr.co.itcen.fa.vo.menu17.Menu17SearchForm;


/**
 * 
 * @author 이성훈
 * 재무제표계정관리 
 */

@Service
public class Menu59Service {
	
	@Autowired
	private Menu59Repository menu59Repository;
	
	public Boolean insert(AccountManagementVo vo) {		

		return menu59Repository.insert(vo);	
	}
	
	public DataResult<AccountManagementVo> getList(AccountManagementVo vo, int page ,int pagee ){
		DataResult<AccountManagementVo> dataResult = new DataResult<>();
		
		int totalCount = menu59Repository.selectCount(vo);
		System.out.println(totalCount);
		
		PaginationUtil paginationUtil = new PaginationUtil(page, totalCount, pagee, 5);	
		if(totalCount == 0) {
			paginationUtil.setListSize(0);
			paginationUtil.setPageSize(0);
		}
		
		dataResult.setPagination(paginationUtil);
		
		Menu17SearchForm menu17SearchForm = new Menu17SearchForm();
		menu17SearchForm.setPagination(paginationUtil);		
		menu17SearchForm.setYear(vo.getAccountUsedyear());
		menu17SearchForm.setAccountNo(vo.getAccountNo());
		menu17SearchForm.setAccountOrder(vo.getAccountOrder());
		menu17SearchForm.setAccountStatementType(vo.getAccountStatementType());
		
		List<AccountManagementVo> list = menu59Repository.getList(menu17SearchForm);
		dataResult.setDatas(list);		
		
		return dataResult;
	}
	
	public List<AccountManagementVo> getAllAccountList(){
		
		return menu59Repository.getAllAccountList();
	}

	public Boolean update(AccountManagementVo vo) {
		Boolean count = menu59Repository.update(vo);
		return count;	
	}	
	
	public Boolean delete(Long no) {
		Boolean count = menu59Repository.delete(no);
		return count;	
	}
	
	public List<AccountManagementVo> chechedAccount(AccountManagementVo vo) {
		return menu59Repository.chechedAccount(vo);	
	}
	
	public List<AccountManagementVo> chechedAccount2(AccountManagementVo vo) {
		return menu59Repository.chechedAccount2(vo);	
	}
}
