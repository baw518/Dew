package org.kosta.dew.model.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DepartVO;
import org.kosta.dew.model.vo.ProjectListVO;
import org.kosta.dew.model.vo.ProjectManageVO;
import org.kosta.dew.model.vo.ProjectVO;
import org.springframework.web.multipart.MultipartFile;

public interface ProjectService {

	void writeProject(ProjectVO pvo, DepartVO dvo);

	ProjectVO getProjectContent(String projectNo);

	List<ProjectVO> getProjectList(String pageNo);

	int getTotalPostingCount();

	void deleteProject(int projectNo,String FilePath);

	void deleteDepart(int projectNo);

	ProjectListVO makeProjectListVO(String pageNo);

	void updateProject(ProjectVO pvo, DepartVO dvo);

	void findRegisterComment(CommentVO cvo);

	void joinProject(CommentVO cvo);

	void deleteProjectComment(int commentNo);

	void updateProjectComment(CommentVO cvo);

	List<ProjectVO> findProjectById(String id);

	boolean joinCheck(CommentVO cvo);

	void deleteJoinComment(String commentNo);

	void startProject(String projectNo);

	void deleteJoinerById(String id,String projectNo);

	void successProject(String projectNo);

	void updateProgress(ProjectVO pvo);

	List<CommentVO> findJoinListProcess(int projectNo);

	void mansAjax(ProjectVO pvo);

	ProjectListVO makeReqProjectListVO(String pageNo);

	void writeReqProject(ProjectVO pvo);

	List<String> findChatRecordByNo(int projectNo);

	void sendChatAjax(ProjectVO pvo);

	void deleteAllChat(String projectNo);

	ProjectVO findProjectByNo(int projectNo);

	void deleteFile(String string);

	void projectRequestUpdate(ProjectVO pvo, MultipartFile picture, String path);

	ProjectManageVO projectManageView(String id);

	void registerReqProject(ProjectVO pvo, MultipartFile picture, String path);

	ProjectVO projectView(String projectNo, HttpServletRequest request,
			HttpServletResponse response, Cookie[] cookies);

	
}
