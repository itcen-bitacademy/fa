package kr.co.itcen.fa.service.menu11;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.menu11.Menu46Repository;
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
	
	public List<STermDebtVo> getList() {
		return menu46Repository.getList();
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
	
	public void deleteChecked(List<Long> noList) {
		menu46Repository.updateDeleteFlag(noList);
	}
	
	public List<STermDebtVo> search(Map map){
		return menu46Repository.getSearchedList(map);
	}
}
