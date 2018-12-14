package org.kurly.MemberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kurly.MemberDAO.MemberDAO;

public class MemberLogoutMo implements MemberCommand {
	@Override
	public void executeQueryCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		session.invalidate();

		request.setAttribute("url", "/MainIndex.jsp");
	}
}
