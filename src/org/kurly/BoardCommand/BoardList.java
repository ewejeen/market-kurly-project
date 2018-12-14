package org.kurly.BoardCommand;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kurly.BoardDAO.BoardDAO;
import org.kurly.BoardDTO.BoardDTO;

public class BoardList implements BoardCommand {
	@Override
	public void executeQueryCommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ArrayList<BoardDTO> list = new ArrayList<>();
		BoardDAO dao = BoardDAO.getInstance();
		
		list = dao.list();
		
		request.setAttribute("list", list);
		request.setAttribute("url", "/BoardList.jsp");
	}
}
