package entities;

import java.time.LocalDate;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "STUDENT")
public class Student {
	
	@Id
	@GeneratedValue
	@Column(name="student_id")
	private int studentId;
	
	@Column(name="f_name")
	private String fName;
	
	@Column(name="l_name")
	private String lName;
	
	@Column(name="address")
	private String address;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy/mm/dd")
	@Column(name="birth_date")
	private Date bdate;
	
	@Column(name="sex")
	private String sex;
	
	@Column(name="description")
	private String description;
	

	
	@Column(name="phone")
	private String phone;
	
	public Student() {
		super();
	}

	public Student(int studentId, String fName, String lName, String address, Date bdate, String sex,
			String description, int postId, String phone) {
		super();
		this.studentId = studentId;
		this.fName = fName;
		this.lName = lName;
		this.address = address;
		this.bdate = bdate;
		this.sex = sex;
		this.description = description;
		
		this.phone = phone;
	}
	
	@OneToMany(mappedBy="student", fetch = FetchType.EAGER)
    private Collection<Post> posts;

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}



	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	
	
}
