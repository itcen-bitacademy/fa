package kr.co.itcen.fa.repository.menu12;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.vo.menu12.CustomerVo;
import kr.co.itcen.fa.vo.menu12.SalesVo;
import kr.co.itcen.fa.vo.menu12.SellTaxbillVo;

/**
 * 
 * @author 김현곤
 * 매출관리
 *
 */

@Repository
public class Menu13Repository {
	@Autowired
	private SqlSession sqlSession;

	public void insert(List<SalesVo> list) {
		sqlSession.insert("menu13.insert", list);	
	}
	public List<CustomerVo> getCustomerList() {
		return sqlSession.selectList("menu13.customerlist");
	}
	public List<SalesVo> getItemList() {
		return sqlSession.selectList("menu13.itemlist");
	}
	public List<SalesVo> getSalesNo(String salesNo) {		
		return sqlSession.selectList("menu13.getsalesno", salesNo);
	}
	public void deleteData(String salesNo) {
		sqlSession.update("menu13.delete", salesNo);
	}
	public void updateDelete(String pathSalesNo) {
		sqlSession.delete("menu13.updatedelete", pathSalesNo);		
	}
	public void updateInsert(ArrayList<SalesVo> list) {
		sqlSession.insert("menu13.updateinsert", list);
	}
	public SellTaxbillVo controlTaxbill(String pathSalesNo) { // 매출 수정 시
		SellTaxbillVo vo = sqlSession.selectOne("menu13.getTaxbill", pathSalesNo); // 기존 세금계산서 내역 get
		sqlSession.delete("menu13.deleteTaxbill", pathSalesNo); // 기존 세금계산서 삭제
		return vo;
	}
	public void insertTaxbill(SellTaxbillVo selltaxbillvo) { // 매출 수정 시
		sqlSession.insert("menu13.insertTax", selltaxbillvo); // 기존 세금계산서 내역과 새로운 매출 내역으로 세금계산서 발행
	}
	public String getVoucherNo(String salesNo) {
		sqlSession.update("menu13.taxbillremove", salesNo); // 세금계산서 삭제 처리
		return sqlSession.selectOne("menu13.getVoucherNo", salesNo); // 전표번호 get
	}
	
}
