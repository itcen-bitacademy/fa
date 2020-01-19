package kr.co.itcen.fa.service.menu01;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu01.Menu30Repository;
import kr.co.itcen.fa.security.AuthUser;
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
@Service
public class Menu30Service {
	
	@Autowired
	private Menu30Repository menu30Repository;
	
	public DataResult<ReceiptVo> search(int page, ReceiptVo revo, @AuthUser UserVo authUser) {
		DataResult<ReceiptVo> dataResult = new DataResult<ReceiptVo>();
	
		int totalCnt = menu30Repository.listCount(revo);
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		dataResult.setPagination(pagination);
		List<ReceiptVo> list = menu30Repository.list(pagination,revo);
	    dataResult.setDatas(list);
	    
		return dataResult;
	}
	
	public PreviousVo previous(ReceiptVo revo) {
		if(menu30Repository.previousexist(revo)) {
			return null;
		}
		List<PreviousVo> previous = menu30Repository.previous(revo);
		Long total=0L;
		PreviousVo pVo = new PreviousVo(); 
		pVo.setVoucherUse(previous.get(0).getVoucherUse());
		for(int i=0; i<previous.size();i++) {
			if(previous.get(i).getAmountFlag().equals("d")) {
				total+=previous.get(i).getAmount();
			}else {
				total-=previous.get(i).getAmount();
			}
		}
		
		if(total<0) {
			total= -total;
			pVo.setAmountFlag("c");
		}else {
			pVo.setAmountFlag("d");
		}
		pVo.setAmount(total);
		
		return pVo;
	}
	
	//전월이월 입력
	public void closingEntries(List<StatementDataVo> sVo, ClosingDateVo cVo, UserVo authUser) {	//월별마감일때 해당
		
		if(sVo==null) {								//전달값이 없을경우 그냥 반환
			return;
		}
		List<PreviousVo> pVo = new ArrayList<PreviousVo>();
		// 전기이월 데이터 가지고 와서 연산
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
			
		List<StatementDataVo> addsVo = menu30Repository.addprevious(cVo);
		
		for(int i=0; i<addsVo.size(); i++) {
			sVo.add(addsVo.get(i));
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
				vo.setAmountFlag(sVo.get(i).getAmountFlag());
				vo.setAmount(sVo.get(i).getAmount());
				
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

		List<VoucherVo> voucherVolist = new ArrayList<VoucherVo>();
		for(int i=0; i<pVo.size(); i++) {						//전표 입력
			VoucherVo voucherVo = new VoucherVo();
			VoucherVo voucherVo2 = new VoucherVo();
			
			
			if(pVo.get(i).getAmountFlag().equals("c")) {
				
				voucherVo.setRegDate(End);				// 차월이월
				
				voucherVo.setAmount(pVo.get(i).getAmount());
				voucherVo.setAmountFlag("d");
				voucherVo.setAccountNo(pVo.get(i).getAccountNo());
				
				voucherVo.setVoucherUse(carry1);						//적요		
				voucherVo.setCustomerNo(pVo.get(i).getCustomerNo());		
			
				voucherVolist.add(voucherVo);
				
				voucherVo2.setRegDate(Start);
				voucherVo2.setAmount(pVo.get(i).getAmount());
				voucherVo2.setAmountFlag("c");
				voucherVo2.setAccountNo(pVo.get(i).getAccountNo());
				
				voucherVo2.setVoucherUse(carry2);						//적요
				voucherVo2.setCustomerNo(pVo.get(i).getCustomerNo());	
				
				
				voucherVolist.add(voucherVo2);
				
			}else {
				voucherVo.setRegDate(End);
				
				voucherVo.setAmount(pVo.get(i).getAmount());
				voucherVo.setAmountFlag("c");
				voucherVo.setAccountNo(pVo.get(i).getAccountNo());
				
				voucherVo.setVoucherUse(carry1);						//적요		
				voucherVo.setCustomerNo(pVo.get(i).getCustomerNo());		
			
				voucherVolist.add(voucherVo);
				
				voucherVo2.setRegDate(Start);
				voucherVo2.setAmount(pVo.get(i).getAmount());
				voucherVo2.setAmountFlag("d");
				voucherVo2.setAccountNo(pVo.get(i).getAccountNo());
				
				voucherVo2.setVoucherUse(carry2);						//적요
				voucherVo2.setCustomerNo(pVo.get(i).getCustomerNo());	
				
				voucherVolist.add(voucherVo2);
			
			}
			
		}
		menu30Repository.createVoucher(voucherVolist, authUser);
	}	
	
	//전월이월 삭제
	public void closingEntriesDelete(ClosingDateVo cVo, UserVo authUser ) {
		List<Long> list = menu30Repository.selectVoucherNo(cVo);
		
		if(list.size() !=0) {
			menu30Repository.deleteVoucher(list);
		}
		
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

	public ReceiptVo dsum(ReceiptVo revo) {
		return menu30Repository.dsum(revo);
	}
	
	public ReceiptVo csum(ReceiptVo revo) {
		return menu30Repository.csum(revo);
	}
}
