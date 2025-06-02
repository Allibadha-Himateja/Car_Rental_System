package com.iss.models;
import java.util.Date;

import javax.persistence.*;

@Entity
public class Customers 
{
	@Id
	@Column(nullable=false)
	private int CustomerNo;
	
	@Column(nullable=false,length=40)
	private String CustomerName;
	
	@Column(nullable=false,length=75)
	private String EmailAddress;
	
	@Column(nullable=false,length=100)
	private String AddressLine1;
	
	@Column(nullable=false,length=100)
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
	
	@Column(nullable=false,unique=true,length=20)
	private String Username;
	
	@Column(nullable=false,length=10)
	private String Password;
	
	@Temporal(TemporalType.DATE)
	@Column(nullable=true)
	private Date RegistrationDate;
	
	@Temporal(TemporalType.DATE)
	@Column(nullable=true)
	private Date LastLogin;
	
	@Column(nullable=true,length=2)
	private String  DeleteStatus;
	
	public Customers()
	{
		super();
	}
	
	public int getCustomerNo() {
		return CustomerNo;
	}

	public void setCustomerNo(int customerNo) {
		CustomerNo = customerNo;
	}

	public String getName() {
		return CustomerName;
	}

	public void setName(String name) {
		CustomerName = name;
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

	public String getEmailAddress() {
		return EmailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		EmailAddress = emailAddress;
	}
	
	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}
	
	public Date getRegistrationDate()
	{
		return RegistrationDate;
	}
	
	public void setRegistrationDate(Date registrationdate)
	{
		RegistrationDate=registrationdate;
	}
	
	public Date getLastLogin()
	{
		return LastLogin;
	}
	
	public void setLastLogin(Date lastlogin)
	{
		LastLogin=lastlogin;
	}
	
	public String getDeleteStatus()
	{
		return DeleteStatus;
	}
	public void setDeleteStatus(String status)
	{
		DeleteStatus=status;
	}
	
	public Customers(int customerno, String name, String addressLine1, String addressLine2,
			com.iss.models.Cities cityNo, com.iss.models.States stateNo, com.iss.models.Countries countryNo,
			String pincode, String phoneNumber, String mobileNumber, String emailAddress,String username, String password,Date lastlogin,Date registrationdate,String deletestatus) {
		super();
		CustomerNo = customerno;
		CustomerName = name;
		AddressLine1 = addressLine1;
		AddressLine2 = addressLine2;
		CityNo = cityNo;
		StateNo = stateNo;
		CountryNo = countryNo;
		Pincode = pincode;
		PhoneNumber = phoneNumber;
		MobileNumber = mobileNumber;
		EmailAddress = emailAddress;
		Username = username;
		Password = password;
		LastLogin=lastlogin;
		RegistrationDate=registrationdate;
		DeleteStatus=deletestatus;
	}
}
