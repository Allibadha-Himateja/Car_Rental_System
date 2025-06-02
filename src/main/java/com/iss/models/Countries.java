package com.iss.models;

import javax.persistence.*;


@Entity
@Table(name = "Countries")
public class Countries {

	
	@Id
    @Column(name = "CountryNo",nullable=false)
    private int CountryNo;
	
	 @Column(name = "Country", nullable = false, length = 60)
	 private String Country;

	 public Countries() {
			super();
		}

	public Countries(int countryNo, String country) {
		super();
		CountryNo = countryNo;
		Country = country;
	}

	public int getCountryNo() {
		return CountryNo;
	}

	public void setCountryNo(int countryNo) {
		CountryNo = countryNo;
	}

	public String getCountry() {
		return Country;
	}

	public void setCountry(String country) {
		Country = country;
	}
}