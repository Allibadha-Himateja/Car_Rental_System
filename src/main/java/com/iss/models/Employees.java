package com.iss.models;
import javax.persistence.*;
import java.util.Date;

@Entity
public class Employees {
	
	@Id
	@Column(nullable=false)
	private int EmployeeNo;
	
	@Column(nullable=false,length=40)
	private String EmployeeName;
	
	@Column(nullable=false,length=40)
	private String EmployeeType;
	
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
	
	@Column(nullable=true,length=75)
	private String EmailAddress;
	
	@Column(nullable=false,length=40)
	private String BankName;
	
	@Column(nullable=false,length=15)
	private String BankAccount;
	
	@Column(nullable=false,length=20)
	private String PAN;
	
	@Column(nullable=false,unique=true,length=20)
	private String Username;
	
	@Column(nullable=false,length=10)
	private String Password;
	
	@Column(nullable=true,length=5)
	private String Cities;
	
	@Column(nullable=true,length=5)
	private String States;
	
	@Column(nullable=true,length=5)
	private String Countries;
	
	@Column(nullable=true,length=5)
	private String Vehicles;
	
	@Column(nullable=true,length=5)
	private String VehicleMakes;
	
	@Column(nullable=true,length=5)
	private String VehicleModels;
	
	@Column(nullable=true,length=5)
	private String Employees;
	
	@Column(nullable=true,length=5)
	private String Customers;
	
	@Column(nullable=true,length=5)
	private String Owners;
	
	@Column(nullable=true,length=5)
	private String Drivers;
	
	@Column(nullable=true,length=5)
	private String Rentals;
	
	@Temporal(TemporalType.DATE)
	@Column(nullable=true)
	private Date LastLogin;
	
	@Column(nullable=true,length=10)
	private String  Status;
	
	@Column(nullable=true,length=2)
	private String  DeleteStatus;

	public Employees() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getEmployeeNo() {
		return EmployeeNo;
	}

	public void setEmployeeNo(int employeeNo) {
		EmployeeNo = employeeNo;
	}

	public String getEmployeeName() {
		return EmployeeName;
	}

	public void setName(String name) {
		EmployeeName = name;
	}

	public String getEmployeeType() {
		return EmployeeType;
	}

	public void setEmployeeType(String employeeType) {
		EmployeeType = employeeType;
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

	public String getCities() {
		return Cities;
	}

	public void setCities(String cities) {
		Cities = cities;
	}

	public String getStates() {
		return States;
	}

	public void setStates(String states) {
		States = states;
	}

	public String getCountries() {
		return Countries;
	}

	public void setCountries(String countries) {
		Countries = countries;
	}

	public String getVehicles() {
		return Vehicles;
	}

	public void setVehicles(String vehicles) {
		Vehicles = vehicles;
	}

	public String getVehicleMakes() {
		return VehicleMakes;
	}

	public void setVehicleMakes(String vehicleMakes) {
		VehicleMakes = vehicleMakes;
	}

	public String getVehicleModels() {
		return VehicleModels;
	}

	public void setVehicleModels(String vehicleModels) {
		VehicleModels = vehicleModels;
	}

	public String getEmployees() {
		return Employees;
	}

	public void setEmployees(String employees) {
		Employees = employees;
	}

	public String getCustomers() {
		return Customers;
	}

	public void setCustomers(String customers) {
		Customers = customers;
	}

	public String getOwners() {
		return Owners;
	}

	public void setOwners(String owners) {
		Owners = owners;
	}

	public String getDrivers() {
		return Drivers;
	}

	public void setDrivers(String drivers) {
		Drivers = drivers;
	}

	public String getRentals() {
		return Rentals;
	}

	public void setRentals(String rentals) {
		Rentals = rentals;
	}
	
	public Date getLastLogin()
	{
		return LastLogin;
	}
	
	public void setLastLogin(Date date)
	{
		LastLogin=date;
	}
	
	public String getStatus()
	{
		return Status;
	}
	public void setStatus(String status)
	{
		Status=status;
	}
	
	public String getDeleteStatus()
	{
		return DeleteStatus;
	}
	public void setDeleteStatus(String status)
	{
		DeleteStatus=status;
	}

	public Employees(int employeeNo, String name, String employeeType, String addressLine1, String addressLine2,
			com.iss.models.Cities cityNo, com.iss.models.States stateNo, com.iss.models.Countries countryNo,
			String pincode, String phoneNumber, String mobileNumber, String emailAddress, String bankName,
			String bankAccount, String pan, String username, String password, String cities, String states,
			String countries, String vehicles, String vehicleMakes, String vehicleModels, String employees,
			String customers, String owners, String drivers, String rentals,Date lastlogin,String status,String deletestatus) {
		super();
		EmployeeNo = employeeNo;
		EmployeeName = name;
		EmployeeType = employeeType;
		AddressLine1 = addressLine1;
		AddressLine2 = addressLine2;
		CityNo = cityNo;
		StateNo = stateNo;
		CountryNo = countryNo;
		Pincode = pincode;
		PhoneNumber = phoneNumber;
		MobileNumber = mobileNumber;
		EmailAddress = emailAddress;
		BankName = bankName;
		BankAccount = bankAccount;
		PAN = pan;
		Username = username;
		Password = password;
		Cities = cities;
		States = states;
		Countries = countries;
		Vehicles = vehicles;
		VehicleMakes = vehicleMakes;
		VehicleModels = vehicleModels;
		Employees = employees;
		Customers = customers;
		Owners = owners;
		Drivers = drivers;
		Rentals = rentals;
		LastLogin=lastlogin;
		Status=status;
		DeleteStatus=deletestatus;
	}
}