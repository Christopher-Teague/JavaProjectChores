package com.project.chores.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class Chore {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull(message="Name is required!")
	@Size(min=2, message="name must be at least 2 characters long")
	private String choreName;   

	@NotNull(message="Value must be at least 1")
	@Min(value=1)
	private Double value;
	
	private Boolean completed;
	
	
	public Chore() {}
	
	public Chore(String choreName, Double value) {
		this.choreName=choreName;
		this.value=value;
		this.completed=false;
	}
	
	
	// ***** DB TABLE VARIABLES ***** \\
	
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
	
	// ***** GETTERS and SETTERS ***** \\

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getChoreName() {
		return choreName;
	}

	public void setChoreName(String choreName) {
		this.choreName = choreName;
	}

	public Double getValue() {
		return value;
	}

	public void setValue(Double value) {
		this.value = value;
	}
		
	public Boolean getCompleted() {
		return completed;
	}

	public void setCompleted(Boolean completed) {
		this.completed = completed;
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
