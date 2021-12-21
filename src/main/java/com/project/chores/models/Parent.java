package com.project.chores.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Parent extends User{

	private Boolean isParent;
	  
	// Maybe add "private Boolean isParent = true;" to creation 
	// or just see if email isPresent to give access.

	public Parent() {}
	
	public Parent(String name, String email, String password) {
		super(name, email, password);
		this.isParent = true;
	}
	
	
	
	// ***** DB TABLE VARIABLES *****
	
	@Column(updatable=false)
	@DateTimeFormat(pattern = "MM-dd-yyyy")
	private Date createdAt;
	
	@DateTimeFormat(pattern = "MM-dd-yyyy")
	private Date updatedAt;
	
	
	@PrePersist
	protected void onCreated() {
		this.createdAt = new Date();
	}
		
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
	
	// SETTERS and GETTERS \\


	public Boolean getIsParent() {
		return isParent;
	}

	public void setIsParent(Boolean isParent) {
		this.isParent = isParent;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
}
