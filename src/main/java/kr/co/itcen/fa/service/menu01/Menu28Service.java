package kr.co.itcen.fa.service.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu01.Menu28Repository;
import kr.co.itcen.fa.vo.menu01.CustomerVo;

/**
 * 
 * @author 이종윤
 * 거래처 현황 조회
 *
 */

@Service
public class Menu28Service {
	@Autowired
	private Menu28Repository menu28Repository;

	public void test() {
		menu28Repository.test();
	}

	public List<CustomerVo> list() {
		return menu28Repository.list();
	}

//	public List<CustomerVo> listAll(String customerDiv, String customerNo, String deleteFlag) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	public Map<String, Object> searchList(String customerDiv, String datepicker1, String datepicker2, String customerNo,
			String deleteFlag) {
		// TODO Auto-generated method stub
		List<CustomerVo> list = menu28Repository.searchList(customerDiv, datepicker1, datepicker2, customerNo, deleteFlag);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("customerDiv", customerDiv);
		map.put("datepicker1", datepicker1);
		map.put("datepicker2", datepicker2);
		map.put("customerNo", customerNo);
		map.put("deleteFlag", deleteFlag);
		return map;
	}

}
