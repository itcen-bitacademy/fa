package kr.co.itcen.fa.service.menu01;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu01.Menu30Repository;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
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
@Service
public class Menu30Service {
	
	@Autowired
	private Menu30Repository menu30Repository;
	

	@Autowired
	private Menu03Service menu03Service;
	
	public DataResult<ReceiptVo> search(int page, ReceiptVo revo) {
		DataResult<ReceiptVo> dataResult = new DataResult<ReceiptVo>();
	
		System.out.println(revo);
		int totalCnt = menu30Repository.listCount(revo);
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		System.out.println(totalCnt);
		dataResult.setPagination(pagination);
		List<ReceiptVo> list = menu30Repository.list(pagination,revo);
		dataResult.setDatas(list);
		
		List<StatementDataVo> statementDataList = menu30Repository.statementData();
		UserVo authUser = new UserVo();
		ClosingDateVo cVo =new ClosingDateVo();
		cVo.setClosingYearMonth("2019-11");
		
		closingEntries(statementDataList, authUser, cVo );
		
		return dataResult;
	}
	
	public void closingEntries(List<StatementDataVo> sVo, UserVo authUser, ClosingDateVo cVo) {	//월별마감일때 해당
		
		if(sVo==null) {								//전달값이 없을경우 그냥 반환
			return;
		}
		List<PreviousVo> pVo = new ArrayList<PreviousVo>();
		
		Calendar cal = Calendar.getInstance();				//전월이월
        cal.setTime(cVo.getStartDate());
        cal.add(Calendar.MONTH, 1);

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String End = transFormat.format(cVo.getEndDate());	//차월이월 date
		String Start = transFormat.format(cal.getTime());	//전월이월 date
		
		String carry1;
		String carry2;
		if(cVo.getClosingYearMonth().substring(5,7).equals("12")) {
			carry1= "차기이월";
			carry2= "전기이월";
		}else {
			carry1= "차월이월";
			carry2= "전월이월";
		}
		
		for(int i=0; i<sVo.size();i++) {				//거래처 계정별 amount 계산
			if(sVo.get(i).getAccountNo()>=4000000) {
				continue;
			}
			
			if(exist(pVo, sVo.get(i))) {
				if(get(pVo, sVo.get(i)).getAmountFlag().equals(sVo.get(i).getAmountFlag())) {
					get(pVo, sVo.get(i)).setAmount(get(pVo, sVo.get(i)).getAmount() + sVo.get(i).getAmount());
				}else {
					get(pVo, sVo.get(i)).setAmount(get(pVo, sVo.get(i)).getAmount() - sVo.get(i).getAmount());
				}
				
			}else {
				PreviousVo vo = new PreviousVo();
				vo.setAccountNo(sVo.get(i).getAccountNo());
				vo.setCustomerNo(sVo.get(i).getCustomerNo());
				if(vo.getAccountNo().toString().substring(0,1).equals("1")) {
					vo.setAmountFlag("d");
				}else {
					vo.setAmountFlag("c");
				}
				
				if(vo.getAmountFlag().equals(sVo.get(i).getAmountFlag())) {
					vo.setAmount(sVo.get(i).getAmount());
				}else {
					vo.setAmount(-sVo.get(i).getAmount());
				}
				
				
				pVo.add(vo);
			}
		}
		
		
		for(int i=0; i<pVo.size(); i++) {						// 잔액큰 기준으로 차대변 변환
			if(pVo.get(i).getAmount()<0) {
				pVo.get(i).setAmount(-pVo.get(i).getAmount());
				if(pVo.get(i).getAmountFlag().equals("c")) {
					pVo.get(i).setAmountFlag("d");
				}else {
					pVo.get(i).setAmountFlag("c");
				}
			}
		}


		for(int i=0; i<pVo.size(); i++) {						//전표 입력
			VoucherVo voucherVo = new VoucherVo();
			VoucherVo voucherVo2 = new VoucherVo();
			ItemVo itemVo = new ItemVo();
			ItemVo itemVo2 = new ItemVo();
			MappingVo mappingVo = new MappingVo();
			MappingVo mappingVo2 = new MappingVo();
			
			
			
			if(pVo.get(i).getAmountFlag().equals("c")) {
				
				voucherVo.setRegDate(End);				// 차월이월
				
				itemVo.setAmount(pVo.get(i).getAmount());
				itemVo.setAmountFlag("d");
				itemVo.setAccountNo(pVo.get(i).getAccountNo());
				
				mappingVo.setVoucherUse(carry1);						//적요		
				mappingVo.setCustomerNo(pVo.get(i).getCustomerNo());		
			
//				Long no=menu03Service.createVoucher(voucherVo, itemVo, mappingVo, authUser);
				
				voucherVo2.setRegDate(Start);
				itemVo2.setAmount(pVo.get(i).getAmount());
				itemVo2.setAmountFlag("c");
				itemVo2.setAccountNo(pVo.get(i).getAccountNo());
				
				mappingVo2.setVoucherUse(carry2);						//적요
				mappingVo2.setCustomerNo(pVo.get(i).getCustomerNo());	
				
				System.out.println( mappingVo.getCustomerNo()+":"+itemVo.getAccountNo() + ":"+itemVo.getAmount() +":"	
				+ itemVo.getAmountFlag()+":"+voucherVo.getRegDate()+ mappingVo.getVoucherUse());
				System.out.println( mappingVo2.getCustomerNo()+":"+itemVo2.getAccountNo() + ":"
				+itemVo2.getAmount() +":"	+ itemVo2.getAmountFlag()+":"+voucherVo2.getRegDate()+ mappingVo2.getVoucherUse());
//				Long no=menu03Service.createVoucher(voucherVo2, itemVo2, mappingVo2, user);
				
			}else {
				voucherVo.setRegDate(End);
				
				itemVo.setAmount(pVo.get(i).getAmount());
				itemVo.setAmountFlag("c");
				itemVo.setAccountNo(pVo.get(i).getAccountNo());
				
				mappingVo.setVoucherUse(carry1);						//적요		
				mappingVo.setCustomerNo(pVo.get(i).getCustomerNo());		
			
//				Long no=menu03Service.createVoucher(voucherVo, itemVo, mappingVo, user);
				
				voucherVo2.setRegDate(Start);
				itemVo2.setAmount(pVo.get(i).getAmount());
				itemVo2.setAmountFlag("d");
				itemVo2.setAccountNo(pVo.get(i).getAccountNo());
				
				mappingVo2.setVoucherUse(carry2);						//적요
				mappingVo2.setCustomerNo(pVo.get(i).getCustomerNo());	
				
//				Long no=menu03Service.createVoucher(voucherVo2, itemVo2, mappingVo2, user);
			
				System.out.println( mappingVo.getCustomerNo()+":"+itemVo.getAccountNo() + ":"+itemVo.getAmount() +":"	
						+ itemVo.getAmountFlag()+":"+voucherVo.getRegDate()+ mappingVo.getVoucherUse());
						System.out.println( mappingVo2.getCustomerNo()+":"+itemVo2.getAccountNo() + ":"
						+itemVo2.getAmount() +":"	+ itemVo2.getAmountFlag()+":"+voucherVo2.getRegDate()+ mappingVo2.getVoucherUse());
			}
			
			
		}
		
		
	}	
	
	public void closingEntriesDelete(ClosingDateVo cVo, UserVo authUser ) {
		previousDelete(cVo, authUser);
		
	}
	
	public void previousDelete(ClosingDateVo cVo, UserVo authUser){
		Calendar cal = Calendar.getInstance();				//전월이월
        cal.setTime(cVo.getStartDate());
        cal.add(Calendar.MONTH, 1);

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String End = transFormat.format(cVo.getEndDate());								//차월이월 date
		String Start = transFormat.format(cal.getTime());								//전월이월 date
		
		
	}
	
	public void Repository() {
		
	}
	
	
	
	public boolean exist(List<PreviousVo> pVo, StatementDataVo sVo) {			//존재하는지 여부
		if(pVo==null) {
			return false;
		}
		for(int i=0; i<pVo.size(); i++) {
			if(pVo.get(i).exist(sVo.getAccountNo(),sVo.getCustomerNo())) {
				
				return true;
			}
		}
		return false;
	}
	
	public PreviousVo get(List<PreviousVo> pVo, StatementDataVo sVo) {			//값얻기
		for(int i=0; i<pVo.size(); i++) {
			if(pVo.get(i).exist(sVo.getAccountNo(),sVo.getCustomerNo())) {
				return pVo.get(i);
			}
		}
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
