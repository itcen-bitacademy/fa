package kr.co.itcen.fa.service.menu01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.dto.DataResult;
import kr.co.itcen.fa.repository.menu01.Menu03Repository;
import kr.co.itcen.fa.security.AuthUser;
import kr.co.itcen.fa.util.PaginationUtil;
import kr.co.itcen.fa.vo.UserVo;
import kr.co.itcen.fa.vo.menu01.ItemVo;
import kr.co.itcen.fa.vo.menu01.MappingVo;
import kr.co.itcen.fa.vo.menu01.Menu03SearchForm;
import kr.co.itcen.fa.vo.menu01.VoucherVo;

/**
 * 
 * @author 임성주
 * 전표관리
 *
 */
@Service
public class Menu03Service {
		
		@Autowired
		private Menu03Repository menu03Repository;
		
		//@Autowired
		//private Menu04Repository menu04Repository;
		
		public void test() {
			menu03Repository.test();
		}
		
		// 전표생성
		public Long createVoucher(VoucherVo voucherVo,  List<ItemVo> itemVo, MappingVo mappingVo, @AuthUser UserVo userVo) {
			voucherVo.setInsertUserid(userVo.getId());
			
			for(int i = 0; i < itemVo.size(); i++) {
				itemVo.get(i).setInsertUserid(userVo.getId());
			}
			System.out.println("!!!!!!!!!!!!" + userVo.getTeamName());
			mappingVo.setInsertTeam(userVo.getTeamName());
			mappingVo.setInsertUserid(userVo.getId());
			menu03Repository.createVoucher(voucherVo, itemVo, mappingVo);
			
			return voucherVo.getNo(); // 전표번호
		}
		
		// 페이징 처리
		public DataResult<VoucherVo> selectAllVoucherCount(int page) {
			DataResult<VoucherVo> dataResult = new DataResult<>();
			
			int totalCount = menu03Repository.selectAllVoucherCount();
			PaginationUtil paginationUtil = new PaginationUtil(page, totalCount, 11, 5);
			dataResult.setPagination(paginationUtil);
			
			Menu03SearchForm menu03SearchForm = new Menu03SearchForm();
			menu03SearchForm.setPagination(paginationUtil);
			System.out.println(paginationUtil.getPage());
			System.out.println(paginationUtil.getPageIndex());
			List<VoucherVo> list = menu03Repository.selectAllVoucher(menu03SearchForm);
			dataResult.setDatas(list);
			
			return dataResult;
		}
		
		// 전표 생성 & 리스트 반환
		public List<VoucherVo> add(VoucherVo voucherVo) {
			// TODO Auto-generated method stub
			return null;
		}
		
		
	}