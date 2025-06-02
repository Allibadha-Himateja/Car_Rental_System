package com.iss.models;
import javax.persistence.*;

@Entity
public class Cities {

	@Id
    @Column(nullable=false)
    private int  CityNo;
	
	@ManyToOne
	@JoinColumn( name = "StateNo",nullable = false, referencedColumnName="StateNo")	
	private States StateNo;
	
	@Column( nullable = false, length = 40)
	 private String CityName;
	 
	
	public Cities() {
		super();
	}

	public Cities(int cityNo, States stateNo, String cityName) {
		super();
		CityNo = cityNo;
		StateNo = stateNo;
		CityName = cityName;
	}

	public int getCityNo() {
		return CityNo;
	}

	public void setCityNo(int cityNo) {
		CityNo = cityNo;
	}

	public States getStateNo() {
		return StateNo;
	}

	public void setStateNo(States stateNo) {
		StateNo = stateNo;
	}

	public String getCityName() {
		return CityName;
	}

	public void setCityName(String cityName) {
		CityName = cityName;
	}
}