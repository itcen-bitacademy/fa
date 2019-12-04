package kr.co.itcen.fa.service.menu12;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu12.Menu15Repository;
import kr.co.itcen.fa.vo.menu12.CustomerVo;

/**
 * 
 * @author 양홍석
 * 매출거래처관리
 *
 */
@Service
public class Menu15Service {
	
	@Autowired
	private Menu15Repository menu15Repository;
	
	public List<CustomerVo> getAllCustomer(String no) {
		return menu15Repository.findAllCustomer(no);
	}

	public void addCustomer(CustomerVo customerVo) {
		menu15Repository.saveCustomer(customerVo);
	}

	public void modifyCustomer(CustomerVo customerVo) {
		menu15Repository.updateCustomer(customerVo);
	}

	public Boolean existCustomer(String no) {
		return menu15Repository.getCustomer(no) != null;
	}

	public Boolean deleteCustomer(List<String> checkNoList) {
		return menu15Repository.deleteCustomer(checkNoList) != 0;
	}

	

}
