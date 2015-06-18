package org.kosta.dew.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.vo.CommentVO;
import org.kosta.dew.model.vo.DiscussVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class DiscussDAOImpl implements DiscussDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.dao.DiscussDAO#getAllDiscussList()
	 */
	@Override
	public List<DiscussVO> getAllDiscussList(String pageNo){
		return sqlSessionTemplate.selectList("discuss.getAllDiscussList",pageNo);
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.dao.DiscussDAO#registerDiscussion(org.kosta.dew.model.vo.DiscussVO)
	 */
	@Override
	public int registerDiscussion(DiscussVO dsvo){
		return sqlSessionTemplate.insert("discuss.registerDiscussion",dsvo);
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.dao.DiscussDAO#findDiscussContent()
	 */
	@Override
	public DiscussVO findDiscussContent(int no){
		return sqlSessionTemplate.selectOne("discuss.findDiscussContent",no);
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.dao.DiscussDAO#findDiscussContent(java.lang.String)
	 */
	@Override
	public List<DiscussVO> searchDisscuss(String title){
		return sqlSessionTemplate.selectList("discuss.findDiscussContent",title);
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.dao.DiscussDAO#deleteRequestDiscuss(org.kosta.dew.model.vo.DiscussVO)
	 */
	@Override
	public int deleteRequestDiscuss(DiscussVO dsvo){
		return sqlSessionTemplate.delete("discuss.deleteRequestDiscuss",dsvo);
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.dao.DiscussDAO#registerDiscussComment(org.kosta.dew.model.vo.CommentVO)
	 */
	@Override
	public int registerDiscussComment(CommentVO cvo){
		return sqlSessionTemplate.insert("discuss.registerDiscussComment",cvo);
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.dao.DiscussDAO#updateDiscussComment(org.kosta.dew.model.vo.CommentVO)
	 */
	@Override
	public int updateDiscussComment(CommentVO cvo){
		return sqlSessionTemplate.update("discuss.updateDiscussComment",cvo);
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.dao.DiscussDAO#deleteDiscussComment(org.kosta.dew.model.vo.CommentVO)
	 */
	@Override
	public int deleteDiscussComment(String no){
		return sqlSessionTemplate.delete("discuss.deleteDiscussComment",no);
	}
	@Override
	public int totalContent() {
		return sqlSessionTemplate.selectOne("discuss.totalContent");
	}
	@Override
	public List<CommentVO> findDiscussComment(int discussionNo) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("discuss.findDiscussComment",discussionNo);
	}
	@Override
	public CommentVO findDiscussCommentByNo(String no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("discuss.findDiscussCommentByNo",no);
	}
	@Override
	public void updateCount(int no) {
		sqlSessionTemplate.update("discuss.updateCount",no);

	}
	
}
