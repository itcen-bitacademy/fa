package kr.co.itcen.fa.service.menu11;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu11.Menu46Repository;
import kr.co.itcen.fa.util.Pagination;
import kr.co.itcen.fa.vo.menu11.STermDebtVo;

/**
 * 
 * @author 반현길
 * 단기차입금관리
 *
 */
@Service
public class Menu46Service {
	
	@Autowired
	private Menu46Repository menu46Repository;
	
	//기본
	public Map getListMap() {
		return search(null, null, 5);
	}
	
	//조회
	public Map search(String code, String financialYear, int pageSize){
		return paging(code, financialYear, pageSize, 1);
	}
	
	//페이징
	public Map paging(String code, String financialYear, int pageSize, int page) {
		Map map = new HashMap<>();
		map.put("code", code);
		map.put("financialYear", financialYear);
		int totalCnt = menu46Repository.getTotalCnt(map);
		Pagination pagination = new Pagination(page, totalCnt, pageSize);
		
		map.putAll(pagination.getRowRangeMap());						//Limit 범위 데이터 set
		List<STermDebtVo> list = menu46Repository.getList(map);
		System.out.println("startRow : " + map.get("startRow"));		//startRow가 찍히는지 확인하자
		
		map.clear();
		map.put("list", list);
		map.put("pagination", pagination);
		
		return map;
	}
	
	public Map deleteChecked(List<Long> noList) {
		menu46Repository.updateDeleteFlag(noList);
		return getListMap();						//삭제 후 다시 전체 리스트를 조회한다.
	}
	
	public void insert(STermDebtVo sTermDebtVo) throws ParseException {
		DateFormat convertDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		String deptExpDate = sTermDebtVo.getDebtExpDate(); // dateRangePicker에서 받아온 차입일자와 만기일자를 나누기 위해 변수 이용
		sTermDebtVo.setDebtDate(convertDateFormat.parse(deptExpDate.substring(0, 10)).toString()); // 차입일자 date format으로 변경
		sTermDebtVo.setExpDate(convertDateFormat.parse(deptExpDate.substring(13)).toString()); // 만기일자 date format으로 변경
		menu46Repository.insert(sTermDebtVo);
	}
	
	public void update(STermDebtVo sTermDebtVo) {
		menu46Repository.update(sTermDebtVo);
	}
	
}
