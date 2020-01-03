package kr.co.itcen.fa.service.menu01;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu01.Menu29Repository;
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
public class Menu29Service {
	
	@Autowired
	private Menu29Repository menu29Repository;
	

	@Autowired
	private Menu03Service menu03Service;
	
	public DataResult<ReceiptVo> search(int page, ReceiptVo revo, @AuthUser UserVo authUser) {
		DataResult<ReceiptVo> dataResult = new DataResult<ReceiptVo>();
	
		int totalCnt = menu29Repository.listCount(revo);
		PaginationUtil pagination = new PaginationUtil(page, totalCnt, 11, 5);
		dataResult.setPagination(pagination);
		List<ReceiptVo> list = menu29Repository.list(pagination,revo);
	    dataResult.setDatas(list);
	    
		return dataResult;
	}
	
	public PreviousVo previous(ReceiptVo revo) {
		if(menu29Repository.previousexist(revo)) {
			return null;
		}
		List<PreviousVo> previous = menu29Repository.previous(revo);
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
	
	public ReceiptVo dsum(ReceiptVo revo) {
		return menu29Repository.dsum(revo);
	}
	
	public ReceiptVo csum(ReceiptVo revo) {
		return menu29Repository.csum(revo);
	}
}
