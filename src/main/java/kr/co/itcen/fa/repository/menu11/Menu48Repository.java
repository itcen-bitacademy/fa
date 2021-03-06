package kr.co.itcen.fa.repository.menu11;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;
import kr.co.itcen.fa.vo.menu11.TestVo;

/**
 * 
 * @author 김준호
 * 장기차입금관리
 *
 */
@Repository
public class Menu48Repository {

	@Autowired
	private SqlSession sqlSession;
	
	public void test() {
		TestVo testVo = new TestVo();
		testVo.setName("김준호");
		sqlSession.insert("menu48.save", testVo);
	}

	public Boolean insert(LTermdebtVo vo) {
		int count = sqlSession.insert("menu48.insert",vo);
		return count==1;
	}
	//상환 insert
	public Boolean insert(RepayVo vo) {
		int count = sqlSession.insert("menu48.insertrepay",vo);
		return count==1;
	}
	public int listCount(String year, String code) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("year", year);
		map.put("code",code);
		
		return sqlSession.selectOne("menu48.selectAllCount", map);
	}

	public List<LTermdebtVo> list(String year, String code, PaginationUtil pagination) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year", year);
		map.put("code",code);
		map.put("pagination", pagination);
		List<LTermdebtVo> list= sqlSession.selectList("menu48.selectAll",map);
		return list;
	}
	public Boolean update(LTermdebtVo vo) {
		int count = sqlSession.update("menu48.update",vo);
		return count==1;
	}

	public Boolean delete(Long[] no) {
		List<Long>list = new ArrayList<Long>();
		for(Long no1: no) {
			list.add(no1);
		}
		int count = sqlSession.update("menu48.delete",list);
		return count>=1;
	}

	public List<SectionVo> selectSection() {
		
		return sqlSession.selectList("menu48.selectsection");
	}

	public Long select(Long no) {
		// TODO Auto-generated method stub
		Long n=sqlSession.selectOne("menu48.selectno",no);
		System.out.println(n);
		return n;
	}
	public Boolean update(RepayVo vo) {
		int count = sqlSession.update("menu48.repayupdate",vo);
		return count==1;
	}

	public LTermdebtVo getOne(Long debtNo) {
		LTermdebtVo vo=sqlSession.selectOne("menu48.selectone",debtNo);
		return vo;
	}

	public LTermdebtVo getCode(String code) {
		LTermdebtVo vo = sqlSession.selectOne("menu48.getbycode",code);
		return vo;
	}

	public Boolean updateRepayFlag(Long no) {
		int count = sqlSession.update("menu48.updaterepayflag",no);
		return count==1;
	}

	public List<Long> selectVoucherNo(Long[] no) {
		List<Long>list = new ArrayList<Long>();
		for(Long no1: no) {
			list.add(no1);
		}
		return sqlSession.selectList("menu48.selectVoucherNo",list);
	}

	public List<RepayVo> getRepay(Long no) {
		List<RepayVo> list = sqlSession.selectList("menu48.selectrepaylist",no);
		return list;
	}
	public List<RepayVo> getRepay(Long[] no) {
		List<Long>listRepay = new ArrayList<Long>();
		for(Long no1: no) {
			listRepay.add(no1);
		}
		List<RepayVo> list = sqlSession.selectList("menu48.selectrepayAlllist",listRepay);
		return list;
	}

	public List<LTermdebtVo> selectList(Long[] no) {
		List<Long>listNo = new ArrayList<Long>();
		for(Long no1: no) {
			listNo.add(no1);
		}
		List<LTermdebtVo> list = sqlSession.selectList("menu48.selectLtermdebtlist",listNo);
		return list;
	}


	public Boolean updateBankAccount(BankAccountVo bankAccount) {
		int count = sqlSession.update("menu48.updateBankAccount",bankAccount);
		return count ==1;
	}

	public void error() {
		int count = sqlSession.update("menu48.error");
		
		
	}

	public List<LTermdebtVo> getRepayDueList(String startDate,String endDate) {
		
		Map<String,String> map =new HashMap<String, String>();
		
		map.put("startDate",startDate);
		map.put("endDate", endDate);
		
		List<LTermdebtVo> list = sqlSession.selectList("menu48.getRepayDueList",map);
		return list;
	}

	public List<Map> getYearSDebtStat(int searchYear) {
		return sqlSession.selectList("menu48.getYearSDebtStat", searchYear);
	}

	public List<Map> getYearLDebtStat(int searchYear) {
		return sqlSession.selectList("menu48.getYearLDebtStat", searchYear);
	}

	public List<Map> getYearPDebtStat(int searchYear) {
		return sqlSession.selectList("menu48.getYearPDebtStat", searchYear);
	}

	public List<Map> getMonthSDebtStat(int searchYear) {
		return sqlSession.selectList("menu48.getMonthSDebtStat", searchYear);
	}
	
	public List<Map> getMonthLDebtStat(int searchYear) {
		return sqlSession.selectList("menu48.getMonthLDebtStat", searchYear);
	}
	
	public List<Map> getMonthPDebtStat(int searchYear) {
		return sqlSession.selectList("menu48.getMonthPDebtStat", searchYear);
	}

	public List<Map> getYearIntStat(Map map) {
		return sqlSession.selectList("menu48.getYearIntStat", map);
	}

	public Map getDebtRatioStat() {
		return sqlSession.selectOne("menu48.getDebtRatioStat");
	}
	
	

	
}