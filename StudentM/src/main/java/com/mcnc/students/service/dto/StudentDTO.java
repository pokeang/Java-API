package com.mcnc.students.service.dto;


public class StudentDTO {
	private int id;
	private String name;
	private float s1;
	private float s2;
	private float total;

	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public float getS1() {
		return s1;
	}


	public void setS1(float s1) {
		this.s1 = s1;
	}


	public float getS2() {
		return s2;
	}


	public void setS2(float s2) {
		this.s2 = s2;
	}
	public float getTotal(){
		return s1+s2;
	}

	@Override
	public String toString() {
		return "StudentDTO [id=" + id + ", name=" + name + "]";
	}
	

}
