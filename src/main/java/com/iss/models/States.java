package com.iss.models;

import javax.persistence.*;


@Entity
@Table(name = "States")
public class States {
	
	@Id
    @Column(name = "StateNo",nullable=false)
    private Integer StateNo;
	
	@ManyToOne
	@JoinColumn(name = "CountryNo", nullable = false, referencedColumnName="CountryNo")	
	 private Countries CountryNo;
	

	@Column(name = "StateName", nullable = false, length = 40)
	 private String StateName;
	 
	 public States() {
		super();
	}

	public Integer getStateNo() {
		return StateNo;
	}

	public void setStateNo(Integer stateNo) {
		StateNo = stateNo;
	}

	public Countries getCountryNo() {
		return CountryNo;
	}

	public void setCountryNo(Countries countryNo) {
		CountryNo = countryNo;
	}

	public String getStateName() {
		return StateName;
	}

	public void setStateName(String stateName) {
		StateName = stateName;
	}

	public States(Integer stateNo, Countries countryNo, String stateName) {
		super();
		StateNo = stateNo;
		CountryNo = countryNo;
		StateName = stateName;
	}
}