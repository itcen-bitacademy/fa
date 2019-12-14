package kr.co.itcen.fa.vo.menu08;

import org.apache.ibatis.type.Alias;

@Alias("purposevo")
public class PurposeVo {

	private String classification;
	private Long accountNo;
	private String yOrN;
	
	public String getClassification() {
		return classification;
	}
	
	public void setClassification(String classification) {
		this.classification = classification;
	}
	
	public Long getAccountNo() {
		return accountNo;
	}
	
	public void setAccountNo(Long accountNo) {
		this.accountNo = accountNo;
	}
	
	public String getyOrN() {
		return yOrN;
	}
	
	public void setyOrN(String yOrN) {
		this.yOrN = yOrN;
	}
	
	@Override
	public String toString() {
		return "PurposeVo [classification=" + classification + ", accountNo=" + accountNo + ", yOrN=" + yOrN + "]";
	}
}
