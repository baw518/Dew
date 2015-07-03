package org.kosta.dew.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.dao.DiscussDAO;
import org.kosta.dew.model.dao.ErrorReportDAO;
import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DiscussListVO;
import org.kosta.dew.model.vo.DiscussVO;
import org.kosta.dew.model.vo.ErrorReportVO;
import org.kosta.dew.model.vo.PagingBean;
import org.kosta.dew.model.vo.discussionRequestVO;
import org.springframework.stereotype.Service;

@Service
public class DiscussServiceImpl implements DiscussService {
	@Resource(name="discussDAOImpl")
	private DiscussDAO discussDAO;
	@Resource(name="errorReportDAOImpl")
	private ErrorReportDAO errorReportDAO;
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.service.DiscussService#getAllDiscussList(java.lang.String)
	 */
	@Override
	public DiscussListVO getAllDiscussList(String pageNo){
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		List<DiscussVO> list=discussDAO.getAllDiscussList(pageNo);
		int total=discussDAO.totalContent();
		PagingBean paging=new PagingBean(total,Integer.parseInt(pageNo));
		DiscussListVO dslvo=new DiscussListVO(list,paging);
		return dslvo;
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.service.DiscussService#registerDiscussion(org.kosta.dew.model.vo.DiscussVO)
	 */
	@Override
	public int writeDiscussion(DiscussVO dsvo){
		return discussDAO.registerDiscussion(dsvo);
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.service.DiscussService#findDiscussContent()
	 */
	@Override
	public DiscussVO findDiscussContent(int no){
		return discussDAO.findDiscussContent(no);
	}
	@Override
	public DiscussVO findDiscussContenHitUp(int no){
		discussDAO.updateCount(no);
		return discussDAO.findDiscussContent(no);
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.service.DiscussService#searchDisscuss(java.lang.String)
	 */
	@Override
	public List<DiscussVO> searchDisscuss(String title){
		return discussDAO.searchDisscuss(title);
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.service.DiscussService#deleteRequestDiscuss(org.kosta.dew.model.vo.DiscussVO)
	 */
	@Override
	public int deleteRequestDiscuss(DiscussVO divo){
		return discussDAO.deleteRequestDiscuss(divo);
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.service.DiscussService#registerDiscussComment(org.kosta.dew.model.vo.CommentVO)
	 */
	@Override
	public int registerDiscussComment(CommentVO cvo){
		return discussDAO.registerDiscussComment(cvo);
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.service.DiscussService#updateDiscussComment(org.kosta.dew.model.vo.CommentVO)
	 */
	@Override
	public int updateDiscussComment(CommentVO cvo){
		return discussDAO.updateDiscussComment(cvo);
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.service.DiscussService#deleteDiscussComment(org.kosta.dew.model.vo.CommentVO)
	 */
	@Override
	public int deleteDiscussComment(String no){
		return discussDAO.deleteDiscussComment(no);
	}
	@Override
	public List<CommentVO> findDiscussComment(int discussionNo) {
		// TODO Auto-generated method stub
		return discussDAO.findDiscussComment(discussionNo);
	}
	@Override
	public CommentVO findDiscussCommentByNo(String no) {
		// TODO Auto-generated method stub
		return discussDAO.findDiscussCommentByNo(no);
	}
	@Override
	public void commentReplyStepPlus(CommentVO vo) {
		discussDAO.commentReplyStepPlus(vo);
		
	}
	@Override
	public void ajaxWriteCommentReply(CommentVO vo) {
		discussDAO.ajaxWriteCommentReply(vo);
		
	}
	@Override
	public void delete(String no) {
		discussDAO.delete(no);
		
	}
	@Override
	public void deleteRequest(discussionRequestVO vo) {
		// TODO Auto-generated method stub
		discussDAO.deleteRequest(vo);
	}
	@Override
	public void deleteDiscussRequest(String no) {
		discussDAO.deleteDiscussRequest(no);
		
	}
	@Override
	public void insertRequest(discussionRequestVO vo) {
		// TODO Auto-generated method stub
		discussDAO.insertRequest(vo);
	}
	
	@Override
	public boolean findDeleteRequest(int discussionNo) {
		// TODO Auto-generated method stub
		boolean flag = false;
		discussionRequestVO vo = discussDAO.findDeleteRequest(discussionNo);
		if(vo!=null){
			flag = true;
		}
		return flag;
	}
	@Override
	public void InsertDiscussRequest(int no) {
		// TODO Auto-generated method stub
		discussDAO.insertDiscussRequest(no);
	}
	/**
	 * 토론방 등록요청페이지(관리자)에서 등록
	 * - report 업데이트
	 * - discuss 인설트
	 * 1.no로 에러 가져오기
	 * 2. 가져온 에러vo 업데이트
	 * 3. 가져온 에러vo로 insert
	 * exceptionMessage/errorCode
	 */
	@Override
	public void insert(int no) {
		// TODO Auto-generated method stub
		
		ErrorReportVO vo = errorReportDAO.getContent(no);
		//토론상태 업데이트
		errorReportDAO.updateDiscussionStatus(vo.getErrorNo());
		//제목구해오기
		String title = null;
		if(vo.getExceptionMessage()!=null){
			title=vo.getExceptionMessage();
		}else if(vo.getErrorCode()!=null){
			title=vo.getErrorCode();
		}
		// 등록요청해서 등록된 토론방은 구분자를 2로 둠.
		// 나중에 토론 종료 시 에러리포트 글을 구분하기 위해서.
		DiscussVO dsvo = new DiscussVO(vo.getId(), title, vo.getContent(), title,2);
		
		//토론방 insert
		discussDAO.registerDiscussion(dsvo);
		
	}
	@Override
	public void doneDiscuss(int discussionNo,String title) {
		// TODO Auto-generated method stub
		int progress = discussDAO.findProgress(discussionNo);
		if(progress==0){
			discussDAO.updateProgress(discussionNo);
		}else if(progress==2){
			discussDAO.updateProgress(discussionNo);
			//where = title 로 에러리포트 update
			// title로 evo 받아오기
	/*		List<ErrorReportVO> vo = errorReportDAO.findByTitle(title);
	}
			
			}*/
			//errorReportDAO.discussFinish(title);
			
					
		}
		}
		
}
