package kr.co.itcen.fa.repository.menu12;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu02.PurchaseitemVo;
import kr.co.itcen.fa.vo.menu12.CustomerVo;
import kr.co.itcen.fa.vo.menu12.SalesVo;

@Repository
public class Menu14Repository {
	@Autowired
	private SqlSession sqlSession;

	public List<SalesVo> getList() {
		return sqlSession.selectList("menu14.defaultlist");
	}

	public List<SalesVo> getSerchList(SalesVo vo) {
		return sqlSession.selectList("menu14.searchlist", vo);
	}
	
	public List<CustomerVo> getCustomerList() {
		return sqlSession.selectList("menu13.customerlist");
	}

	public List<PurchaseitemVo> getItemList() {
		return sqlSession.selectList("menu13.itemlist");
	}
}
