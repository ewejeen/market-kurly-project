package org.kurly.MemberController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kurly.MemberCommand.EmailCheck;
import org.kurly.MemberCommand.IDCheck;
import org.kurly.MemberCommand.MemberCommand;
import org.kurly.MemberCommand.MemberIDFind;
import org.kurly.MemberCommand.MemberJoinMo;
import org.kurly.MemberCommand.MemberLoginMo;
import org.kurly.MemberCommand.MemberLogoutMo;
import org.kurly.MemberCommand.MemberPWFind;

@WebServlet("*.mo")
public class MemberController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");

		String path = request.getContextPath();
		String uri = request.getRequestURI();
		String basicURL = uri.substring(path.length());

		MemberCommand action = null;
		String url = "";
		if (basicURL.equals("/memberJoin.mo")) {
			action = new MemberJoinMo();
			action.executeQueryCommand(request, response);
			url = (String) request.getAttribute("url");
		} else if (basicURL.equals("/idCheck.mo")) {
			action = new IDCheck();
			action.executeQueryCommand(request, response);
			return;
		} else if (basicURL.equals("/emailCheck.mo")) {
			action = new EmailCheck();
			action.executeQueryCommand(request, response);
			return;
		} else if (basicURL.equals("/memberLogin.mo")) {
			action = new MemberLoginMo();
			action.executeQueryCommand(request, response);
			url = (String) request.getAttribute("url");
		} else if (basicURL.equals("/memberLogout.mo")) {
			action = new MemberLogoutMo();
			action.executeQueryCommand(request, response);
			url = (String) request.getAttribute("url");
		} else if (basicURL.equals("/idFind.mo")) {
			action = new MemberIDFind();
			action.executeQueryCommand(request, response);
			return;
		} else if (basicURL.equals("/pwFind.mo")) {
			action = new MemberPWFind();
			action.executeQueryCommand(request, response);
			return;
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
