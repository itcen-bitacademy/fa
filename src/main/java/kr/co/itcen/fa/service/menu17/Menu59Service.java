package kr.co.itcen.fa.service.menu17;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu17.Menu59Repository;
import kr.co.itcen.fa.vo.menu17.AccountManagement;


/**
 * 
 * @author 이성훈
 * 재무제표계정관리 
 */

@Service
public class Menu59Service {
	
	@Autowired
	private Menu59Repository menu59Repository;
	
	public Boolean insert(AccountManagement vo) {
		Boolean count = menu59Repository.insert(vo);
		return count;	
	}
	
	public List<AccountManagement> getAllList(){
		
		return menu59Repository.getAllList();
	}
	
	public List<AccountManagement> getAllAccountList(){
		
		return menu59Repository.getAllAccountList();
	}

	public Boolean update(AccountManagement vo) {
		Boolean count = menu59Repository.update(vo);
		return count;	
	}	
	
	public Boolean delete(Long no) {
		Boolean count = menu59Repository.delete(no);
		return count;	
	}
}
