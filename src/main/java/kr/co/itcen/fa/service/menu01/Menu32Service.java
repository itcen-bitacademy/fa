package kr.co.itcen.fa.service.menu01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu01.Menu32Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.AccountCustomerLedgerVo;
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu11.BankVo;
import kr.co.itcen.fa.vo.menu17.AccountManagementVo;

/**
 * 
 * @author 이종윤 
 * 계정거래처원장 조회
 *
 */

@Service
public class Menu32Service {
	@Autowired
	private Menu32Repository menu32Repository;

	public void test() {
		menu32Repository.test();
	}

	public List<CustomerVo> getCustomerNoInfo(String customerNo) {
		return menu32Repository.getCustomerNoInfo(customerNo);
	}

	public List<CustomerVo> getCustomerNameInfo(String customerName) {
		return menu32Repository.getCustomerNameInfo(customerName);
	}

	public DataResult<AccountCustomerLedgerVo> list(/*int page,*/ AccountCustomerLedgerVo aclVo, Long accountNo, String datepicker1,
			String datepicker2, String customerNo) {
		DataResult<AccountCustomerLedgerVo> dataResult = new DataResult<AccountCustomerLedgerVo>();
		//int totalCnt = menu32Repository.listCount(aclVo);
		//PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		//dataResult.setPagination(pagination);
		List<AccountCustomerLedgerVo> list = menu32Repository.list(/*pagination,*/ aclVo, accountNo, datepicker1, datepicker2, customerNo);
		dataResult.setDatas(list);
		return dataResult;
	}

	public List<BankVo> getBankCodeInfo(String bankCode) {
		return menu32Repository.getBankCodeInfo(bankCode);
	}

	public List<BankVo> getBankNameInfo(String bankName) {
		return menu32Repository.getBankNameInfo(bankName);
	}

	public List<AccountManagementVo> getAccountNoInfo(String accountNo) {
		return menu32Repository.getAccountNoInfo(accountNo);
	}

	public List<AccountManagementVo> getAccountNameInfo(String accountName) {
		return menu32Repository.getAccountNameInfo(accountName);
	}

}
