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


//context-componet scan 대상이 되도록 하여 컨테이너가 bean을 생성하도록 한다. 
@Component
//Aspect 어노테이션을 명시하여 공통기능정의 빈임을 컨테이너에게 알린다.
@Aspect
@Controller
public class AopController {
	@Resource
	private AopService aopService;
	
	// aop adview를 before로 명시하여 대상 메서드 실행전에 아래 공통기능이 수행되도록 하고 
	// pointcut은 execution으로 명시하여 ServiceImpl클래스의 write로 시작되는 매서드가 적용대상이 되도록 한다.
	@After("execution(public * org.kosta..*ServiceImpl.write*(..))")
	public void afterMemberContribution(JoinPoint point){
		Object param[] = point.getArgs();
		String id = null;

		for(int i=0; i<param.length; i++){
			if(param[i] instanceof QnAVO){
				QnAVO vo = (QnAVO) param[i];
				id = vo.getId();
			}
			else if(param[i] instanceof ProjectVO){
				ProjectVO vo = (ProjectVO)param[i];
				id = vo.getId();
			}
			else if(param[i] instanceof DiscussVO){
				DiscussVO vo = (DiscussVO)param[i];
				id = vo.getId();
			}
			else if(param[i] instanceof ErrorReportVO){
				ErrorReportVO vo = (ErrorReportVO)param[i];
				id = vo.getId();
			}
		}
		aopService.memberUpContribution(id);
	}

}