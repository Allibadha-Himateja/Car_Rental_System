package com.iss.models;
import javax.persistence.*;

@Entity
public class Owners {
	
	@Id
	@Column(nullable=false)
	private int OwnerNo;
	
	@Column(nullable=false,length=40)
	private String OwnerName;
	
	@Column(nullable=true,length=100)
	private String Address1;
	
	@Column(nullable=true,length=100)
	private String Address2;
	
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

	@Column(nullable=true,length=2)
	private String DeleteStatus;
	
	public Owners() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getOwnerNo() {
		return OwnerNo;
	}

	public void setOwnerNo(int ownerNo) {
		OwnerNo = ownerNo;
	}

	public String getName() {
		return OwnerName;
	}

	public void setName(String name) {
		OwnerName = name;
	}

	public String getAddress1() {
		return Address1;
	}

	public void setAddress1(String address1) {
		Address1 = address1;
	}

	public String getAddress2() {
		return Address2;
	}

	public void setAddress2(String address2) {
		Address2 = address2;
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

	public void setPAN(String pAN) {
		PAN = pAN;
	}

	public String getDeleteStatus() {
		return DeleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		DeleteStatus = deleteStatus;
	}

	public Owners(int ownerNo, String name, String address1, String address2, Cities cityNo, States stateNo,
			Countries countryNo, String pincode, String phoneNumber, String mobileNumber, String bankName,
			String bankAccount, String pAN, String deleteStatus) {
		super();
		OwnerNo = ownerNo;
		OwnerName = name;
		Address1 = address1;
		Address2 = address2;
		CityNo = cityNo;
		StateNo = stateNo;
		CountryNo = countryNo;
		Pincode = pincode;
		PhoneNumber = phoneNumber;
		MobileNumber = mobileNumber;
		BankName = bankName;
		BankAccount = bankAccount;
		PAN = pAN;
		DeleteStatus = deleteStatus;
	}
}