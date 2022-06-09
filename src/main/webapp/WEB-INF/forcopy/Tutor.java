package ptit.entity;

import java.time.LocalDate;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
//import org.springframework.web.multipart.MultipartFile;

@Component
@Scope("session")
@Entity
@Table(name="TUTOR")
public class Tutor {
	
	@Id
	@GeneratedValue
	@Column(name="tutor_id")
	private int tutorId;
	
	@Column(name="f_name")
	private String firstName;
	
	@Column(name="l_name")
	private String lastName;
	
	@Column(name="birth_date")
	private String birthDate;
	
	@Column(name = "identity_num")
	private String identityNum;
	
	@Column(name="address")
	private String address;
	
	@Column(name="major")
	private String major;
	
	@Column(name="description")
	private String description;
	
//	@Column(name="self_pic")
//	private byte[] selfPic;
//	
	@Column(name="phone")
	private String phone;
	
	@Column(name="school_name")
	private String schoolName;
	
	@Column(name="sex")
	private String sex;
	
	@Column(name = "photo_name")
	private String photoName;
	
	@OneToMany(mappedBy="tutor", fetch = FetchType.EAGER)
    private Collection<Account> tk;
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	  @JoinTable(name = "APPLY", 
	    joinColumns = { @JoinColumn(name = "tutor_id") }, 
	    inverseJoinColumns = {@JoinColumn(name = "post_id") })
	  private Set<Post> post = new HashSet<>();
	
	public Collection<Account> getTk() {
		return tk;
	}

	public void setTk(Collection<Account> tk) {
		this.tk = tk;
	}
	



	public Set<Post> getPost() {
		return post;
	}

	public void setPost(Set<Post> post) {
		this.post = post;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}

	public Tutor() {
		super();
	}

	public int getTutorId() {
		return tutorId;
	}

	public void setTutorId(int tutorId) {
		this.tutorId = tutorId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getIdentityNum() {
		return identityNum;
	}

	public void setIdentityNum(String identityNum) {
		this.identityNum = identityNum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
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
	
	public String getSchoolName()
	{
		return schoolName;
	}
	public void setSchoolName(String schoolName)
	{
		this.schoolName = schoolName;
	}
	public String getSex()
	{
		return sex;
	}
	public void setSex(String sex)
	{
		this.sex = sex;
	}
	

}
