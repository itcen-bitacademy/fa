package kr.co.itcen.fa.repository.menu01;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.TestVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;

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
			sqlSession.insert("menu03.insertItem", itemVo.get(i)); // 항목테이블 입력
		}
		
		mappingVo.setVoucherNo(voucherVo.getNo());
		sqlSession.insert("menu03.insertMapping", mappingVo); // 매핑테이블 입력
		
		return voucherVo.getNo();	// 전표번호
	}

	// 전표생성 (1팀)
	public void createVoucher(VoucherVo voucherVo) {
		sqlSession.insert("menu03.insertVoucher2", voucherVo);
		sqlSession.insert("menu03.insertItem2", voucherVo);
		sqlSession.insert("menu03.insertMapping2", voucherVo);
		
	}
	
	// 전표 전체 갯수 조회
	public int selectAllVoucherCount() {
		return sqlSession.selectOne("menu03.selectAllVoucherCount");
	}
	
	public List<VoucherVo> selectAllVoucher(PaginationUtil paginationUtil) {
		// TODO: 페이징 추가
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("paginationUtil", paginationUtil);
		List<VoucherVo> list = sqlSession.selectList("menu03.selectAllVoucher", map);
		return list;
	}
	
	// 전표 1팀 삭제
	public Boolean deleteVoucher(VoucherVo voucherVo) {
		int count = sqlSession.update("menu03.deleteVoucher2", voucherVo);
		count += sqlSession.update("menu03.deleteItem2", voucherVo);
		count += sqlSession.update("menu03.deleteMapping2", voucherVo);
		return count == 3;
	}
	
}