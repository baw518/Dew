package org.kosta.dew.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kosta.dew.model.service.ProjectService;
import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DepartVO;
import org.kosta.dew.model.vo.MemberVO;
import org.kosta.dew.model.vo.ProjectListVO;
import org.kosta.dew.model.vo.ProjectManageVO;
import org.kosta.dew.model.vo.ProjectVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProjectController {
	@Resource
	private ProjectService projectService;
	   /**
	    * 프로젝트 의뢰화면으로 이동합니다
	    * @return
	    */
	   @RequestMapping("project_projectRequestForm.do")
		public ModelAndView projectRequestView(){
			return new ModelAndView("projectView_projectRequest");
		}
	   /**
	    * 세션으로 받아온 아이디로 포함되어있는 프로젝트리스틀 찾아서
	    * ProjectManageVO로 생성하여 프로젝트 관리화면으로 이동합니다.
	    * @param request
	    * @return
	    */
	   @RequestMapping("project_main.do")
		public ModelAndView projectManageView(HttpServletRequest request){
		   HttpSession session=request.getSession(false);
		   MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		   if(mvo!=null){
		   String id=mvo.getId();
		   ProjectManageVO pmvo=new ProjectManageVO();
		   pmvo.setCreatingProject(projectService.findProjectById(id));
		   pmvo.setJoinProject(projectService.findJoinProjectById(id));
		   pmvo.setProcessingProject(projectService.findProcessProjectById(id));
		   pmvo.setSuccessProject(projectService.findSuccessProjectById(id));
			return new ModelAndView("projectView_projectManage","pmvo",pmvo);
		   }
		   return new ModelAndView("redirect:project_listView.do");
	}
	   /**
		 * 프로젝트 의뢰 화면으로 이동합니다
		 * @return
		 */
	   @RequestMapping("project_reqRegisterForm.do")
	   public String reqProjectRegisterShow(){
		   return "projectView_projectReqRegister";
	   }
	   /**
		 * 프로젝트 생성 화면으로 이동합니다
		 * @return
		 */
	   @RequestMapping("project_registerForm.do")
	   public String projectRegisterShow(){
		   return "projectView_projectRegister";
	   }
	   /**
	    * 프로젝트생성화면에서 pvo를 받아와 insert시키고 redirect로 프로젝트내용화면으로 이동합니다.
	    * @param pvo
	    * @param dvo
	    * @param request
	    * @return
	    */
		@RequestMapping("project_register.do")
		public ModelAndView registerProject(ProjectVO pvo, DepartVO dvo,HttpServletRequest request){
			HttpSession session=request.getSession(false);
			MemberVO mvo=(MemberVO) session.getAttribute("mvo");
			pvo.setId(mvo.getId());
			projectService.writeProject(pvo, dvo);
			return new ModelAndView("redirect:project_View.do?projectNo="+pvo.getProjectNo());
	}
		 /**
		    * 프로젝트의뢰화면에서 pvo를 받아와 insert시키고 redirect로 프로젝트내용화면으로 이동합니다.
		    * @param pvo
		    * @param dvo
		    * @param request
		    * @return
		    */
		    @Resource(name="uploadPath")
		    private String path;
			@RequestMapping("project_reqRegister.do")
			public ModelAndView registerReqProject(ProjectVO pvo,MultipartFile picture,HttpServletRequest request){
				HttpSession session=request.getSession(false);
				MemberVO mvo=(MemberVO) session.getAttribute("mvo");
				pvo.setId(mvo.getId());
				String fileName;
				if(picture.getOriginalFilename()!=""){
					pvo.setDeadline(picture.getOriginalFilename());
					fileName=picture.getOriginalFilename();
					try{
						picture.transferTo(new File(path+"img/"+fileName));
					}catch(Exception e){
						e.printStackTrace();
					}
				}else{
					pvo.setDeadline("noImage");
				}
				pvo.setAchieve("의뢰");
				projectService.writeReqProject(pvo);
				return new ModelAndView("redirect:project_View.do?projectNo="+pvo.getProjectNo());
		}
		/**
		 * projectNO로 찾은 프로젝트로 내용을 보여줍니다.
		 * 쿠키로 조회수를 제어합니다.
		 * @param projectNo
		 * @param request
		 * @param response
		 * @return
		 */
	@RequestMapping("project_View.do")
	public ModelAndView projectView(String projectNo,HttpServletRequest request,HttpServletResponse response){
		ProjectVO pvo=null;
		Cookie [] cookies=request.getCookies();
		if(cookies==null||cookies.length==0){
			response.addCookie(new Cookie("hitcookie","|"+projectNo+"|"));
			pvo = projectService.getProjectContent(projectNo);
		}
		else{
			Cookie cookie=null;
			for(int i=0;i<cookies.length;i++){
				if(cookies[i].getName().equals("hitcookie")){
					cookie=cookies[i];
					break;
				}
			}
						if(cookie==null){
							response.addCookie(new Cookie("hitcookie","|"+projectNo+"|"));
							pvo = projectService.getProjectContent(projectNo);
						}
						else{
							String value=cookie.getValue();
							if(value.indexOf("|"+projectNo+"|")!=-1){
								pvo = projectService.getProjectContentNohit(projectNo);
							}
							else{
								pvo = projectService.getProjectContent(projectNo);
								value+="|"+projectNo+"|";
								response.addCookie(new Cookie("hitcookie",value));
							}
						}
		}
		return new ModelAndView("projectView_projectView","pvo",pvo);
	}
	/**
	 * 프로젝트 참여화면의 프로젝트리스트들을 보여줍니다.
	 * pageNo를 받아와 paging bean으로 보여주는 페이지를 제어합니다.
	 * @param pageNo
	 * @return
	 */
	@RequestMapping("project_listView.do")
	public ModelAndView ProjectList(String pageNo){
		ProjectListVO plvo=projectService.makeProjectListVO(pageNo);
		for(int i=0;i<plvo.getList().size();i++)
			plvo.getList().get(i).setCommentVO(projectService.countComment(plvo.getList().get(i).getProjectNo()));
		return new ModelAndView("projectView_projectList","plvo",plvo);
	}
	/**
	 * projectNo를 받아와 프로젝트 수정화면을 보여줍니다.
	 * @param projectNo
	 * @return
	 */
	@RequestMapping("project_updateForm.do")
	public ModelAndView updateProjectForm(String projectNo){
		ProjectVO pvo=projectService.getProjectContent(projectNo);
		return new ModelAndView("projectView_projectUpdate","pvo",pvo);
	}
	/**
	 * 수정할 데이터를 받아와 DB를 update시킵니다.
	 * @param pvo
	 * @param dvo
	 * @return
	 */
	@RequestMapping("project_update.do")
	public ModelAndView updateProject(ProjectVO pvo, DepartVO dvo){
		projectService.updateProject(pvo,dvo);
		return new ModelAndView("redirect:project_View.do?projectNo="+pvo.getProjectNo());
	}
	/**
	 * projectNo를 받아와 프로젝트를 삭제합니다.
	 * 프로젝트 관리화면에서 지울시에는 manage가 true로 들어와 프로젝트관리화면으로 리턴됩니다.
	 * @param projectNo
	 * @param manage
	 * @return
	 */
	@RequestMapping("project_delete.do")
	public ModelAndView deleteProject(int projectNo,boolean manage){
		String delPath="redirect:project_listView.do";
		if(manage==true)
			delPath="redirect:project_main.do";
		ProjectVO pvo=projectService.findProjectByNo(projectNo);
		File file=new File(path+"img/"+pvo.getDeadline());
		file.delete();
		projectService.deleteDepart(projectNo);
		projectService.deleteProject(projectNo);
		return new ModelAndView(delPath);
	}
	/**
	 * 프로젝트내용화면에서 댓글을 작성합니다.
	 * projectNo와 댓글내용을 받아와 DB에 insert시킵니다.
	 * @param projectNo
	 * @param content
	 * @param request
	 * @return
	 */
	@RequestMapping("registerProjectComment.do")
	public ModelAndView findAndRegisterProjectComment(String projectNo,String content,HttpServletRequest request){
		HttpSession session=request.getSession(false);
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		projectService.findRegisterComment(new CommentVO(Integer.parseInt(projectNo),mvo.getId(),content));
		return new ModelAndView("redirect:project_View.do?projectNo="+projectNo);
	}
	/**
	 * Ajax로 받아온 데이터들을 CommentVO의 형태로 DB에 insert 시킵니다.
	 * boolean joinCheck(CommentVO)메서드로 이미 참여신청한 회원인지 확인합니다.
	 * @param projectNo
	 * @param joinContent
	 * @param projectSub
	 * @param request
	 * @return
	 */
	@RequestMapping("joinProjectAjax.do")
	@ResponseBody
	public boolean joinProjectAjax(String projectNo,String joinContent,String projectSub,HttpServletRequest request){
		HttpSession session=request.getSession(false);
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		String id=mvo.getId();
		CommentVO cvo=new CommentVO();
		cvo.setBoardNo(Integer.parseInt(projectNo));
		cvo.setId(id);
		boolean flag=projectService.joinCheck(cvo);
		if(flag==false){
			cvo.setBoardNo(Integer.parseInt(projectNo));
			cvo.setContent(joinContent);
			cvo.setProjectSub(projectSub);
			projectService.joinProject(cvo);
		}
		return flag;
	}
	/**
	 * 댓글 CommentVO를 받아와 DB를 수정합니다.
	 * @param cvo
	 * @return
	 */
	@RequestMapping("updateProjectComment.do")
	public ModelAndView updateProjectComment(CommentVO cvo){
		projectService.updateProjectComment(cvo);
		return new ModelAndView("redirect:project_View.do?projectNo="+cvo.getBoardNo());
	}
	/**
	 * commentNo와 projectNo를 받아와 댓글을 DB에서 삭제합니다.
	 * @param commentNo
	 * @param projectNo
	 * @return
	 */
	@RequestMapping("deleteProjectComment.do")
	public ModelAndView deleteProjectComment(int commentNo,String projectNo){
		projectService.deleteProjectComment(commentNo);
		return new ModelAndView("redirect:project_View.do?projectNo="+projectNo);
	}
	/**
	 * commentNo를 받아와 CommentVO형태로 참여신청된 데이터를 DB에서 삭제합니다.
	 * @param commentNo
	 * @return
	 */
	@RequestMapping("deleteJoinComment.do")
	public ModelAndView deleteJoinComment(String commentNo){
		projectService.deleteJoinComment(commentNo);
		return new ModelAndView("redirect:project_main.do");
	}
	/**
	 * 프로젝트관리화면에서 프로젝트시작을 누를시 projectNo를 받아와 achieve를 진행중으로 수정합니다.
	 * @param projectNo
	 * @return
	 */
	@RequestMapping("project_start.do")
	public ModelAndView startProject(String projectNo){
		projectService.startProject(projectNo);
		return new ModelAndView("redirect:project_main.do");
	}
	/**
	 * 프로젝트관리화면에서 프로젝트를 신청한 회원의 id와 projectNo를 받아와 참여를 취소시킵니다.
	 * @param id
	 * @param projectNo
	 * @return
	 */
	@RequestMapping("project_deleteJoiner.do")
	public ModelAndView deleteJoinerById(String id,String projectNo){
		projectService.deleteJoinerById(id,projectNo);
		return new ModelAndView("redirect:project_main.do");
	}
	/**
	 * projectNo를 받아와 프로젝트의 achieve를 완료로 수정하고 해당 팀 채팅내역삭제.
	 * @param projectNo
	 * @return
	 */
	@RequestMapping("project_success.do")
	public ModelAndView successProject(String projectNo){
		projectService.successProject(projectNo);
		projectService.deleteAllChat(projectNo);
		return new ModelAndView("redirect:project_main.do");
	}
	/**
	 * Ajax로 프로젝트의 진행상태 progressing을 수정합니다.
	 * @param projectNo
	 * @param progressing
	 * @return
	 */
	@RequestMapping("updateProgressAjax.do")
	@ResponseBody
	public int updateProgressAjax(int projectNo,int progressing){
		ProjectVO pvo=new ProjectVO();
		pvo.setProjectNo(projectNo);
		pvo.setProgressing(progressing);
		projectService.updateProgress(pvo);
		return progressing;
	}
	/**
	 * 프로젝트관리화면에서 진행중인 프로젝트의 정보를 새창에서 보여줍니다.
	 * @param projectNo
	 * @return
	 */
	@RequestMapping("project_popupProGetJoiner.do")
	public ModelAndView popupProGetJoiner(int projectNo,HttpServletRequest request){
		List<CommentVO> cvo=projectService.findJoinListProcess(projectNo);
		if(cvo.size()==0){
			return new ModelAndView("project/projectPopup");
		}
		cvo.get(0).setBoardNo(projectNo);
		return new ModelAndView("project/projectPopup","cvo",cvo);
	}
	/**
	 * 프로젝트관리화면에서 진행중인 프로젝트의 팀원의 추가모집과 모집중단을 관리합니다.
	 * @param projectNo
	 * @param achieve
	 */
	@RequestMapping("project_mansAjax.do")
	@ResponseBody
	public void mansAjax(int projectNo,String achieve){
		ProjectVO pvo=new ProjectVO();
		pvo.setAchieve(achieve);
		pvo.setProjectNo(projectNo);
		projectService.mansAjax(pvo);
	}
	/**
	 * 프로젝트 팀별 채팅에 참가합니다
	 * @param projectNo
	 * @return
	 */
	@RequestMapping("joinChat.do")
	public ModelAndView joinChat(int projectNo){
		List<String> list=new ArrayList<String>();
		list=projectService.findChatRecordByNo(projectNo);
		list.add(Integer.toString(projectNo));
		return new ModelAndView("project/popupChat","list",list);
	}
	/**
	 * 채팅창에 글을 쓰는 기능입니다.
	 * @param projectNo
	 * @param content
	 * @param request
	 */
	@RequestMapping("sendChatAjax")
	public void sendChatAjax(int projectNo,String content,HttpServletRequest request){
		HttpSession session=request.getSession(false);
		MemberVO mvo=(MemberVO) session.getAttribute("mvo");
		ProjectVO pvo=new ProjectVO();
		pvo.setProjectNo(projectNo);
		pvo.setContent(mvo.getId()+": "+content);
		projectService.sendChatAjax(pvo);
	}
	/**
	 * 채팅창을 계속 새로고침 해주는 메서드입니다.
	 * @param projectNo
	 * @return
	 */
	@RequestMapping("refreshChatAjax.do")
	@ResponseBody
	public List<String> refreshChatAjax(int projectNo){
		List<String> list=new ArrayList<String>();
		list=projectService.findChatRecordByNo(projectNo);
		return list;
	}
}
