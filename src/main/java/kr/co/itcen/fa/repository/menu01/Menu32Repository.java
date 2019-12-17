package kr.co.itcen.fa.repository.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.AccountCustomerLedgerVo;
import kr.co.itcen.fa.vo.menu01.CustomerVo;
import kr.co.itcen.fa.vo.menu11.BankVo;
import kr.co.itcen.fa.vo.menu11.TestVo;
import kr.co.itcen.fa.vo.menu17.AccountManagementVo;

/**
 * 
 * @author 이종윤
 * 계정거래처원장조회
 *
 */

@Repository
public class Menu32Repository {
	@Autowired
	private SqlSession sqlSession;

	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("계정거래처원장조회");
		sqlSession.insert("menu32.save", testVo);
	}

	public List<CustomerVo> getCustomerNoInfo(String customerNo) {
		return sqlSession.selectList("menu32.getCustomerNoInfo", customerNo);
	}

	public List<CustomerVo> getCustomerNameInfo(String customerName) {
		String name = "%"+ customerName +"%";
		List<CustomerVo> result = sqlSession.selectList("menu32.getCustomerNameInfo", name);
		
		return result;
	}

	/*public int listCount(AccountCustomerLedgerVo aclVo) {
		int i = sqlSession.selectOne("menu32.searchCount",aclVo);
		
		return sqlSession.selectOne("menu28.searchCount",aclVo);
	}*/

	public List<AccountCustomerLedgerVo> list(AccountCustomerLedgerVo aclVo, PaginationUtil pagination) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("vo", aclVo);
		List<AccountCustomerLedgerVo> list = sqlSession.selectList("menu32.optionSearch",map);
		return list;
	}

	public List<BankVo> getBankCodeInfo(String bankCode) {
		String code = "%" + bankCode +"%";
		List<BankVo> result = sqlSession.selectList("menu32.getBankCodeInfo", code);
		return result;
	}

	public List<BankVo> getBankNameInfo(String bankName) {
		return sqlSession.selectList("menu32.getBankNameInfo", bankName);
	}

	public List<AccountManagementVo> getAccountNoInfo(String accountNo) {
		String acno = "%" + accountNo +"%";
		List<AccountManagementVo> result = sqlSession.selectList("menu32.getAccountCodeInfo", acno);
		return result;
	}

	public List<AccountManagementVo> getAccountNameInfo(String accountName) {
		return sqlSession.selectList("menu32.getAccountNameInfo", accountName);
	}

	public int listCount(AccountCustomerLedgerVo aclVo) {
		return sqlSession.selectOne("menu32.listCount", aclVo);
	}



}
