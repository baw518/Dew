package org.kosta.dew.model.service;

import java.util.List;

import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DepartVO;
import org.kosta.dew.model.vo.ProjectListVO;
import org.kosta.dew.model.vo.ProjectVO;

public interface ProjectService {

	void writeProject(ProjectVO pvo, DepartVO dvo);

	ProjectVO getProjectContent(String projectNo);

	List<ProjectVO> getProjectList(String pageNo);

	int getTotalPostingCount();

	void deleteProject(int projectNo);

	void deleteDepart(int projectNo);

	ProjectListVO makeProjectListVO(String pageNo);

	void updateProject(ProjectVO pvo, DepartVO dvo);

	void findRegisterComment(CommentVO cvo);

	void joinProject(CommentVO cvo);

	void deleteProjectComment(int commentNo);

	void updateProjectComment(CommentVO cvo);

	List<ProjectVO> findProjectById(String id);

	List<ProjectVO> findJoinProjectById(String id);

	List<ProjectVO> findProcessProjectById(String id);

	boolean joinCheck(CommentVO pvo);

	void deleteJoinComment(String commentNo);

	void startProject(String projectNo);

	ProjectVO getProjectContentNohit(String projectNo);

	List<CommentVO> countComment(int projectNo);

	void deleteJoinerById(String id,String projectNo);

	void successProject(String projectNo);

	List<ProjectVO> findSuccessProjectById(String id);

	void updateProgress(ProjectVO pvo);

	List<CommentVO> findJoinListProcess(int projectNo);

	void mansAjax(ProjectVO pvo);

	ProjectListVO makeReqProjectListVO(String pageNo);

	void writeReqProject(ProjectVO pvo);

	List<String> findChatRecordByNo(int projectNo);

	void sendChatAjax(ProjectVO pvo);

	void deleteAllChat(String projectNo);

	ProjectVO findProjectByNo(int projectNo);


	
}
