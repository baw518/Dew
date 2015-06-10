package org.kosta.dew.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;
/**
 * 실제 파일을 다운로드시키기 위한 View를 구현 
 * (View 를 만들기 위해서는 spring에서 제공하는 
 * AbstractView를 상속받아 추상메서드를 구현 ) 
 * @author KOSTA-00-KANGSA
 *
 */
public class DownloadView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
}












