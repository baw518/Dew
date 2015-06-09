package org.kosta.dew.model.vo;

public class MemberVO {
	private String id;
	private String password;
	private String birthday;
	private int userType;
	private int score;
	private int point;
	private String question;
	private String answer;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public MemberVO(String id, String password, String birthday, int userType,
			int score, int point, String question, String answer) {
		super();
		this.id = id;
		this.password = password;
		this.birthday = birthday;
		this.userType = userType;
		this.score = score;
		this.point = point;
		this.question = question;
		this.answer = answer;
	}
	public MemberVO() {
		super();
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", birthday="
				+ birthday + ", userType=" + userType + ", score=" + score
				+ ", point=" + point + ", question=" + question + ", answer="
				+ answer + "]";
	}
	
	
}
