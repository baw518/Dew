package org.kosta.dew.controller;

import javax.annotation.Resource;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.kosta.dew.model.service.AopService;
import org.kosta.dew.model.vo.DiscussVO;
import org.kosta.dew.model.vo.ErrorReportVO;
import org.kosta.dew.model.vo.ProjectVO;
import org.kosta.dew.model.vo.QnAVO;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

/**
 * AOP 다양한 모듈에서 공통적으로 이용하는 기능을 정의하여
 * 지정된 매서드가 존재하는경우 그 매서드에대한 특별한 작업을 거치도록 한다.
 * @author KOSTA
 *
 */
//context-componet scan 대상이 되도록 하여 컨테이너가 bean을 생성하도록 한다. 
@Component
//Aspect 어노테이션을 명시하여 공통기능정의 빈임을 컨테이너에게 알린다.
@Aspect
@Controller
public class AopController {
	/**
	 * AOP서비스 인터페이스 DI
	 */
	@Resource
	private AopService aopService;
	
	/**
	 * exception, errercode, 질문게시판, 토론방, 프로젝트에
	 * 글등록할경우 회원의 기여도가 1씩 증가
	 * @param point 회원의 기여도
	 */
	@After("execution(public * org.kosta..*ServiceImpl.write*(..))")
	public void afterMemberContribution(JoinPoint point){
		/**
		 * 매서드의 매개변수를 배열에 저장
		 */
		Object param[] = point.getArgs();
		/**
		 * 글 쓴사람의 아이디
		 */
		String id = null;

		for(int i=0; i<param.length; i++){
			if(param[i] instanceof QnAVO){
				QnAVO vo = (QnAVO) param[i];
				id = vo.getId();
				aopService.memberUpContribution(id);
			}
			else if(param[i] instanceof ProjectVO){
				ProjectVO vo = (ProjectVO)param[i];
				id = vo.getId();
				aopService.memberUpContribution(id);
			}
			else if(param[i] instanceof DiscussVO){
				DiscussVO vo = (DiscussVO)param[i];
				id = vo.getId();
				aopService.memberUpContribution(id);
			}
			else if(param[i] instanceof ErrorReportVO){
				ErrorReportVO vo = (ErrorReportVO)param[i];
				id = vo.getId();
				aopService.memberUpContribution(id);
			}
		}
		
	}
	
	

}