package kr.co.itcen.fa.repository.menu01;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.PreviousVo;
import kr.co.itcen.fa.vo.menu01.ReceiptVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu17.ClosingDateVo;
import kr.co.itcen.fa.vo.menu17.StatementDataVo;

/**
 * 
 * @author 김승곤 황슬기
 * 계정거래처명세서조회
 *
 */

@Repository
public class Menu30Repository {
	@Autowired
	private SqlSession sqlSession;
	
	public int listCount(ReceiptVo revo) {
		
		return sqlSession.selectOne("menu30.listCount",revo);
	}
	
	public List<ReceiptVo> list(PaginationUtil pagination, ReceiptVo revo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("vo", revo);
		List<ReceiptVo> list= sqlSession.selectList("menu30.list",map);
		return list;
	}

	public List<Long> selectVoucherNo(ClosingDateVo cVo) {
		Calendar cal = Calendar.getInstance();				//전월이월
        cal.setTime(cVo.getStartDate());
        cal.add(Calendar.MONTH, 1);

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		String End= transFormat.format(cVo.getEndDate());;
		String Start = transFormat.format(cal.getTime());	//전월이월 date
		if(Start.equals("2019-12-01")) {
			End = "2019-11-30";
		}
		if(Start.equals("2020-03-01")) {
			End = "2020-02-29";
		}
		if(Start.equals("2020-05-01")) {
			End = "2020-04-30";
		}
		if(Start.equals("2020-07-01")) {
			End = "2020-06-30";
		}
		if(Start.equals("2020-10-01")) {
			End = "2020-09-30";
		}
		if(Start.equals("2020-12-01")) {
			End = "2020-11-30";
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("End",End);
		map.put("Start", Start);
		return sqlSession.selectList("menu30.select",map);
	}

	public List<PreviousVo> previous(ReceiptVo revo) {
		return sqlSession.selectList("menu30.previous", revo);
	}

	public boolean previousexist(ReceiptVo revo) {
		int a=sqlSession.selectOne("menu30.previousexist", revo);
		return a==0;
	}

	public List<StatementDataVo> addprevious(ClosingDateVo cVo) {
		return sqlSession.selectList("menu30.addprevious", cVo);
	}

	public ReceiptVo dsum(ReceiptVo revo) {
		return sqlSession.selectOne("menu30.dsum", revo);
	}
	
	public ReceiptVo csum(ReceiptVo revo) {
		return sqlSession.selectOne("menu30.csum", revo);
	}

	public void deleteVoucher(List<Long> list) {
			sqlSession.delete("menu30.deleteVoucher", list);
			sqlSession.delete("menu30.deleteItem", list);
			sqlSession.delete("menu30.deleteMapping", list);
		
	}

	public void createVoucher(List<VoucherVo> voucherVolist, UserVo authUser) {
		Long no = sqlSession.selectOne("menu30.voucherVolist");
		for(int i=0 ; i<voucherVolist.size();i++) {
			voucherVolist.get(i).setNo(no);
			voucherVolist.get(i).setInsertTeam(authUser.getTeamName());
			voucherVolist.get(i).setInsertUserid(authUser.getId());
			voucherVolist.get(i).setOrderNo(1);
			no=no+1;
		}
		if(voucherVolist.size()!=0) {
			sqlSession.insert("menu30.insertVoucher", voucherVolist);
			sqlSession.insert("menu30.insertItem", voucherVolist);
			sqlSession.insert("menu30.insertMapping", voucherVolist);
		}
		
	}
}
