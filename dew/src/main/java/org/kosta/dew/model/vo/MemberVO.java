package org.kosta.dew.model.vo;

public class MemberVO {
	private String id;
	private String memberName;
	private String memberPassword;
	private String birthDate;
	private String memberLevel;
	private int score;
	private int point;
	private String passwordQuestion;
	private String passwordAnswer;
	public MemberVO() {
		super();
	}
	public MemberVO(String id, String memberName, String memberPassword,
			String birthDate, String memberLevel, int score, int point,
			String passwordQuestion, String passwordAnswer) {
		super();
		this.id = id;
		this.memberName = memberName;
		this.memberPassword = memberPassword;
		this.birthDate = birthDate;
		this.memberLevel = memberLevel;
		this.score = score;
		this.point = point;
		this.passwordQuestion = passwordQuestion;
		this.passwordAnswer = passwordAnswer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getMemberLevel() {
		return memberLevel;
	}
	public void setMemberLevel(String memberLevel) {
		this.memberLevel = memberLevel;
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
	public String getPasswordQuestion() {
		return passwordQuestion;
	}
	public void setPasswordQuestion(String passwordQuestion) {
		this.passwordQuestion = passwordQuestion;
	}
	public String getPasswordAnswer() {
		return passwordAnswer;
	}
	public void setPasswordAnswer(String passwordAnswer) {
		this.passwordAnswer = passwordAnswer;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", memberName=" + memberName
				+ ", memberPassword=" + memberPassword + ", birthDate="
				+ birthDate + ", memberLevel=" + memberLevel + ", score="
				+ score + ", point=" + point + ", passwordQuestion="
				+ passwordQuestion + ", passwordAnswer=" + passwordAnswer + "]";
	}
	
}
