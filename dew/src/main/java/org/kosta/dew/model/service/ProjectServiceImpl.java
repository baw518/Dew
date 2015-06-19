package org.kosta.dew.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.dao.ProjectDAO;
import org.kosta.dew.model.vo.CommentVO;
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
		projectDAO.updateHit(no);
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
	
	@Override
	public void updateProject(ProjectVO pvo, DepartVO dvo) {
		projectDAO.updateProject(pvo,dvo);
	}
	@Override
	public void findRegisterComment(CommentVO cvo) {
		projectDAO.findRegisterComment(cvo);
	}
	@Override
	public void joinProject(CommentVO cvo) {
		projectDAO.joinProject(cvo);
	}
	@Override
	public void deleteProjectComment(int commentNo) {
		projectDAO.deleteProjectComment(commentNo);
	}
	@Override
	public void updateProjectComment(CommentVO cvo) {
		projectDAO.updateProjectComment(cvo);
	}
	@Override
	public List<ProjectVO> findProjectById(String id) {
		List<ProjectVO> pvo=projectDAO.findProjectById(id);
		if(pvo.size()!=0){
		for(int i=0;i<pvo.size();i++){
			pvo.get(i).setCommentVO(projectDAO.findJoinList(pvo.get(i).getProjectNo()));
			}
		}
		return pvo;
	}
	@Override
	public List<ProjectVO> findJoinProjectById(String id) {
		return projectDAO.findJoinProjectById(id);
	}
	@Override
	public List<ProjectVO> findProcessProjectById(String id) {
		return projectDAO.findProcessProjectById(id);
	}
	@Override
	public boolean joinCheck(CommentVO cvo) {
		boolean flag=false;
		System.out.println(projectDAO.joinCheck(cvo));
		if(projectDAO.joinCheck(cvo)!=null)
			flag=true;
		return  flag;
	}
	@Override
	public void deleteJoinComment(String commentNo) {
		projectDAO.deleteJoinComment(commentNo);
	}
	@Override
	public void startProject(String projectNo) {
		projectDAO.startProject(projectNo);
	}
	@Override
	public ProjectVO getProjectContentNohit(String projectNo) {
		return projectDAO.getProjectContent(projectNo);
	}
	@Override
	public List<CommentVO> countComment(int projectNo) {
		return projectDAO.countComment(projectNo);
	}
	@Override
	public void deleteJoinerById(String id,String projectNo) {
		CommentVO cvo=new CommentVO();
		cvo.setBoardNo(Integer.parseInt(projectNo));
		cvo.setId(id);
		projectDAO.deleteJoinerById(cvo);
	}
	@Override
	public void successProject(String projectNo) {
		projectDAO.successProject(projectNo);
	}
	@Override
	public List<ProjectVO> findSuccessProjectById(String id) {
		return projectDAO.findSuccessProjectById(id);
	}

}
