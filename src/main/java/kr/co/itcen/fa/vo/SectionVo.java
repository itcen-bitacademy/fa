package kr.co.itcen.fa.vo;

import org.apache.ibatis.type.Alias;

/**
 * 
 * @author 안태영
 * 공통코드 관련 Vo
 * 
 **/

@Alias("sectionvo")
public class SectionVo {

	private Long no;				// Auto-Increment - PK
	private String classification;	// 분류명
	private String code;			// 코드
	private String lastUpdate;		// 업데이트
	private Long parentNo;			// 부모번호 

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public String getClassification() {
		return classification;
	}

	public void setClassification(String classification) {
		this.classification = classification;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(String lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public Long getParentNo() {
		return parentNo;
	}

	public void setParentNo(Long parentNo) {
		this.parentNo = parentNo;
	}

	@Override
	public String toString() {
		return "SectionVo [no=" + no + ", classification=" + classification + ", code=" + code + ", lastUpdate="
				+ lastUpdate + ", parentNo=" + parentNo + "]";
	}

}
