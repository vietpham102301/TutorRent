package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "ACCOUNT")
public class Account {
	
	@Id
	@GeneratedValue
	@Column(name="acc_id")
	private int accId;
	
	@Column(name="user_id")
	private int userID;
	
	@Column(name = "username")
	private String username;
	
	@Column(name = "password")
	private String password;
	
//	@Column(name= "role")
//	private String role;
	
	@Column(name = "email")
	private String email;
	
	@Transient
	private String confirmPass;
	
	public String getConfirmPass() {
		return confirmPass;
	}
	
	public void setConfirmPass(String confirmPass)
	{
		this.confirmPass = confirmPass;
	}
	
	public int getAccId() {
		return accId;
	}
	public Account() {
		super();
	}
	public Account(int accId, int userId, String username, String password, String email) {
		super();
		this.accId = accId;
		this.userID = userId;
		this.username = username;
		this.password = password;
		//this.role = role;
		this.email = email;
	}
	public void setAccId(int accId) {
		this.accId = accId;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userId) {
		this.userID = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
//	public String getRole() {
//		return role;
//	}
//	public void setRole(String role) {
//		this.role = role;
//	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
