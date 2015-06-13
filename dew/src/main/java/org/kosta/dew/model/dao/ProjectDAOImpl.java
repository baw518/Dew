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
		pvo.setId("관리자");
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
	public CommentVO findRegisterComment(CommentVO cvo) {
		sqlSessionTemplate.insert("project.registerProComment",cvo);
		cvo=sqlSessionTemplate.selectOne("project.findProCommentByNo",cvo.getCommentNo());
		return cvo;
	}

}
