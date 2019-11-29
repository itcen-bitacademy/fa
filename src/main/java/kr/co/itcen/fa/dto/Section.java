package kr.co.itcen.fa.dto;

import java.util.ArrayList;
import java.util.List;

public class Section {
	private Long no;
	private String classification;
	private String lastUpdate;
	List<Section> subSections = new ArrayList<>();
	
	public Section(Long no, String classification, String lastUpdate) {
		super();
		this.no = no;
		this.classification = classification;
		this.lastUpdate = lastUpdate;
	}
	
	public String getCode() {
		return String.format("%02d", no);
	}

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

	public String getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(String lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public List<Section> getSubSections() {
		return subSections;
	}

	public void setSubSections(List<Section> subSections) {
		this.subSections = subSections;
	}
	
	public void addsubMenu(Section section) {
		subSections.add(section);
	}
	
	
}
