package object;

public class PostInfor {
	
	private int postId;
	
	private String subjectName;
	
	private String subjectLevel;
	
	private String description;
	
	private int numOfLesson;
	
	private String address;
	
	private String studentGender;
	
	private float fee;
	
	private int checkApply=0;
	
	

	public PostInfor(int postId, String subjectName, String subjectLevel, String description,int numOfLesson, String address, String studentGender,
			float fee
			) {
		super();
		this.postId = postId;
		this.subjectName = subjectName;
		this.numOfLesson = numOfLesson;
		this.description = description;
		this.studentGender = studentGender;
		this.address = address;
		this.subjectLevel = subjectLevel;
		this.fee = fee;
	}

	public PostInfor() {
		super();
	}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public int getNumOfLesson() {
		return numOfLesson;
	}

	public void setNumOfLesson(int numOfLesson) {
		this.numOfLesson = numOfLesson;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStudentGender() {
		return studentGender;
	}

	public void setStudentGender(String studentGender) {
		this.studentGender = studentGender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	public String getSubjectLevel()
	{
		return subjectLevel;
	}
	
	public void setSubjectLevel(String subjectLevel)
	{
		this.subjectLevel = subjectLevel;
	}
	
	public void setFee(float fee)
	{
		this.fee = fee;
	}
	
	public float getFee()
	{
		return fee;
	}
	
	public int getCheckApply()
	{
		return checkApply;
	}
	
	public void setCheckApply(int a)
	{
		this.checkApply = a;
	}
	
}
