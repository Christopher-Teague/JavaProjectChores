package com.project.chores.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotNull(message="User name is required!")
	@Size(min=2, message="name must be at least 2 characters long")
	private String userName;   

	@NotNull(message="Password is required!")
	@Size(min=2, message="password must be at least 2 characters long")
	private String password;   
	
	@Transient
//	@NotEmpty(message="Confirm Password is required!")
	@Size(min=2, max=128, message="Confirm Password must be between 2 and 128 characters")
	private String confirm;
  
	private Integer pointTotal;
	
	private Boolean isParent=false;
	
	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<Chore> chores;
	
	@OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<Reward> rewards;
	
	// add List of chores and list of rewards tied to user?? \\ 
	
	public User() {}
	
	public User(String userName, String password) {
		this.userName = userName;
		this.password = password;
		this.pointTotal = 0;   //controller
		this.isParent=false;

	}
	
	// ***** DB TABLE VARIABLES *****
	
	@Column(updatable=false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
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

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public void setPointTotal(Integer pointTotal) {
		this.pointTotal = pointTotal;
	}

	public Integer getPointTotal() {
		return pointTotal;
	}
	

	public Boolean getIsParent() {
		return isParent;
	}

	public void setIsParent(Boolean isParent) {
		this.isParent = isParent;
	}

	public List<Chore> getChores() {
		return chores;
	}

	public void setChores(List<Chore> chores) {
		this.chores = chores;
	}

	public List<Reward> getRewards() {
		return rewards;
	}

	public void setRewards(List<Reward> rewards) {
		this.rewards = rewards;
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
