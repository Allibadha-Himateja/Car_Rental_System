package com.iss.models;
import javax.persistence.*;

@Entity
public class VehicleFuel {

	@Id
	@Column(nullable=false)
	private int FuelNo;
	
	@Column(nullable=true,length=20)
	private String Fuel;

	public VehicleFuel() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getFuelNo() {
		return FuelNo;
	}

	public void setFuelNo(int fuelNo) {
		FuelNo = fuelNo;
	}

	public VehicleFuel(int fuelNo, String fuel) {
		super();
		FuelNo = fuelNo;
		Fuel = fuel;
	}

	public String getFuel() {
		return Fuel;
	}

	public void setFuel(String fuel) {
		Fuel=fuel;
	}
	
}