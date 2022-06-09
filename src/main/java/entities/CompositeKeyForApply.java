package entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.GeneratedValue;

@Embeddable
public class CompositeKeyForApply implements Serializable{
	/**
	 * 
	 */
	//private static final long serialVersionUID = 1L;

	@Column(name="post_id", nullable=false)
	@GeneratedValue
	private int postId;
	
	@GeneratedValue
	@Column(name="tutor_id", nullable=false)
	private int tutorId;

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public int getTutorId() {
		return tutorId;
	}

	public void setTutorId(int tutorId) {
		this.tutorId = tutorId;
	}
}

