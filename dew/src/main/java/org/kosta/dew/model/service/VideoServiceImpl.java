package org.kosta.dew.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.dew.model.dao.VideoDAO;
import org.kosta.dew.model.vo.PagingBean;
import org.kosta.dew.model.vo.VideoListVO;
import org.kosta.dew.model.vo.VideoVO;
import org.springframework.stereotype.Service;

@Service
public class VideoServiceImpl implements VideoService {
	@Resource
	private VideoDAO videoDAO;	
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.service.VideoService#write(org.kosta.dew.model.vo.VideoVO)
	 */
	@Override
	public void write(VideoVO vvo){
		videoDAO.write(vvo);
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.service.VideoService#getBoardList(java.lang.String)
	 */
	@Override
	public VideoListVO getVideoList(String pageNo){
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		List<VideoVO> list=videoDAO.getVideoList(pageNo);
		System.out.println(list);
		int total=videoDAO.totalContent();
		PagingBean PagingBean=new PagingBean(total,Integer.parseInt(pageNo));
		VideoListVO vo=new VideoListVO(list,PagingBean);
		return vo;
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.service.VideoService#showContent(int)
	 */
	@Override
	public VideoVO showContent(int no){
		videoDAO.updateCount(no);
		return videoDAO.showContent(no);
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.service.VideoService#showContentNoHit(int)
	 */
	@Override
	public VideoVO showContentNoHit(int no){		
		return videoDAO.showContent(no);
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.service.VideoService#checkAdmin(java.lang.String, java.lang.String)
	 */
	@Override
	public boolean checkAdmin(String no,String pass) {	
		int count=videoDAO.checkAdmin();
		boolean flag=false;
		if(count>0)
			flag=true;
		return flag;
	}	
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.service.VideoService#deleteVideo(java.lang.String)
	 */
	@Override
	public void deleteVideo(String no){
		videoDAO.deleteVideo(no);
	}
	/* (non-Javadoc)
	 * @see org.kosta.dew.model.service.VideoService#updateVideo(org.kosta.dew.model.vo.VideoVO)
	 */
	@Override
	public void updateVideo(VideoVO vvo){
		videoDAO.updateVideo(vvo);
	}
	
}
