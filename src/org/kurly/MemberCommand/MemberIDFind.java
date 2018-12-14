package org.kurly.MemberCommand;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.kurly.MemberDAO.MemberDAO;

public class MemberIDFind implements MemberCommand {
	@Override
	public void executeQueryCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userEmail = request.getParameter("userEmail");
		
		MemberDAO dao = MemberDAO.getInstance();
		String result = dao.idFind(userEmail);
		
		PrintWriter out = response.getWriter();
		out.write(result);
		out.close();
		//request.setAttribute("yourId", result);
		//request.setAttribute("url", "/IDFind.jsp");
	}
}
