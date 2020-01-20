package kr.co.itcen.fa.service.menu11;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu11.Menu48Repository;
import kr.co.itcen.fa.service.menu01.Menu03Service;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.SectionVo;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.BankAccountVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.VoucherVo;
import kr.co.itcen.fa.vo.menu11.LTermdebtVo;
import kr.co.itcen.fa.vo.menu11.RepayVo;

/**
 * 
 * @author 김준호
 * 장기차입금관리
 *
 */
@Service
public class Menu48Service {
	
	@Autowired
	private Menu48Repository menu48Repository;
	
	@Autowired
	private Menu03Service menu03Service;
	
	
	public void test() {
		menu48Repository.test();
	}
	
	//insert 장기차입금
	@Transactional
	public Boolean insert(LTermdebtVo vo,UserVo user) {
	
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		
		MappingVo mappingVo = new MappingVo();
		voucherVo.setRegDate(vo.getDebtDate());
		
		
		
		itemVo.setAmount(vo.getDebtAmount());//예금
		itemVo.setAmountFlag("d");//차변
		itemVo.setAccountNo(1110103L);//계정과목코드
		itemVoList.add(itemVo);
		
		itemVo2.setAmount(vo.getDebtAmount());//장기차입금
		itemVo2.setAmountFlag("c");
		itemVo2.setAccountNo(2401101L);
		itemVoList.add(itemVo2);
		
		
		mappingVo.setVoucherUse(vo.getName());//사용목적
		mappingVo.setSystemCode(vo.getCode());//제코드l190
		mappingVo.setCustomerNo(vo.getBankCode());
		mappingVo.setDepositNo(vo.getDepositNo());//계좌번호
		
		
		
		Long no=menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, user);
		
		vo.setVoucherNo(no);
	
		
		return menu48Repository.insert(vo);
		
	}
	//상환 insert
	
	@Transactional
	public LTermdebtVo insert(RepayVo vo,UserVo uservo) {
		
		vo.setInsertId(uservo.getId());//유저 아이디 셋팅
		LTermdebtVo lvo = menu48Repository.getOne(vo.getDebtNo());//기존 장기차입금 컬럼 값 읽기
		
		
		
		
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		ItemVo itemVo3 = new ItemVo();
		
		MappingVo mappingVo = new MappingVo();
		voucherVo.setRegDate(vo.getPayDate());
		if(!lvo.getIntPayWay().equals("E")) {
			itemVo.setAmount(vo.getIntAmount());//이자납입금
			itemVo.setAmountFlag("d");//차변
			itemVo.setAccountNo(9201101L);//계정과목코드
			itemVoList.add(itemVo);
		}
		if(!(vo.getPayPrinc() == 0)) {
			itemVo2.setAmount(vo.getPayPrinc());//장기차입금에서 빠진 금액
			itemVo2.setAmountFlag("d");//차변
			itemVo2.setAccountNo(2401101L);
			itemVoList.add(itemVo2);
		}
		itemVo3.setAmount(vo.getPayPrinc()+vo.getIntAmount());//예금액= 상환액으로 입력한 값
		itemVo3.setAmountFlag("c");//대변
		itemVo3.setAccountNo(1110103L);//dPrma
		itemVoList.add(itemVo3);
		
		mappingVo.setVoucherUse(lvo.getName());//사용목적
		mappingVo.setSystemCode(lvo.getCode());//제코드l190
		
		mappingVo.setCustomerNo(lvo.getBankCode());
		mappingVo.setDepositNo(lvo.getDepositNo());//계좌번호
		
		
		Long no=menu03Service.createVoucher(voucherVo, itemVoList, mappingVo, uservo);
		
		vo.setVoucherNo(no);
		
		
		menu48Repository.update(vo);//기존 장기 차입금 수정
		lvo = menu48Repository.getOne(vo.getDebtNo());//기존 장기차입금 컬럼 값 읽기
		menu48Repository.insert(vo);
		if(lvo.getRepayBal() == 0)
			menu48Repository.updateRepayFlag(lvo.getNo());
		
		return lvo;
	}
	public DataResult<LTermdebtVo> list(int page, String year, String code) {
		
		DataResult<LTermdebtVo> dataResult = new DataResult<LTermdebtVo>();
		
		int totalCnt = menu48Repository.listCount(year, code);
		
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		dataResult.setPagination(pagination);
		List<LTermdebtVo> list = menu48Repository.list(year,code, pagination);
		dataResult.setDatas(list);
		
		return dataResult;
	}
	@Transactional
	public Boolean update(LTermdebtVo vo,UserVo user) {
		vo.setVoucherNo(menu48Repository.select(vo.getNo()));
		VoucherVo voucherVo = new VoucherVo();
		List<ItemVo> itemVoList = new ArrayList<ItemVo>();
		ItemVo itemVo = new ItemVo();
		ItemVo itemVo2 = new ItemVo();
		
		
		MappingVo mappingVo = new MappingVo();
		voucherVo.setNo(vo.getVoucherNo());
		
		
		voucherVo.setRegDate(vo.getDebtDate());
		itemVo.setAmount(vo.getDebtAmount());//장기차입금 금액
		itemVo.setAmountFlag("c");//차변
		itemVo.setAccountNo(2401101L);
		itemVo.setVoucherNo(vo.getVoucherNo());
		itemVoList.add(itemVo);
		
			
		itemVo2.setAmount(vo.getDebtAmount());//예금
		itemVo2.setAmountFlag("d");
		itemVo2.setAccountNo(1110103L);
		itemVo2.setVoucherNo(vo.getVoucherNo());
		itemVoList.add(itemVo2);
		
		mappingVo.setVoucherUse(vo.getName());//사용목적
		mappingVo.setSystemCode(vo.getCode());//제코드l190
		mappingVo.setCustomerNo(vo.getBankCode());
		mappingVo.setDepositNo(vo.getDepositNo());//계좌번호
		mappingVo.setVoucherNo(vo.getVoucherNo());
		
		
		Long n=menu03Service.updateVoucher(voucherVo, itemVoList, mappingVo, user);
		vo.setVoucherNo(n);
		return menu48Repository.update(vo);
	}
	@Transactional
	public Boolean delete(Long[] no,UserVo uservo) {
		
		List<Long> list = menu48Repository.selectVoucherNo(no);
		
		List<VoucherVo> voucherVolist = new ArrayList<VoucherVo>();
		for(Long no1: list) {
			VoucherVo v = new VoucherVo();
			v.setNo(no1);
			
			voucherVolist.add(v);
		}
		for(VoucherVo v : voucherVolist) {
			System.out.println(v);
		}
		
		menu03Service.deleteVoucher(voucherVolist, uservo);
		
		
		return  menu48Repository.delete(no);
	}

	public List<SectionVo> selectSection() {
		// TODO Auto-generated method stub
		return menu48Repository.selectSection();
	}

	
	

	public LTermdebtVo existCode(String code) {
		return menu48Repository.getCode(code);
	}


	public List<RepayVo> getRepay(Long no) {
		
		return menu48Repository.getRepay(no);
	}
	public List<RepayVo> getRepay(Long[] no) {
		
		return menu48Repository.getRepay(no);
	}

	public List<LTermdebtVo> selectList(Long[] no) {
		
		return menu48Repository.selectList(no);
	}

	public Boolean updateBankAccount(BankAccountVo bankAccount) {
		return menu48Repository.updateBankAccount(bankAccount);
	}

	public List<LTermdebtVo> getRepayDueList() {
		String startDate = getCurMonday();
		String endDate = getCurSunday();
		
		//return  menu48Repository.getRepayDueList(startDate,endDate);
		return  menu48Repository.getRepayDueList(startDate,endDate);
	}
	//현재 날짜 월요일
 	public static String getCurMonday(){

 		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");

 		Calendar c = Calendar.getInstance();

 		c.set(Calendar.DAY_OF_WEEK,Calendar.MONDAY);

 		return formatter.format(c.getTime());

 	}
 	//현재 날짜 일요일
 	public static String getCurSunday(){

 		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");

 		Calendar c = Calendar.getInstance();

 		

 		c.set(Calendar.DAY_OF_WEEK,Calendar.SUNDAY);

 		c.add(c.DATE,7);

 		return formatter.format(c.getTime());

 	}

	public Map getYearDebtStat() {
		int curYear = Calendar.getInstance().get(Calendar.YEAR);
		List<Map> sList = menu48Repository.getYearSDebtStat(curYear);
		List<Map> lList = menu48Repository.getYearLDebtStat(curYear);
		List<Map> pList = menu48Repository.getYearPDebtStat(curYear);
		
		System.out.println("sList : " + sList);
		System.out.println("lList : " + lList);
		System.out.println("pList : " + pList);
		
		List<Long> sYearSumList = getYearSumList(sList, curYear);
		List<Long> lYearSumList = getYearSumList(lList, curYear);
		List<Long> pYearSumList = getYearSumList(pList, curYear);
		
		List<Integer> yearRangeList = getYearRangeList(curYear);
		
		Map map = new HashMap();
		map.put("sList", sYearSumList);
		map.put("lList", lYearSumList);
		map.put("pList", pYearSumList);
		map.put("xAxis", yearRangeList);
		return map;
	}
	
	public Map getMonthDebtStat(int searchYear) {
		List<Map> sList = menu48Repository.getMonthSDebtStat(searchYear);
		List<Map> lList = menu48Repository.getMonthLDebtStat(searchYear);
		List<Map> pList = menu48Repository.getMonthPDebtStat(searchYear);
		
		System.out.println("sList : " + sList);
		System.out.println("lList : " + lList);
		System.out.println("pList : " + pList);
		
		List<Long> sMonthSumList = getMonthSumList(sList);
		List<Long> lMonthSumList = getMonthSumList(lList);
		List<Long> pMonthSumList = getMonthSumList(pList);
		
		List<Integer> monthRangeList = getMonthRangeList();
		
		Map map = new HashMap();
		map.put("sList", sMonthSumList);
		map.put("lList", lMonthSumList);
		map.put("pList", pMonthSumList);
		map.put("xAxis", monthRangeList);
		return map;
	}
	
	public Map getYearIntStat() {
		int curYear = Calendar.getInstance().get(Calendar.YEAR);
		Map map = new HashMap();
		
		map.put("searchYear", curYear);
		map.put("debtType", "S");
		List<Map> sList = menu48Repository.getYearIntStat(map);
		map.replace("debtType", "L");
		List<Map> lList = menu48Repository.getYearIntStat(map);
		map.replace("debtType", "P");
		List<Map> pList = menu48Repository.getYearIntStat(map);
		
		System.out.println("sList : " + sList);
		System.out.println("lList : " + lList);
		System.out.println("pList : " + pList);
		
		List<Long> sYearSumList = getYearSumList(sList, curYear);
		List<Long> lYearSumList = getYearSumList(lList, curYear);
		List<Long> pYearSumList = getYearSumList(pList, curYear);
		
		map.put("sList", sYearSumList);
		map.put("lList", lYearSumList);
		map.put("pList", pYearSumList);
		map.put("xAxis", getYearRangeList(curYear));
		
		return map;
	}

	public List<Map> getDebtRatioStat() {
		Map map = menu48Repository.getDebtRatioStat();
		
		List<Map> list = getDebtRatioList(map);
		
		return list;
	}
	public List<Map> getDebtRatioList(Map ratioMap) {
		float sDebtRatio = getFloatFromMap(ratioMap.get("sDebtRatio"));
		float lDebtRatio = getFloatFromMap(ratioMap.get("lDebtRatio"));
		float pDebtRatio = getFloatFromMap(ratioMap.get("pDebtRatio"));
		
		List<Map> list = new ArrayList<Map>();
		Map map = new HashMap();
		map.put("name", "단기차입금");
		map.put("y", sDebtRatio);
		list.add(map);
		
		map = new HashMap();
		map.put("name", "장기차입금");
		map.put("y", lDebtRatio);
		list.add(map);
		
		map = new HashMap();
		map.put("name", "사채");
		map.put("y", pDebtRatio);
		list.add(map);
		
		return list;
	}
	public List<Long> getYearSumList(List<Map> list, int searchYear){
		
		List<Long> yearSumList = new ArrayList<Long>();
		for(int i = searchYear; i >= searchYear-10; --i) {					//조회년도 ~ (조회년도 -10) : 10년간의 범위
			Long sum = 0L;
			
			for(Map map : list) {								//리스트를 순회하면서 해당년도가 있는지 확인
				Integer year = (Integer)map.get("year");
				if(year == i) {									//해당년도가 있으면 sum값으로 입력
					sum =getLongFromMap(map.get("sum"));
					break;
				}
			}
			yearSumList.add(sum);
		}
		
		return yearSumList;
	}
	
	public List<Integer> getYearRangeList(int searchYear){
		List<Integer> list = new ArrayList();
		
		for(int i=searchYear; i>= searchYear-10; --i) {					//(조회년도 -10) ~ 조회년도 : 10년간의 범위
			list.add(i);
		}
		
		return list;
	}
	
	public List<Long> getMonthSumList(List<Map> list){
		List<Long> monthSumList = new ArrayList<Long>();
		for(int i=1; i<= 12; ++i) {							//(조회년도 -10) ~ 조회년도 : 10년간의 범위
			Long sum = 0L;
			
			for(Map map : list) {							//리스트를 순회하면서 해당월이 있는지 확인
				Integer month = (Integer)map.get("month");
				if(month == i) {							//해당월이 있으면 sum값으로 입력
					sum =getLongFromMap(map.get("sum"));
					break;
				}
			}
			monthSumList.add(sum);
		}
		
		return monthSumList;
	}

	public List<Integer> getMonthRangeList(){
		List<Integer> list = new ArrayList();

		for(int i=1; i<= 12; ++i) {					//1 ~ 12 
			list.add(i);
		}
		return list;
	}
	
	public Long getLongFromMap(Object value) {
		Long resultVal=0L;
		if(value instanceof BigDecimal) {
			BigDecimal v = (BigDecimal)value;
			resultVal= Long.valueOf(v.toString());
		}else {
			resultVal = (Long)value;
		}
			
		return resultVal;
	}
	
	public Float getFloatFromMap(Object value) {
		Float resultVal=0f;
		if(value instanceof BigDecimal) {
			BigDecimal v = (BigDecimal)value;
			resultVal= Float.valueOf(v.toString());
		}else {
			resultVal = (Float)value;
		}
			
		return resultVal;
	}

	


	
}