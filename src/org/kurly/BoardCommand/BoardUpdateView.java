package org.kurly.BoardCommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kurly.BoardDAO.BoardDAO;
import org.kurly.BoardDTO.BoardDTO;

public class BoardUpdateView implements BoardCommand {
	@Override
	public void executeQueryCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int no = Integer.parseInt(request.getParameter("no"));

		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO dto = dao.updateView(no);
		
		request.setAttribute("dto", dto);
		request.setAttribute("url", "/BoardUpdate.jsp");
	}
}
