package entities;

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
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;





@Entity
@Table(name="POST")
public class Post {
	
	@Id
	@GeneratedValue
	@Column(name="post_id")
	private int postId;
	
	@OneToOne
	@JoinColumn(name = "subject_id", nullable = false)
	private Subject subject;
	
	@Column(name = "apply_status")
	private boolean applystatus;
	
	@Column(name="description")
	private String description;
	
	@Column(name="num_of_lesson")
	private int numOfLesson;
	
	@Column(name="fee")
	private Float fee;
	
	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	  @JoinTable(name = "APPLY", 
	    joinColumns = { @JoinColumn(name = "post_id") }, 
	    inverseJoinColumns = {@JoinColumn(name = "tutor_id") })
	  private Set<Tutor> tutor = new HashSet<>();
	
	@ManyToOne
    @JoinColumn(name="student_id", nullable=false)
    private Student student;
	
	public Post() {
		super();
	}
	public boolean isApplystatus() {
		return applystatus;
	}

	public Post(int postId, int subjectId, String description, int numOfLesson, Float fee) {
		super();
		this.postId = postId;
		//this.subjectId = subjectId;
		this.description = description;
		this.numOfLesson = numOfLesson;
		this.fee = fee;
	}
	


	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public Subject getSubject() {
		return subject;
	}
	
	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}
	



	public Set<Tutor> getTutor() {
		return tutor;
	}
	public void setTutor(Set<Tutor> tutor) {
		this.tutor = tutor;
	}
	public void setApplystatus(boolean applystatus) {
		this.applystatus = applystatus;
	}
	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getNumOfLesson() {
		return numOfLesson;
	}

	public void setNumOfLesson(int numOfLesson) {
		this.numOfLesson = numOfLesson;
	}

	public Float getFee() {
		return fee;
	}

	public void setFee(Float fee) {
		this.fee = fee;
	}
	
	public void setApplyStatus(boolean a) {
		this.applystatus = a;
	}


}
