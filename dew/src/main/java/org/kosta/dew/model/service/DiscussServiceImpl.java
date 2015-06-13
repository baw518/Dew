package org.kosta.dew.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.dao.DiscussDAO;
import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DiscussListVO;
import org.kosta.dew.model.vo.DiscussVO;
import org.kosta.dew.model.vo.PagingBean;
import org.springframework.stereotype.Service;

@Service
public class DiscussServiceImpl implements DiscussService {
	@Resource(name="discussDAOImpl")
	private DiscussDAO discussDAO;
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
	public int registerDiscussion(DiscussVO dsvo){
		return discussDAO.registerDiscussion(dsvo);
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.service.DiscussService#findDiscussContent()
	 */
	@Override
	public DiscussVO findDiscussContent(String no){
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
	public List<CommentVO> findDiscussComment(String discussionNo) {
		// TODO Auto-generated method stub
		return discussDAO.findDiscussComment(discussionNo);
	}
	@Override
	public CommentVO findDiscussCommentByNo(String no) {
		// TODO Auto-generated method stub
		return discussDAO.findDiscussCommentByNo(no);
	}
}
