package com.iss.models;
import javax.persistence.*;

@Entity
public class VehicleCapacity {

	@Id
	@Column(nullable=false)
	private int CapacityNo;
	
	@Column(nullable=true)
	private int Capacity;

	public VehicleCapacity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getCapacityNo() {
		return CapacityNo;
	}

	public void setCapacityNo(int capacityNo) {
		CapacityNo = capacityNo;
	}

	public int getCapacity() {
		return Capacity;
	}

	public void setCapacity(int capacity) {
		Capacity = capacity;
	}

	public VehicleCapacity(int capacityNo, int capacity) {
		super();
		CapacityNo = capacityNo;
		Capacity = capacity;
	}
	
}