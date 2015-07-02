package org.kosta.dew.model.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kosta.dew.model.dao.ProjectDAO;
import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DepartVO;
import org.kosta.dew.model.vo.PagingBean;
import org.kosta.dew.model.vo.ProjectListVO;
import org.kosta.dew.model.vo.ProjectManageVO;
import org.kosta.dew.model.vo.ProjectVO;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Resource
	private ProjectDAO projectDAO;

	@Override
	public void writeProject(ProjectVO pvo, DepartVO dvo) {
		projectDAO.registerProject(pvo, dvo);
	}

	@Override
	public ProjectVO getProjectContent(String projectNo) {
		projectDAO.updateHit(projectNo);
		return projectDAO.getProjectContent(projectNo);
	}



	@Override
	public List<ProjectVO> getProjectList(String pageNo) {
		return projectDAO.getProjectList(pageNo);
	}

	@Override
	public int getTotalPostingCount() {
		return projectDAO.getTotalPostingCount();
	}

	@Override
	public void deleteProject(int projectNo,String FilePath) {
		deleteFile(FilePath);
		projectDAO.deleteDepart(projectNo);
		projectDAO.deleteProject(projectNo);
	}

	@Override
	public void deleteDepart(int projectNo) {
		projectDAO.deleteDepart(projectNo);
	}

	@Override
	public ProjectListVO makeProjectListVO(String pageNo) {
		int pn = 1;
		if (pageNo != null)
			pn = Integer.parseInt(pageNo);
		List<ProjectVO> plist = projectDAO.getProjectList(Integer.toString(pn));
		int total = projectDAO.getTotalPostingCount();
		PagingBean pagingBean = new PagingBean(total, pn);
		ProjectListVO plvo=new ProjectListVO(plist, pagingBean);
		for(int i=0;i<plvo.getList().size();i++)
			plvo.getList().get(i).setCommentVO(projectDAO.countComment(plvo.getList().get(i).getProjectNo()));
		return plvo;
	}

	@Override
	public void updateProject(ProjectVO pvo, DepartVO dvo) {
		projectDAO.updateProject(pvo, dvo);
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
		List<ProjectVO> pvo = projectDAO.findProjectById(id);
		if (pvo.size() != 0) {
			for (int i = 0; i < pvo.size(); i++) {
				pvo.get(i).setCommentVO(
						projectDAO.findJoinList(pvo.get(i).getProjectNo()));
			}
		}
		return pvo;
	}

	@Override
	public boolean joinCheck(CommentVO cvo) {
		boolean flag = false;
		if (projectDAO.joinCheck(cvo) != null)
			flag = true;
		return flag;
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
	public void deleteJoinerById(String id, String projectNo) {
		CommentVO cvo = new CommentVO();
		cvo.setBoardNo(Integer.parseInt(projectNo));
		cvo.setId(id);
		projectDAO.deleteJoinerById(cvo);
	}

	@Override
	public void successProject(String projectNo) {
		projectDAO.successProject(projectNo);
	}

	@Override
	public void updateProgress(ProjectVO pvo) {
		projectDAO.updateProgress(pvo);
	}

	@Override
	public List<CommentVO> findJoinListProcess(int projectNo) {
		return projectDAO.findJoinListProcess(projectNo);
	}

	@Override
	public void mansAjax(ProjectVO pvo) {
		projectDAO.mansAjax(pvo);
	}

	@Override
	public ProjectListVO makeReqProjectListVO(String pageNo) {
		int pn = 1;
		if (pageNo != null)
			pn = Integer.parseInt(pageNo);
		List<ProjectVO> plist = projectDAO.getReqProjectList(Integer
				.toString(pn));
		int total = projectDAO.getTotalPostingCount();
		PagingBean pagingBean = new PagingBean(total, pn);
		return new ProjectListVO(plist, pagingBean);
	}

	@Override
	public void writeReqProject(ProjectVO pvo) {
		projectDAO.registerReqProject(pvo);
	}

	@Override
	public List<String> findChatRecordByNo(int projectNo) {
		List<String> list = projectDAO.findChatRecordByNo(projectNo);
		if (list.size() == 0) {
			ProjectVO pvo = new ProjectVO();
			pvo.setProjectNo(projectNo);
			pvo.setContent("채팅방입니다");
			projectDAO.sendChatAjax(pvo);
			pvo.setContent("접속됨..");
			projectDAO.sendChatAjax(pvo);
			list = projectDAO.findChatRecordByNo(projectNo);
		} else if (list.size() >= 16) {
			projectDAO.deleteChat(projectNo);
		}
		return list;
	}

	@Override
	public void sendChatAjax(ProjectVO pvo) {
		projectDAO.sendChatAjax(pvo);
	}

	@Override
	public void deleteAllChat(String projectNo) {
		projectDAO.deleteAllChat(projectNo);
	}

	@Override
	public ProjectVO findProjectByNo(int projectNo) {
		return projectDAO.findProjectByNo(projectNo);
	}

	@Override
	public void deleteFile(String filePath) {
		File file = new File(filePath);
		file.delete();
	}

	@Override
	public void projectRequestUpdate(ProjectVO pvo, MultipartFile picture,
			String path) {
		deleteFile(path + "img/" + pvo.getDeadline());
		if (picture.getOriginalFilename() != "") {
			String fileName;
			pvo.setDeadline(picture.getOriginalFilename());
			fileName = picture.getOriginalFilename();
			try {
				picture.transferTo(new File(path + "img/" + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			pvo.setDeadline("noImage");
		}
		projectDAO.updateReq(pvo);
	}

	@Override
	public ProjectManageVO projectManageView(String id) {
		ProjectManageVO pmvo = new ProjectManageVO();
		pmvo.setCreatingProject(findProjectById(id));
		pmvo.setJoinProject(projectDAO.findJoinProjectById(id));
		pmvo.setProcessingProject(projectDAO.findProcessProjectById(id));
		pmvo.setSuccessProject(projectDAO.findSuccessProjectById(id));
		return pmvo;
	}

	@Override
	public void registerReqProject(ProjectVO pvo, MultipartFile picture,
			String path) {
		String fileName;
		if (picture.getOriginalFilename() != "") {
			pvo.setDeadline(picture.getOriginalFilename());
			fileName = picture.getOriginalFilename();
			try {
				picture.transferTo(new File(path + "img/" + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			pvo.setDeadline("noImage");
		}
		pvo.setAchieve("의뢰");
		projectDAO.registerReqProject(pvo);
	}

	@Override
	public ProjectVO projectView(String projectNo, HttpServletRequest request,
			HttpServletResponse response, Cookie[] cookies) {
		ProjectVO pvo = null;
		if (cookies == null || cookies.length == 0) {
			response.addCookie(new Cookie("hitcookie", "|" + projectNo + "|"));
			projectDAO.updateHit(projectNo);
			pvo = projectDAO.getProjectContent(projectNo);
		} else {
			Cookie cookie = null;
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("hitcookie")) {
					cookie = cookies[i];
					break;
				}
			}
			if (cookie == null) {
				response.addCookie(new Cookie("hitcookie", "|" + projectNo
						+ "|"));
				projectDAO.updateHit(projectNo);
				pvo = projectDAO.getProjectContent(projectNo);
			} else {
				String value = cookie.getValue();
				if (value.indexOf("|" + projectNo + "|") != -1) {
					pvo = projectDAO.getProjectContent(projectNo);
				} else {
					projectDAO.updateHit(projectNo);
					pvo = projectDAO.getProjectContent(projectNo);
					value += "|" + projectNo + "|";
					response.addCookie(new Cookie("hitcookie", value));
				}
			}
		}
		return pvo;
	}

}
