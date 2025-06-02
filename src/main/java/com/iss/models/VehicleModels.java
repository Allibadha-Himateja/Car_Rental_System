package com.iss.models;
import javax.persistence.*;

@Entity
public class VehicleModels {
	
	@Id
	@Column(nullable=false)
	private int ModelNo;
	
	@ManyToOne
	@JoinColumn( name = "MakeNo",nullable = false, referencedColumnName="MakeNo")	
	private VehicleMakes MakeNo;
	
	@Column(nullable=false, length=40)
	private String Name;

	public int getModelNo() {
		return ModelNo;
	}

	public void setModelNo(int modelNo) {
		ModelNo = modelNo;
	}

	public VehicleMakes getMakeNo() {
		return MakeNo;
	}

	public void setMakeNo(VehicleMakes makeNo) {
		MakeNo = makeNo;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public VehicleModels(int modelNo, VehicleMakes makeNo, String name) {
		super();
		ModelNo = modelNo;
		MakeNo = makeNo;
		Name = name;
	}

	public VehicleModels() {
		super();
		// TODO Auto-generated constructor stub
	}
}