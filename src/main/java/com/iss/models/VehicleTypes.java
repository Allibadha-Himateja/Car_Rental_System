package com.iss.models;
import javax.persistence.*;

@Entity
public class VehicleTypes {
	
	@Id
	@Column(nullable=false)
	private int TypeNo;
	
	@Column(nullable=true,length=40)
	private String Type;

	public VehicleTypes() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getTypeNo() {
		return TypeNo;
	}

	public void setTypeNo(int typeNo) {
		TypeNo = typeNo;
	}

	public String getType() {
		return Type;
	}

	public void setType(String type) {
		Type = type;
	}

	public VehicleTypes(int typeNo, String type) {
		super();
		TypeNo = typeNo;
		Type=type;
	}
}