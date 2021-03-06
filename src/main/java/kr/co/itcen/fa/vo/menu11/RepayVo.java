package kr.co.itcen.fa.vo.menu11;

import org.apache.ibatis.type.Alias;

@Alias("repayvo")
public class RepayVo {
	private Long no; // 번호
	private Long debtNo; // 사채,장기,단기 번호
	private String code; // 각 사채, 장기, 단기 테이블과 비교하기 위한 변수
	private Long totalPayPrinc; // 납입금 + 이자금액 : 총납입금 출력
	private Long payPrinc; // 납입금
	private Long tempPayPrinc; // 상환잔액 수정시에 임시저장하는 변수
	private Long intAmount; // 이자금액
	private String payDate; // 상환 일
	private String debtType; // 사채,장기,단기 구분
	private Long voucherNo; // 전표번호
	private String depositNo; // 계좌번호
	private Long accountNo = 9201101L; // 이자비용 계정코드
	private String deleteFlag; // 식제여부
	private String insertId; // 등록자
	private String insertDate; // 등록일
	private String updateId; // 수정자
	private String updateDate; // 수정일

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public Long getDebtNo() {
		return debtNo;
	}

	public void setDebtNo(Long debtNo) {
		this.debtNo = debtNo;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Long getTotalPayPrinc() {
		return totalPayPrinc;
	}

	public void setTotalPayPrinc(Long totalPayPrinc) {
		this.totalPayPrinc = totalPayPrinc;
	}

	public Long getPayPrinc() {
		return payPrinc;
	}

	public void setPayPrinc(Long payPrinc) {
		this.payPrinc = payPrinc;
	}

	public Long getTempPayPrinc() {
		return tempPayPrinc;
	}

	public void setTempPayPrinc(Long tempPayPrinc) {
		this.tempPayPrinc = tempPayPrinc;
	}

	public Long getIntAmount() {
		return intAmount;
	}

	public void setIntAmount(Long intAmount) {
		this.intAmount = intAmount;
	}

	public String getPayDate() {
		return payDate;
	}

	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}

	public String getDebtType() {
		return debtType;
	}

	public void setDebtType(String debtType) {
		this.debtType = debtType;
	}

	public Long getVoucherNo() {
		return voucherNo;
	}

	public void setVoucherNo(Long voucherNo) {
		this.voucherNo = voucherNo;
	}

	public String getDepositNo() {
		return depositNo;
	}

	public void setDepositNo(String depositNo) {
		this.depositNo = depositNo;
	}

	public Long getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(Long accountNo) {
		this.accountNo = accountNo;
	}

	public String getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(String deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getInsertId() {
		return insertId;
	}

	public void setInsertId(String insertId) {
		this.insertId = insertId;
	}

	public String getInsertDate() {
		return insertDate;
	}

	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}

	public String getUpdateId() {
		return updateId;
	}

	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "RepayVo [no=" + no + ", debtNo=" + debtNo + ", code=" + code + ", totalPayPrinc=" + totalPayPrinc
				+ ", payPrinc=" + payPrinc + ", tempPayPrinc=" + tempPayPrinc + ", intAmount=" + intAmount
				+ ", payDate=" + payDate + ", debtType=" + debtType + ", voucherNo=" + voucherNo + ", depositNo="
				+ depositNo + ", accountNo=" + accountNo + ", deleteFlag=" + deleteFlag + ", insertId=" + insertId
				+ ", insertDate=" + insertDate + ", updateId=" + updateId + ", updateDate=" + updateDate + "]";
	}

}
