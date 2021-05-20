package com.spring.groupware.aop;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.spring.groupware.common.MyUtil;

@Aspect
@Component
public class GroupwareAOP {

	// == Pointcut (�־���) ���� == //
	@Pointcut("execution(public * com.spring..*Controller.requiredLogin_*(..))")
	public void requiredLogin() { }

	
	
	// == Before Advice (�������) ���� == //

	// �α��� ���� �˻��ϴ� �޼ҵ�
	@Before("requiredLogin()")
	public void loginCheck(JoinPoint joinPoint) {

		HttpServletRequest request = (HttpServletRequest) joinPoint.getArgs()[0]; // �־��� �޼ҵ��� ù��° �Ķ���͸� ������
		HttpServletResponse response = (HttpServletResponse) joinPoint.getArgs()[1]; // �־��� �޼ҵ��� �ι�° �Ķ���͸� ������

		// �α��� ������ Ȯ���ϱ� ���� session ��������
		HttpSession session = request.getSession();

		if (session.getAttribute("loginuser") == null) {
			String message = "���� �α��� �ϼ���~~~";
			String loc = request.getContextPath() + "/login.action";

			request.setAttribute("message", message);
			request.setAttribute("loc", loc);

			// �α��� ���� �� �α��� �ϱ��� �������� ���ư��� ���� �۾�
			String url = MyUtil.getCurrentURL(request); // ���� ������ �ּ�(URL) �˾ƿ���
//			System.out.println("~~~Ȯ�ο� url => "+ url);

			session.setAttribute("goBackURL", url); // ���ǿ� url ������ ����

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/msg.jsp");
			try {
				dispatcher.forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		}
	}
}
