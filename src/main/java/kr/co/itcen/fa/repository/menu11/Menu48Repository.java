package kr.co.itcen.fa.repository.menu11;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
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

}