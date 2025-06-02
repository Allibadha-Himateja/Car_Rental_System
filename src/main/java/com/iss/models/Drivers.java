package com.iss.models;
import javax.persistence.*;

@Entity
public class Drivers
{
	@Id
	@Column(nullable=false)
	private int DriverNo;
	
	@Column(nullable=false,length=40)
	private String DriverName;
	
	@Column(nullable=false,length=40,unique=true)
	private int LicenseNumber;
	
	@Column(nullable=true,length=100)
	private String AddressLine1;
	
	@Column(nullable=true,length=100)
	private String AddressLine2;
	
	@ManyToOne
	@JoinColumn(name = "CityNo", nullable = true, referencedColumnName="CityNo")	
	 private Cities CityNo;
	
	@ManyToOne
	@JoinColumn(name = "StateNo", nullable = true, referencedColumnName="StateNo")	
	 private States StateNo;
	
	@ManyToOne
	@JoinColumn(name = "CountryNo", nullable = true, referencedColumnName="CountryNo")	
	 private Countries CountryNo;
	
	@Column(nullable=true,length=15)
	private String Pincode;
	
	@Column(nullable=true,length=15)
	private String PhoneNumber;
	
	@Column(nullable=true,length=15)
	private String MobileNumber;
	
	
	@Column(nullable=false,length=40)
	private String BankName;
	
	@Column(nullable=false,length=15)
	private String BankAccount;
	
	@Column(nullable=false,length=20)
	private String PAN;
	
	public Drivers()
	{
		super();
	}
	
	public int getDriverNo() {
		return DriverNo;
	}

	public void setDriverNo(int driverno) {
		DriverNo = driverno;
	}

	public String getDriverName() {
		return DriverName;
	}

	public void setDriverName(String drivername) {
		DriverName = drivername;
	}

	public int getLicenseNumber() {
		return LicenseNumber;
	}

	public void setLicenseNumber(int licenseno) {
		LicenseNumber=licenseno;
	}

	public String getAddressLine1() {
		return AddressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		AddressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return AddressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		AddressLine2 = addressLine2;
	}

	public Cities getCityNo() {
		return CityNo;
	}

	public void setCityNo(Cities cityNo) {
		CityNo = cityNo;
	}

	public States getStateNo() {
		return StateNo;
	}

	public void setStateNo(States stateNo) {
		StateNo = stateNo;
	}

	public Countries getCountryNo() {
		return CountryNo;
	}

	public void setCountryNo(Countries countryNo) {
		CountryNo = countryNo;
	}

	public String getPincode() {
		return Pincode;
	}

	public void setPincode(String pincode) {
		Pincode = pincode;
	}

	public String getPhoneNumber() {
		return PhoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}

	public String getMobileNumber() {
		return MobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		MobileNumber = mobileNumber;
	}


	public String getBankName() {
		return BankName;
	}

	public void setBankName(String bankName) {
		BankName = bankName;
	}

	public String getBankAccount() {
		return BankAccount;
	}

	public void setBankAccount(String bankAccount) {
		BankAccount = bankAccount;
	}

	public String getPAN() {
		return PAN;
	}

	public void setPAN(String PAN) {
		this.PAN = PAN;
	}
	

	public Drivers(int driverno, String name,int licenseno,  String addressLine1, String addressLine2,
			com.iss.models.Cities cityNo, com.iss.models.States stateNo, com.iss.models.Countries countryNo,
			String pincode, String phoneNumber, String mobileNumber, String bankName,
			String bankAccount, String pan) {
		super();
		DriverNo=driverno;
		DriverName = name;
		LicenseNumber=licenseno;
		AddressLine1 = addressLine1;
		AddressLine2 = addressLine2;
		CityNo = cityNo;
		StateNo = stateNo;
		CountryNo = countryNo;
		Pincode = pincode;
		PhoneNumber = phoneNumber;
		MobileNumber = mobileNumber;
		BankName = bankName;
		BankAccount = bankAccount;
		PAN = pan;
}
}
