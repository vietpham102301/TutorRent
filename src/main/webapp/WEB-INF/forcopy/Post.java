package ptit.entity;

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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="POST")
public class Post {
	
	@Id
	@GeneratedValue
	@Column(name="post_id")
	private int postId;
	
	@Column(name="description")
	private String description;
	
	@Column(name = "apply_status")
	private boolean applystatus;
	
	@OneToOne
	@JoinColumn(name = "subject_id", nullable = false)
	private Subject subject;
	 @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	  @JoinTable(name = "APPLY", 
	    joinColumns = { @JoinColumn(name = "post_id") }, 
	    inverseJoinColumns = {@JoinColumn(name = "tutor_id") })
	  private Set<Tutor> tutor = new HashSet<>();
	public boolean isApplystatus() {
		return applystatus;
	}

	public void setApplystatus(boolean applystatus) {
		this.applystatus = applystatus;
	}

	@ManyToOne
    @JoinColumn(name="student_id", nullable=false)
    private Student student;
	
	

	public Set<Tutor> getTutor() {
		return tutor;
	}

	public void setTutor(Set<Tutor> tutor) {
		this.tutor = tutor;
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

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
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

	@Column(name="num_of_lesson")
	private int numOfLesson;
	
	@Column(name="fee")
	private Float fee;
}
