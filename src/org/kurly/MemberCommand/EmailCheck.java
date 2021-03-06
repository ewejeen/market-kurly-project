package org.kurly.MemberCommand;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kurly.MemberDAO.MemberDAO;

public class EmailCheck implements MemberCommand {
	@Override
	public void executeQueryCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userEmail = request.getParameter("userEmail");
		
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.emailCheck(userEmail);
		
		PrintWriter out = response.getWriter();
		out.write(result+"");
		out.close();
	}
}
