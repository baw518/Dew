package org.kosta.dew.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.vo.VideoVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

@Component
public class VideoDAOImpl implements VideoDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.dao.VideoDAO#write(org.kosta.dew.model.vo.VideoVO)
	 */
	@Override
	public int write(VideoVO Vvo){
		return (Integer)sqlSessionTemplate.insert("video.write",Vvo);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.dao.VideoDAO#checkAdmin(java.util.Map)
	 */
	@Override
	public Integer checkAdmin(/*회원이 완성해야됨*/) {		
		return sqlSessionTemplate.selectOne("video.checkAdmin");
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.dao.VideoDAO#getVideoList(java.lang.String)
	 */
	@Override
	public List<VideoVO> getVideoList(String pageNo){
		return sqlSessionTemplate.selectList("video.getVideoList", pageNo);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.dao.VideoDAO#showContent(int)
	 */
	@Override
	public VideoVO showContent(int no){
		return (VideoVO)sqlSessionTemplate.selectOne("video.showContent",no);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.dao.VideoDAO#updateCount(int)
	 */
	@Override
	public void updateCount(int no){
		sqlSessionTemplate.update("video.updateCount",no);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.dao.VideoDAO#deleteVideo(java.lang.String)
	 */
	@Override
	public void deleteVideo(String no){
		sqlSessionTemplate.delete("video.deleteBoard", no);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.dao.VideoDAO#updateBoard(org.kosta.dew.model.vo.VideoVO)
	 */
	@Override
	public void updateVideo(VideoVO Vvo){
		sqlSessionTemplate.update("video.updateVideo", Vvo);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.dao.VideoDAO#totalContent()
	 */
	@Override
	public int totalContent(){
		return sqlSessionTemplate.selectOne("video.totalContent");
	}
	
}
