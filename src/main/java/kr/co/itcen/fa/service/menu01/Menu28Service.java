package kr.co.itcen.fa.service.menu01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu01.Menu28Repository;
import kr.co.itcen.fa.util.PaginationUtil;
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

	public DataResult<CustomerVo> list(int page, CustomerVo customerVo, String customerDiv, String datepicker1, String datepicker2, String no, String deleteFlag) {
		DataResult<CustomerVo> dataResult = new DataResult<CustomerVo>();
		int totalCnt = menu28Repository.listCount(customerVo);
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		dataResult.setPagination(pagination);
		List<CustomerVo> list = menu28Repository.list(pagination, customerVo, customerDiv, datepicker1, datepicker2, no, deleteFlag);
		dataResult.setDatas(list);
		return dataResult;

	}

}
