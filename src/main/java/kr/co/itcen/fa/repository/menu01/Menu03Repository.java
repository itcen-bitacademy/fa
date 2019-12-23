package kr.co.itcen.fa.repository.menu01;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.service.menu17.Menu19Service;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.TestVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
import kr.co.itcen.fa.vo.menu17.StatementDataVo;

/**
 * 
 * @author 임성주 
 * 전표관리
 *
 */

@Repository
public class Menu03Repository {
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private Menu19Service menu19Service;
	
	
	public void test (){
		TestVo testVo = new TestVo();
		testVo.setName("김길동");
		sqlSession.insert("menu03.save", testVo);
	}
	
	// 전표생성 (다른팀)
	public Long createVoucher(VoucherVo voucherVo, List<ItemVo> itemVo, MappingVo mappingVo) {
		System.out.println("#################" + voucherVo.getRegDate());
		sqlSession.insert("menu03.insertVoucher", voucherVo); // 전표테이블 입력
		
		System.out.println("222233333333" + voucherVo.getNo());
		for(int i = 0; i < itemVo.size(); i++) {
			itemVo.get(i).setVoucherNo(voucherVo.getNo());
			System.out.println("33333333" + voucherVo.getNo());
			itemVo.get(i).setGroupNo(voucherVo.getNo());
			sqlSession.insert("menu03.insertItem", itemVo.get(i)); // 항목테이블 입력
			int order = sqlSession.selectOne("menu03.selectOrder", voucherVo.getNo());
			itemVo.get(i).setOrderNo(order);
			sqlSession.update("menu03.updateOrder", itemVo.get(i));
		}
		
		mappingVo.setVoucherNo(voucherVo.getNo());
		sqlSession.insert("menu03.insertMapping", mappingVo); // 매핑테이블 입력
		
		return voucherVo.getNo();	// 전표번호
	}
	
	// 전표생성 (1팀)
	public Long createVoucher(VoucherVo voucherVo, List<ItemVo> itemVo, List<MappingVo> mappingVo, UserVo userVo) throws ParseException {
		
		if(menu19Service.checkClosingDate(userVo, voucherVo.getRegDate())) {
			System.out.println("repo1");
			sqlSession.insert("menu03.insertVoucher", voucherVo); // 전표테이블 입력
			for(int i = 0; i < itemVo.size(); i++) {
				System.out.println("itemVo.size : " + itemVo.size());
				itemVo.get(i).setVoucherNo(voucherVo.getNo());
				System.out.println("itemVo.get(i) : " + itemVo.get(i).getVoucherNo());
				System.out.println("itemVo.get(i)amount : " + itemVo.get(i).getAmount());
				System.out.println("itemVo.get(i)amountflag : " + itemVo.get(i).getAmountFlag());
				System.out.println("itemVo.get groupNo : " + itemVo.get(i).getGroupNo());
				itemVo.get(i).setGroupNo(voucherVo.getNo());
				System.out.println("repo2");
				sqlSession.insert("menu03.insertItem3", itemVo.get(i)); // 항목테이블 입력
				
				//int order = sqlSession.selectOne("menu03.selectOrder", voucherVo.getNo());
				//System.out.println("order : " + order);
				
				System.out.println("repo3");
				
				
				mappingVo.get(i).setVoucherNo(voucherVo.getNo());
				System.out.println("repo4");
				sqlSession.insert("menu03.insertMapping", mappingVo.get(i)); // 매핑테이블 입력
			}
			
			return voucherVo.getNo();	// 전표번호
		}
		
		return null;
		
	}

	// 전표생성 (1팀)
	public void createVoucher(VoucherVo voucherVo) {
		System.out.println("111a : " + voucherVo.getOrderNo());
		sqlSession.insert("menu03.insertVoucher2", voucherVo);
		sqlSession.insert("menu03.insertItem2", voucherVo);
		sqlSession.insert("menu03.insertMapping2", voucherVo);
		
	}
	
	// 전표 전체 갯수 조회
	public int selectAllVoucherCount() {
		return sqlSession.selectOne("menu03.selectAllVoucherCount");
	}
	
	// 전표 전체 조회
	public List<VoucherVo> selectAllVoucher(PaginationUtil paginationUtil) {
		// TODO: 페이징 추가
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("paginationUtil", paginationUtil);
		List<VoucherVo> list = sqlSession.selectList("menu03.selectAllVoucher", map);
		return list;
	}
	
	// 전표 관리페이지 조건 개수
	public int selectVoucherCount(VoucherVo voucherVo) {
		return sqlSession.selectOne("menu03.selectVoucherCount", voucherVo);
	}
	
	// 전표 관리페이지 조건 조회
	public List<VoucherVo> selectVoucher(VoucherVo voucherVo, PaginationUtil paginationUtil) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("paginationUtil", paginationUtil);
		map.put("vo", voucherVo);
		List<VoucherVo> list = sqlSession.selectList("menu03.selectVoucher", map);
		return list;
	}
	
	// 전표 1팀 삭제
	public Boolean deleteVoucher(VoucherVo voucherVo) {
		int count = sqlSession.update("menu03.deleteVoucher2", voucherVo);
		count += sqlSession.update("menu03.deleteItem2", voucherVo);
		count += sqlSession.update("menu03.deleteMapping2", voucherVo);
		return count == 3;
	}
	
	// 전표 1팀 수정
	public Boolean updateVoucher(VoucherVo voucherVo) {
		
		
		int count = sqlSession.update("menu03.updateVoucher2", voucherVo);
		count += sqlSession.update("menu03.updateItem2", voucherVo);
		count += sqlSession.update("menu03.updateMapping2", voucherVo);
		return count == 3;
	}
	
	// 전표 다른 팀 수정
	public Long updateVoucher(VoucherVo voucherVo, List<ItemVo> itemVo, List<MappingVo> mappingVo, @AuthUser UserVo userVo) {
		VoucherVo voucherVoTemp = new VoucherVo();
		VoucherVo insertTeam = new VoucherVo();
		insertTeam = sqlSession.selectOne("menu03.selectTeam", voucherVo);
		if(!insertTeam.getInsertTeam().equals(userVo.getTeamName())) {
			System.out.println("너냐 범인이");
			return null;
		}
		voucherVoTemp = sqlSession.selectOne("menu03.selectTemp", voucherVo);
		System.out.println("! :" + voucherVo.getNo());
		sqlSession.delete("menu03.deleteVoucher", voucherVo);
		
		for(int i = 0; i < itemVo.size(); i++) {
			itemVo.get(i).setVoucherNo(voucherVo.getNo());
			System.out.println("@ : " + itemVo.get(i).getVoucherNo());
			sqlSession.delete("menu03.deleteItem", itemVo.get(i));
		
			mappingVo.get(i).setVoucherNo(voucherVo.getNo());
			System.out.println("# :" + mappingVo.get(i).getVoucherNo());
			sqlSession.delete("menu03.deleteMapping", mappingVo);
		}
		voucherVo.setInsertUserid(voucherVoTemp.getInsertUserid());
		voucherVo.setInsertDay(voucherVoTemp.getInsertDay());
		sqlSession.insert("menu03.newVoucher", voucherVo); // 전표테이블 입력
		
		for(int i = 0; i < itemVo.size(); i++) {
			itemVo.get(i).setInsertUserid(voucherVoTemp.getInsertUserid());
			itemVo.get(i).setInsertDay(voucherVoTemp.getInsertDay());
			itemVo.get(i).setVoucherNo(voucherVo.getNo());
			itemVo.get(i).setGroupNo(voucherVo.getNo());
			
			
			
			sqlSession.insert("menu03.newItem", itemVo.get(i)); // 항목테이블 입력
			
			int order = sqlSession.selectOne("menu03.selectOrder", voucherVo.getNo());
			itemVo.get(i).setOrderNo(order);
			sqlSession.update("menu03.updateOrder", itemVo.get(i));
		
		
			mappingVo.get(i).setInsertUserid(voucherVoTemp.getInsertUserid());
			mappingVo.get(i).setInsertDay(voucherVoTemp.getInsertDay());
			mappingVo.get(i).setVoucherNo(voucherVo.getNo());
			mappingVo.get(i).setOrderNo(order);
			sqlSession.insert("menu03.newMapping", mappingVo.get(i)); // 매핑테이블 입력
		}
		
		
		System.out.println("repository2 : " + voucherVo.getNo());
		return voucherVo.getNo();
		
	}
	
	// 전표 다른 팀 삭제
	public Long deleteVoucher(List<VoucherVo> voucherVo, UserVo userVo) {
		for(VoucherVo v1:voucherVo) {
			VoucherVo voucherVoTeam = sqlSession.selectOne("menu03.selectTeam", v1.getNo());
			if (!userVo.getTeamName().equals(voucherVoTeam.getInsertTeam())) {
				return null;
			}
			sqlSession.delete("menu03.updateVoucher3", v1);
			sqlSession.delete("menu03.updateItem3", v1);
			sqlSession.delete("menu03.updateMapping3", v1);
		};
		return 0L;
	}
	
	public Long deleteVoucher(Long no, UserVo userVo) {
		VoucherVo voucherVoTeam = sqlSession.selectOne("menu03.selectTeam2", no);
		if (!userVo.getTeamName().equals(voucherVoTeam.getInsertTeam())) {
			return null;
		}
		
		sqlSession.delete("menu03.updateVoucher3", no);
		sqlSession.delete("menu03.updateItem3", no);
		sqlSession.delete("menu03.updateMapping3", no);
		return 0L;
	}
	
	// 결산
	public List<StatementDataVo> statementData(ClosingDateVo closingDataVo) {
		return sqlSession.selectList("menu03.statementData", closingDataVo);
	}
	
	// 거래처, 은행, 계좌, 카드 조회
	public Map<String, Object> getCustomer(String customerNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<VoucherVo> voucherList = sqlSession.selectList("menu03.getCustomer", customerNo);
		map.put("customerList",voucherList);
		return map;
	}
	
	// 현재시간 구하기
	public String businessDateStr() {
		return sqlSession.selectOne("menu03.businessDateStr");
	}
	
	// 전표 등록 날짜 구하기
	public String getRegDate(Long no) {
		return sqlSession.selectOne("menu03.getRegDate", no);
		
	}

	
	

}