package ptit.entity;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="APPLY")
public class Apply {
	
	@EmbeddedId
	private CompositeKeyForApply key;

	public CompositeKeyForApply getKey() {
		return key;
	}

	public void setKey(CompositeKeyForApply key) {
		this.key = key;
	}

	
	

	
}
