package org.kurly.BoardCommand;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kurly.BoardDAO.BoardDAO;

public class BoardWrite implements BoardCommand {
	@Override
	public void executeQueryCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
		
		BoardDAO dao = BoardDAO.getInstance();
		int result = dao.write(title, content, writer);
		
		PrintWriter out = response.getWriter();
		out.write(result+"");
		out.close();
		
		/*
		String url="";
		if(result==1) {
			url="/boardList.bo";
		} else {
			url="/boardWrite.bo";
		}
		
		request.setAttribute("url", url);
		*/
	}
}
