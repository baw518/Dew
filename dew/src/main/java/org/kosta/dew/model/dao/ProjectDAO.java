package org.kosta.dew.model.dao;

import java.util.List;

import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DepartVO;
import org.kosta.dew.model.vo.ProjectVO;

public interface ProjectDAO {

	void registerProject(ProjectVO pvo, DepartVO dvo);

	ProjectVO getProjectContent(String no);

	List<ProjectVO> getProjectList(String pageNo);

	int getTotalPostingCount();

	void deleteProject(int projectNo);

	void deleteDepart(int projectNo);

	void updateProject(ProjectVO pvo, DepartVO dvo);

	void findRegisterComment(CommentVO cvo);

	void joinProject(CommentVO cvo);

	void deleteProjectComment(int commentNo);

	void updateProjectComment(CommentVO cvo);

	List<ProjectVO> findProjectById(String id);

	List<ProjectVO> findJoinProjectById(String id);

	List<ProjectVO> findProcessProjectById(String id);

	CommentVO joinCheck(CommentVO pvo);

	void deleteJoinComment(String commentNo);

	void startProject(String projectNo);

	List<CommentVO> findJoinList(int projectNo);

	void updateHit(String no);

	List<CommentVO> countComment(int projectNo);

	void deleteJoinerById(CommentVO cvo);

	void successProject(String projectNo);

	List<ProjectVO> findSuccessProjectById(String id);

	void updateProgress(ProjectVO pvo);

	List<CommentVO> findJoinListProcess(int projectNo);

	void mansAjax(ProjectVO pvo);

	List<ProjectVO> getReqProjectList(String pageNo);

	void registerReqProject(ProjectVO pvo);

	List<String> findChatRecordByNo(int projectNo);

	void sendChatAjax(ProjectVO pvo);

	void deleteChat(int projectNo);

	void deleteAllChat(String projectNo);

	ProjectVO findProjectByNo(int projectNo);

	void updateReq(ProjectVO pvo);

}