package com.iss.models;
import javax.persistence.*;

@Entity
public class VehicleMakes {
	
	@Id
	@Column(nullable=false)
	private int MakeNo;
	
	@Column(nullable=false, length=40)
	private String Name;

	public VehicleMakes(int makeNo, String name) {
		super();
		MakeNo = makeNo;
		Name = name;
	}

	public VehicleMakes() {
		super();
	}

	public int getMakeNo() {
		return MakeNo;
	}

	public void setMakeNo(int makeNo) {
		MakeNo = makeNo;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name=name;
	}
	
	

}