package org.kurly.MemberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kurly.MemberDAO.MemberDAO;

public class MemberLoginMo implements MemberCommand {
	@Override
	public void executeQueryCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.login(userId, userPw);
		
		String url = "";
		HttpSession session = request.getSession();
		if (result == 1) {
			session.setMaxInactiveInterval(60*5);	//로그인 세션 5분간 유지
			session.setAttribute("sessionId", userId);
			
			url = "/MainIndex.jsp";
		} else {
			url = "/MemberLogin.jsp";
		}

		request.setAttribute("url", url);
	}
}
