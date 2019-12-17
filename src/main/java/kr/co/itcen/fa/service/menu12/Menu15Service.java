package kr.co.itcen.fa.service.menu12;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu12.Menu15Repository;
import kr.co.itcen.fa.vo.UserVo;
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
	
	public List<CustomerVo> getAllCustomer(List<String> checkNoList) {
		return menu15Repository.findAllCustomer(checkNoList);
	}
	
	public void addCustomer(CustomerVo customerVo) {
		customerVo.setNo("S"+customerVo.getNo());
		if(customerVo.getOpenDate().equals("")) {
			customerVo.setOpenDate(null);
		}
		
		menu15Repository.saveCustomer(customerVo);
		
		customerVo.setNo(customerVo.getNo().substring(1));
		System.out.println(customerVo);
	}

	public void modifyCustomer(CustomerVo customerVo) {
		customerVo.setNo("S"+customerVo.getNo());
		if(customerVo.getOpenDate().equals("")) {
			customerVo.setOpenDate(null);
		}
		
		menu15Repository.updateCustomer(customerVo);
		
		customerVo.setNo(customerVo.getNo().substring(1));
	}

	public Boolean existCustomer(String no) {
		return menu15Repository.getCustomer(no) != null;
	}

	public Boolean deleteCustomer(List<String> checkNoList, UserVo userVo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("checkNoList", checkNoList);
		map.put("userVo", userVo);
		
		return menu15Repository.deleteCustomer(map) != 0;
	}

}
