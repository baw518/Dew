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

	void deleteProject(String projectNo);

	void deleteDepart(String projectNo);

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


}