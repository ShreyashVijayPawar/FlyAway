package com.simplilearn.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "flight")
public class Flight {
	//Instance Variable Declaration
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Integer id;
	@Column(name = "name")
	private String name;
	@Column(name = "from_location")
	private String fromLocation;
	@Column(name = "to_location")
	private String toLocation;
	@Column(name = "departure")
	private String departure;
	@Column(name = "time")
	private String time;
	@Column(name = "price")
	private Integer price;
	@Column(name = "available_seats")
	private Integer availableSeats;

	//Non-parameterized and parameterized Constructor
	public Flight() {
	
	}

	// Getters and Setters
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFromLocation() {
		return fromLocation;
	}
	public void setFromLocation(String fromLocation) {
		this.fromLocation = fromLocation;
	}
	public String getToLocation() {
		return toLocation;
	}
	public void setToLocation(String toLocation) {
		this.toLocation = toLocation;
	}
	public String getDeparture() {
		return departure;
	}
	public void setDeparture(String departure) {
		this.departure = departure;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Integer getAvailableSeats() {
		return availableSeats;
	}
	public void setAvailableSeats(Integer availableSeats) {
		this.availableSeats = availableSeats;
	}

	//To String Method
	@Override
	public String toString() {
		return "Flight [id=" + id + ", name=" + name + ", fromLocation=" + fromLocation + ", toLocation=" + toLocation
				+ ", departure=" + departure + ", time=" + time + ", price=" + price + ", availableSeats="
				+ availableSeats + "]";
	}
}
