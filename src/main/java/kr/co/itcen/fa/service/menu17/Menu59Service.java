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
	
	//재무제표 계정관리 조회
	public DataResult<AccountManagementVo> getList(AccountManagementVo vo, int page ){
		DataResult<AccountManagementVo> dataResult = new DataResult<>();

		DataResult<AccountManagementVo> data = menu59Repository.selectCount(vo);
	
		PaginationUtil paginationUtil = new PaginationUtil(page, data.getDatas().get(0).getCnt(), 11, 5);	

		if(data.getDatas().get(0).getCnt() == 0) {
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

		if(list.size() > 0) {
		list.get(0).setMax(data.getDatas().get(0).getMax());
		list.get(0).setMaxcnt(data.getDatas().get(0).getMaxcnt());
			dataResult.setDatas(list);	
		}

		return dataResult;
	}
	
	//계정과목, 계정명칭 조회
	public List<AccountManagementVo> getAllAccountList(){
		
		return menu59Repository.getAllAccountList();
	}
	
	/** 전 버전 저장, 수정 버튼에 대한 이벤트 메서드
	//재무제표 계정관리 저장
	public DataResult<AccountManagementVo> add(AccountManagementVo vo) {		
		DataResult<AccountManagementVo> dataResult = new DataResult<>();
		
		if(vo.getAccountNo() == null || vo.getAccountUsedyear() == null || vo.getAccountOrder() == null) {
			dataResult.setStatus(false);
			dataResult.setError("데이터를 입력해주세요");
			
			return dataResult;
		}
		
		if(menu59Repository.chechedAccount(vo).size() < 1) {	
			menu59Repository.add(vo);
		}else {
			dataResult.setStatus(false);
			dataResult.setError("이미 존재하는 데이터입니다.");
		}
		
		return dataResult;	
	}
	
	//수정
	public DataResult<AccountManagementVo> update(AccountManagementVo vo) {
		DataResult<AccountManagementVo> dataResult = new DataResult<>();
		
		if(vo.getAccountNo() == null || vo.getAccountUsedyear() == null || vo.getAccountOrder() == null) {
			dataResult.setStatus(false);
			dataResult.setError("데이터를 입력해주세요");
			
			return dataResult;
		}
		
		List<AccountManagementVo> list = menu59Repository.chechedAccount(vo);
		
		if(list.size() >= 1) {
			if(list.get(0).getAccountOrder() != vo.getAccountOrder()) {		
				if(list.get(0).getAccountNo().equals(vo.getAccountNo())) {
					if(menu59Repository.chechedAccount3(vo).size() < 1) {

						vo.setUpdateUserid(vo.getUpdateUserid());
	
						menu59Repository.update(vo);
					} else {

						//result = "overlap";
						//model.addAttribute("result", result);
						
						dataResult.setStatus(false);
						dataResult.setError("이미 존재하는 데이터입니다.");
						
						return dataResult;
					}
				}else {				
					if(menu59Repository.chechedAccount2(vo).size() < 1) {
						//result = "nono";
						//model.addAttribute("result", result);
						
						vo.setUpdateUserid(vo.getUpdateUserid());
	
						menu59Repository.update(vo);
					}else {
						dataResult.setStatus(false);
						dataResult.setError("이미 존재하는 데이터입니다.");
						
						return dataResult;
					}
				}
			}else {
				dataResult.setStatus(false);
				dataResult.setError("이미 존재하는 데이터입니다.");
				
				return dataResult;
			}
			
		}else {			
			dataResult.setStatus(false);
			dataResult.setError("없는 데이터는 수정이 불가합니다.");
			
			return dataResult;

		}
		
		return dataResult;	
	}	
*/	
	//삭제
	public DataResult<AccountManagementVo> delete(AccountManagementVo vo) {
		DataResult<AccountManagementVo> dataResult = new DataResult<>();
		
		if(vo.getAccountNo() == null || vo.getAccountUsedyear() == null || vo.getAccountOrder() == null) {
			dataResult.setStatus(false);
			dataResult.setError("삭제할 데이터를 입력해주세요");
			
			return dataResult;
		}
		
		
		menu59Repository.delete(vo.getNo());
		
		return dataResult;	
	}
	

	public DataResult<AccountManagementVo> testUpdate(List<AccountManagementVo> vo) {
		DataResult<AccountManagementVo> dataResult = new DataResult<>();
		
		for(int i = 0; i < vo.size(); i++) {
			List<AccountManagementVo> list = menu59Repository.chechedAccount(vo.get(i));
			
			if(list.size() >= 1) {
				if(list.get(0).getAccountOrder() != vo.get(i).getAccountOrder()) {		
					if(list.get(0).getAccountNo().equals(vo.get(i).getAccountNo())) {
						if(menu59Repository.chechedAccount3(vo.get(i)).size() < 1) {							
							//수정
							menu59Repository.update(vo.get(i));
						}else {
							dataResult.setStatus(false);
							dataResult.setError("이미 존재하는 데이터는 저장 혹은 수정이 불가합니다.");
						}
					}else {
						if(menu59Repository.chechedAccount2(vo.get(i)).size() < 1) {
							//수정
							menu59Repository.update(vo.get(i));
						}else {
							dataResult.setStatus(false);
							dataResult.setError("이미 존재하는 데이터는 저장 혹은 수정이 불가합니다.");
						}
					}
				}else {
					dataResult.setStatus(false);
					dataResult.setError("이미 존재하는 데이터는 저장 혹은 수정이 불가합니다.");
				}
			}else {
				//저장
				menu59Repository.add(vo.get(i));
			}
		}
		
		
		return dataResult;	

	}	
}
