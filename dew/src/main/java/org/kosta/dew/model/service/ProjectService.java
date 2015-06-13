package org.kosta.dew.model.service;

import java.util.List;

import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DepartVO;
import org.kosta.dew.model.vo.ProjectListVO;
import org.kosta.dew.model.vo.ProjectVO;

public interface ProjectService {

	void registerProject(ProjectVO pvo, DepartVO dvo);

	ProjectVO getProjectContent(String no);

	List<ProjectVO> getProjectList(String pageNo);

	int getTotalPostingCount();

	void deleteProject(String projectNo);

	void deleteDepart(String projectNo);

	ProjectListVO makeProjectListVO(String pageNo);

	void updateProject(ProjectVO pvo, DepartVO dvo);

	CommentVO findRegisterComment(CommentVO cvo);

	
}
