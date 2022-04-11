package com.simplilearn.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_cred")
public class UserCred {
	//Instance Variable Declaration
	@Id
	@Column(name = "user_name")
	private String userName;
	@Column(name = "password")
	private String password;
	@Column(name = "name")
	private String name;
	@Column(name = "phone", length = 10)
	private String phone;
	@Column(name = "aadhar", length = 12)
	private String aadhar;

	//Non-parameterized Constructor
	public UserCred() {
	}
	
	// Getters and Setters
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAadhar() {
		return aadhar;
	}
	public void setAadhar(String aadhar) {
		this.aadhar = aadhar;
	}
	
	//To String Method
	@Override
	public String toString() {
		return "UserCred [userName=" + userName + ", password=" + password + ", name=" + name + ", phone=" + phone
				+ ", aadhar=" + aadhar + "]";
	}
}
