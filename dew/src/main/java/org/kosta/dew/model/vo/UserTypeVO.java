package org.kosta.dew.model.vo;

public class UserTypeVO {
private int jobNo;
private String JobName;
public String getJobName() {
	return JobName;
}
public UserTypeVO() {
	super();
	// TODO Auto-generated constructor stub
}
public UserTypeVO(int jobNo, String jobName) {
	super();
	this.jobNo = jobNo;
	JobName = jobName;
}
public int getJobNo() {
	return jobNo;
}
public void setJobNo(int jobNo) {
	this.jobNo = jobNo;
}
public void setJobName(String jobName) {
	JobName = jobName;
}
@Override
public String toString() {
	return "UserTypeVO [jobNo=" + jobNo + ", JobName=" + JobName + "]";
}


}
