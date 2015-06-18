package org.kosta.dew.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DepartVO;
import org.kosta.dew.model.vo.ProjectVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ProjectDAOImpl implements ProjectDAO{
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void registerProject(ProjectVO pvo,DepartVO dvo){
		String[] subject=dvo.getSubject().split(",");
		String[] mans=dvo.getMans().split(",");
		pvo.setAchieve("모집중");
		sqlSessionTemplate.insert("project.insertProject",pvo);
		for(int i=0;i<subject.length;i++){
			DepartVO dvoSpl=new DepartVO(subject[i], mans[i],pvo.getProjectNo());
			sqlSessionTemplate.insert("project.insertDepart",dvoSpl);
		}
	}
	@Override
	public ProjectVO getProjectContent(String no){
		ProjectVO pvo=sqlSessionTemplate.selectOne("project.findProjectByNo",no);
		List<DepartVO> dvo=sqlSessionTemplate.selectList("project.findDepartByNo",no);
		List<CommentVO> cvo=sqlSessionTemplate.selectList("project.getProComment",no);
		pvo.setDepartVO(dvo);
		pvo.setCommentVO(cvo);
		return pvo;
	}
	@Override
	public List<ProjectVO> getProjectList(String pageNo) {
		 List<ProjectVO> plist=sqlSessionTemplate.selectList("project.getProjectList",pageNo);
		 return plist;
	}
	@Override
	public int getTotalPostingCount(){
		return sqlSessionTemplate.selectOne("project.getTotalPostingCountProject");
	}
	@Override
	public void deleteProject(String projectNo) {
		sqlSessionTemplate.delete("project.deleteProjectCommentByProNo",projectNo);
		sqlSessionTemplate.delete("project.deleteProject",projectNo);
	}
	@Override
	public void deleteDepart(String projectNo) {
		sqlSessionTemplate.delete("project.deleteDepart",projectNo);
	}
	@Override
	public void updateProject(ProjectVO pvo, DepartVO dvo) {
		String[] subject=dvo.getSubject().split(",");
		String[] mans=dvo.getMans().split(",");
		sqlSessionTemplate.update("project.updateProject",pvo);
		for(int i=0;i<subject.length;i++){
			DepartVO dvoSpl=new DepartVO(subject[i], mans[i],pvo.getProjectNo());
			sqlSessionTemplate.update("project.updateDepart",dvoSpl);
		}
	}
	@Override
	public void findRegisterComment(CommentVO cvo) {
		sqlSessionTemplate.insert("project.registerProComment",cvo);
		cvo=sqlSessionTemplate.selectOne("project.findProCommentByNo",cvo.getCommentNo());
	}
	@Override
	public void joinProject(CommentVO cvo) {
		sqlSessionTemplate.insert("project.joinProject",cvo);
	}
	@Override
	public void deleteProjectComment(int commentNo) {
		sqlSessionTemplate.delete("project.deleteProjectComment",commentNo);
	}
	@Override
	public void updateProjectComment(CommentVO cvo) {
		sqlSessionTemplate.update("project.updateProjectComment",cvo);
	}
	@Override
	public List<ProjectVO> findProjectById(String id) {
		return sqlSessionTemplate.selectList("project.findProjectById",id);
	}
	@Override
	public List<ProjectVO> findJoinProjectById(String id) {
		return sqlSessionTemplate.selectList("project.findJoinProjectById",id);
	}
	@Override
	public List<ProjectVO> findProcessProjectById(String id) {
		return sqlSessionTemplate.selectList("project.findProcessProjectById",id);
	}
	@Override
	public CommentVO joinCheck(CommentVO cvo) {
		return sqlSessionTemplate.selectOne("project.joinCheck",cvo);
	}
	@Override
	public void deleteJoinComment(String commentNo) {
		sqlSessionTemplate.delete("project.deleteJoinComment",commentNo);
	}
	@Override
	public void startProject(String projectNo) {
		sqlSessionTemplate.update("project.startProject",projectNo);
	}
	@Override
	public List<CommentVO> findJoinList(int projectNo) {
		return sqlSessionTemplate.selectList("project.findJoinList",projectNo);
	}
	@Override
	public void updateHit(String no) {
		sqlSessionTemplate.update("project.updateHit",no);
	}
	@Override
	public List<CommentVO> countComment(int projectNo) {
		return sqlSessionTemplate.selectList("project.getProComment",projectNo);
	}
	@Override
	public void deleteJoinerById(CommentVO cvo) {
		sqlSessionTemplate.delete("project.deleteJoinerById",cvo);
	}

}
