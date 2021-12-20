package com.project.chores.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull(message="Name is required!")
	@Size(min=2, message="name must be at least 2 characters long")
	private String name;   

	@NotNull(message="Password is required!")
	@Size(min=2, message="password must be at least 2 characters long")
	private String password;   
	
	@Transient
    @NotEmpty(message="Confirm Password is required!")
    @Size(min=8, max=128, message="Confirm Password must be between 8 and 128 characters")
    private String confirm;
	
	private Double pointTotal;
	
	public User() {}
	
	public User(String name, String password) {
		this.name = name;
		this.password = password;
		this.pointTotal = (double) 0;
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

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public Double getPointTotal() {
		return pointTotal;
	}

	public void setPointTotal(Double pointTotal) {
		this.pointTotal = pointTotal;
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
