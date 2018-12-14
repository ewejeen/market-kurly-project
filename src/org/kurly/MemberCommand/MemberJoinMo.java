package org.kurly.MemberCommand;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kurly.MemberDAO.MemberDAO;
import org.kurly.MemberDTO.MemberDTO;

public class MemberJoinMo implements MemberCommand {
	@Override
	public void executeQueryCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String userGender = request.getParameter("userGender");
		String userPhone = "";
		String userBD = "";

		String userPhoneArr[] = request.getParameterValues("userPhone");
		for (String phone : userPhoneArr) {
			userPhone += phone + "-";
		}
		userPhone = userPhone.substring(0, userPhone.length() - 1);

		String userBDArr[] = request.getParameterValues("userBD");
		for (String BD : userBDArr) {
			userBD += BD + "-";
		}
		userBD = userBD.substring(0, userBD.length() - 1);

		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.join(new MemberDTO(userId, userPw, userName, userPhone, userEmail, userGender, userBD));

		String url = "";
		if (result == 1) {
			url = "/MemberLogin.jsp";
		} else {
			url = "/MemberJoin.jsp";
		}

		request.setAttribute("url", url);
	}
}
