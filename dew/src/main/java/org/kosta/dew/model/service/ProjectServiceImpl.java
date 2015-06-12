package org.kosta.dew.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.dao.ProjectDAO;
import org.kosta.dew.model.vo.DepartVO;
import org.kosta.dew.model.vo.PagingBean;
import org.kosta.dew.model.vo.ProjectListVO;
import org.kosta.dew.model.vo.ProjectVO;
import org.springframework.stereotype.Service;
@Service
public class ProjectServiceImpl implements ProjectService{
	@Resource
	private ProjectDAO projectDAO;

	@Override
	public void registerProject(ProjectVO pvo,DepartVO dvo){
		projectDAO.registerProject(pvo, dvo);
	}
	@Override
	public ProjectVO getProjectContent(String no){
		return projectDAO.getProjectContent(no);
	}
	@Override
	public List<ProjectVO> getProjectList(String pageNo) {
		return projectDAO.getProjectList(pageNo);
	}
	@Override
	public int getTotalPostingCount(){
		return projectDAO.getTotalPostingCount();
	}
	@Override
	public void deleteProject(String projectNo) {
		projectDAO.deleteProject(projectNo);
	}
	@Override
	public void deleteDepart(String projectNo) {
		projectDAO.deleteDepart(projectNo);
	}
	

	@Override
	public ProjectListVO makeProjectListVO(String pageNo){
		int pn=1;
		if(pageNo!=null)
			pn=Integer.parseInt(pageNo);
		 List<ProjectVO> plist = projectDAO.getProjectList(Integer.toString(pn));
		 int total=projectDAO.getTotalPostingCount();
		 PagingBean pagingBean=new PagingBean(total,pn);
		 return new ProjectListVO(plist,pagingBean);
	}

}
