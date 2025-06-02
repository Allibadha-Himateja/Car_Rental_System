package com.iss.models;
import javax.persistence.*;

@Entity
public class Vehicles {
	
	@Id
	@Column(nullable=false)
	private int VehicleNo;
	
	@ManyToOne
	@JoinColumn(name = "OwnerNo", nullable = false, referencedColumnName="OwnerNo")	
	private Owners OwnerNo;
	
	@ManyToOne
	@JoinColumn(name = "ModelNo", nullable = false, referencedColumnName="ModelNo")	
	private VehicleModels ModelNo;

	@Column(nullable=false,length=40)
	private String  Type;
	
	@Column(nullable=false,length=40)
	private int  Year;
	
	@Column(nullable=false,length=40)
	private String  Color;
	

	@Column(nullable=false,length=20)
	private String  Fuel;

	@Column(nullable=false,length=5)
	private int Capacity;
	
	@Column(nullable=false,length=10)
	private int  Mileage;
	
	@Lob
    @Column(name = "Picture", nullable = true)
    private byte[] Picture;
	
	@Column(nullable=false,length=20)
	private String  RegistrationNumber;
	
	@ManyToOne
	@JoinColumn(name = "RegistrationState", nullable = true, referencedColumnName="StateNo")	
	 private States StateNo;
	
	@Column(nullable=false,length=25)
	private String  ChaisisNumber;
	
	@Column(nullable=false,length=10)
	private int  DailyRate;
	
	@Column(nullable=true,length=10)
	private int  HourlyRate;
	
	@Column(nullable=false,length=10)
	private int  AdditionalDailyRate;
	
	@Column(nullable=true,length=10)
	private int  AdditionalHourlyRate;
	
	@Column(nullable=true,length=2)
	private String  DeleteStatus;
	
	public Vehicles() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getVehicleNo() {
		return VehicleNo;
	}

	public void setVehicleNo(int vehicleNo) {
		VehicleNo = vehicleNo;
	}

	public Owners getOwnerNo() {
		return OwnerNo;
	}

	public void setOwnerNo(Owners ownerNo) {
		OwnerNo = ownerNo;
	}

	public VehicleModels getModelNo() {
		return ModelNo;
	}

	public void setModelNo(VehicleModels modelNo) {
		ModelNo = modelNo;
	}

	public String getType() {
		return Type;
	}

	public void setType(String type) {
		Type = type;
	}

	public int getYear() {
		return Year;
	}

	public void setYear(int year) {
		Year = year;
	}

	public String getColor() {
		return Color;
	}

	public void setColor(String color) {
		Color = color;
	}

	public String getFuel() {
		return Fuel;
	}

	public void setFuel(String fuel) {
		Fuel = fuel;
	}

	public int getCapacity() {
		return Capacity;
	}

	public void setCapacity(int capacity) {
		Capacity = capacity;
	}

	public int getMileage() {
		return Mileage;
	}

	public void setMileage(int mileage) {
		Mileage = mileage;
	}

	public byte[] getPicture() {
		return Picture;
	}

	public void setPicture(byte[] picture) {
		Picture = picture;
	}

	public String getRegistrationNumber() {
		return RegistrationNumber;
	}

	public void setRegistrationNumber(String registrationNumber) {
		RegistrationNumber = registrationNumber;
	}

	public States getStateNo() {
		return StateNo;
	}

	public void setStateNo(States stateNo) {
		StateNo = stateNo;
	}

	public String getChaisisNumber() {
		return ChaisisNumber;
	}

	public void setChaisisNumber(String chaisisNumber) {
		ChaisisNumber = chaisisNumber;
	}

	public int getDailyRate() {
		return DailyRate;
	}

	public void setDailyRate(int dailyRate) {
		DailyRate = dailyRate;
	}

	public int getHourlyRate() {
		return HourlyRate;
	}

	public void setHourlyRate(int hourlyRate) {
		HourlyRate = hourlyRate;
	}

	public int getAdditionalDailyRate() {
		return AdditionalDailyRate;
	}

	public void setAdditionalDailyRate(int additionalDailyRate) {
		AdditionalDailyRate = additionalDailyRate;
	}

	public int getAdditionalHourlyRate() {
		return AdditionalHourlyRate;
	}

	public void setAdditionalHourlyRate(int additionalHourlyRate) {
		AdditionalHourlyRate = additionalHourlyRate;
	}

	public String getDeleteStatus() {
		return DeleteStatus;
	}

	public void setDeleteStatus(String deleteStatus) {
		DeleteStatus = deleteStatus;
	}

	public Vehicles(int vehicleNo, Owners ownerNo, VehicleModels modelNo, String type, int year, String color,
			String fuel, int capacity, int mileage, byte[] picture, String registrationNumber, States stateNo,
			String chaisisNumber, int dailyRate, int hourlyRate, int additionalDailyRate, int additionalHourlyRate,
			String deleteStatus) {
		super();
		VehicleNo = vehicleNo;
		OwnerNo = ownerNo;
		ModelNo = modelNo;
		Type = type;
		Year = year;
		Color = color;
		Fuel = fuel;
		Capacity = capacity;
		Mileage = mileage;
		Picture = picture;
		RegistrationNumber = registrationNumber;
		StateNo = stateNo;
		ChaisisNumber = chaisisNumber;
		DailyRate = dailyRate;
		HourlyRate = hourlyRate;
		AdditionalDailyRate = additionalDailyRate;
		AdditionalHourlyRate = additionalHourlyRate;
		DeleteStatus = deleteStatus;
	}
}
	
	