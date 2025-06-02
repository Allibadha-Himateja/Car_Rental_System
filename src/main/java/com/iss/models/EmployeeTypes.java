package com.iss.models;
import javax.persistence.*;

@Entity
public class EmployeeTypes {
	
	@Id
	@Column(nullable=false)
	private int EmployeeTypeNo;
	
	@Column(nullable=true,length=40)
	private String Type;

	public EmployeeTypes() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getEmployeeTypeNo() {
		return EmployeeTypeNo;
	}

	public void setEmployeeTypeNo(int employeeTypeNo) {
		EmployeeTypeNo = employeeTypeNo;
	}

	public String getType() {
		return Type;
	}

	public void setType(String type) {
		Type=type;
	}

}