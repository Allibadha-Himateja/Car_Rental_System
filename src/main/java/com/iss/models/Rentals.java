package com.iss.models;
import java.util.Date;

import javax.persistence.*;

@Entity
public class Rentals {

	@Id
	@Column(nullable=false,length=11)
	private int RentalNo;
	
	@ManyToOne
	@JoinColumn(name = "CustomerNo", nullable = true, referencedColumnName="CustomerNo")
	private Customers CustomerNo;
	
	@ManyToOne
	@JoinColumn(name = "VehicleNo", nullable = true, referencedColumnName="VehicleNo")
	private Vehicles VehicleNo;
	
	@ManyToOne
	@JoinColumn(name = "DriverNo", nullable = true, referencedColumnName="DriverNo")
	private Drivers DriverNo;
	
	@ManyToOne
	@JoinColumn(name = "EmployeeNo", nullable = true, referencedColumnName="EmployeeNo")
	private Employees EmployeeNo;
	
	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	private Date RegistrationDate;
	
	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	private Date StartDate;
	
	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	private Date EndDate;
	
	@Column(nullable=false,length=10)
	private int VehicleRate;
	
	@Column(nullable=false,length=10)
	private int NoOfDays;
	
	@Column(nullable=true,length=10)
	private int NoOfKMS;
	
	@Column(nullable=true,length=10)
	private int StartKMS;
	
	@Column(nullable=true,length=10)
	private int EndKMS;
	
	@ManyToOne
	@JoinColumn(name = "CityNo",nullable = true, referencedColumnName="CityNo")
	private Cities SourceLocation;
	
	@ManyToOne
	@JoinColumn(name = "Cityo",nullable = true, referencedColumnName="CityNo")
	private Cities DestinationLocation;
	
	@Column(nullable=true)
	private String TravelPurpose;
	
	@Column(nullable=true,length=50)
	private String TransactionNumber;
	
	@Column(nullable=true)
	private int Amount;
	
	@Column(nullable=true)
	private String Status;
	
	public Rentals()
	{
		super();
	}
	
	public int getRentalNo()
	{
		return RentalNo;
	}
	public void setRentalNo(int rentalno)
	{
		RentalNo=rentalno;
	}
	
	public Customers getCustomerNo()
	{
		return CustomerNo;
	}
	public void setRentalNo(Customers customerno)
	{
		CustomerNo=customerno;
	}
	
	public Vehicles getVehicleNo()
	{
		return VehicleNo;
	}
	public void setVehicleNo(Vehicles vehicleno)
	{
		VehicleNo=vehicleno;
	}
	
	public Drivers getDriverNo()
	{
		return DriverNo;
	}
	public void setDriverNo(Drivers driverno)
	{
		DriverNo=driverno;
	}

	public Employees getEmployeeNo()
	{
		return EmployeeNo;
	}
	public void setEmployeeNo(Employees employeeno)
	{
		EmployeeNo=employeeno;
	}
	
	public Date getRegistrationDate()
	{
		return RegistrationDate;
	}
	
	public void setRegistrationDate(Date registrationdate)
	{
		RegistrationDate=registrationdate;
	}
	
	public int getVehicleRate()
	{
		return VehicleRate;
	}
	public void setVehicleRate(int vehiclerate)
	{
		VehicleRate=vehiclerate;
	}
	
	public int getNoOfDays()
	{
		return NoOfDays;
	}
	public void setNoOfDays(int noofdays)
	{
		NoOfDays=noofdays;
	}
	
	public int getNoOfKMS()
	{
		return NoOfKMS;
	}
	public void setNoOfKMS(int noofkms)
	{
		NoOfKMS=noofkms;
	}
	
	public Date getStartDate()
	{
		return StartDate;
	}
	
	public void setStartDate(Date startdate)
	{
		StartDate=startdate;
	}
	
	public Date getEndDate()
	{
		return EndDate;
	}
	
	public void setEndDate(Date enddate)
	{
		EndDate=enddate;
	}
	
	public Cities getSourceLocation()
	{
		return SourceLocation;
	}
	public void setSourceLocation(Cities sourcelocation)
	{
		SourceLocation=sourcelocation;
	}
	
	public Cities getDestinationLocation()
	{
		return SourceLocation;
	}
	public void setDestinationLocation(Cities destinationlocation)
	{
		DestinationLocation=destinationlocation;
	}
	
	public String getTravelPurpose()
	{
		return TravelPurpose;
	}
	public void setTravelPurpose(String purpose)
	{
		TravelPurpose=purpose;
	}
	public String getTransactionNumber()
	{
		return TransactionNumber;
	}
	public void setTransactionNumber(String tn)
	{
		TransactionNumber=tn;
	}
	
	public int getAmount()
	{
		return Amount;
	}
	public void setAmount(int amount)
	{
		Amount=amount;
	}
	
	public String getStatus()
	{
		return Status;
	}
	public void setStatus(String status)
	{
		Status=status;
	}
	
	public Rentals(int rn,Customers cn,Vehicles vn,Drivers dn,Employees en,Date reservationdate,int vr,int nfd,Date startdate,Date enddate,int nok,int sk,int ek,Cities sl,Cities dl,String tp,int amount,String tn,String status)
	{
		super();
		RentalNo=rn;
		CustomerNo=cn;
		VehicleNo=vn;
		DriverNo=dn;
		EmployeeNo=en;
		RegistrationDate=reservationdate;
		VehicleRate=vr;
		NoOfDays=nfd;
		StartDate=startdate;
		EndDate=enddate;
		NoOfKMS=nok;
		StartKMS=sk;
		EndKMS=ek;
		SourceLocation=sl;
		DestinationLocation=dl;
		TravelPurpose=tp;
		Amount=amount;
		TransactionNumber=tn;
		Status=status;
	}
}
