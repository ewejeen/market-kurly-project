package org.kurly.BoardController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kurly.BoardCommand.BoardCommand;
import org.kurly.BoardCommand.BoardDelete;
import org.kurly.BoardCommand.BoardList;
import org.kurly.BoardCommand.BoardSearch;
import org.kurly.BoardCommand.BoardUpdate;
import org.kurly.BoardCommand.BoardUpdateView;
import org.kurly.BoardCommand.BoardView;
import org.kurly.BoardCommand.BoardWrite;

@WebServlet("*.bo")
public class BoardController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doService(request, response);
	}

	protected void doService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String path = request.getContextPath();
		String uri = request.getRequestURI();
		String basicURL = uri.substring(path.length());
		
		String url = "";
		BoardCommand action = null;
		
		if(basicURL.equals("/boardList.bo")) {
			action = new BoardList();
			action.executeQueryCommand(request, response);
			url = (String) request.getAttribute("url");
		} else if(basicURL.equals("/boardView.bo")) {
			action = new BoardView();
			action.executeQueryCommand(request, response);
			url = (String) request.getAttribute("url");
		} else if(basicURL.equals("/boardSearch.bo")) {
			action = new BoardSearch();
			action.executeQueryCommand(request, response);
			return;
		} else if(basicURL.equals("/boardWrite.bo")) {
			action = new BoardWrite();
			action.executeQueryCommand(request, response);
			return;
		} else if(basicURL.equals("/boardDelete.bo")) {
			action = new BoardDelete();
			action.executeQueryCommand(request, response);
			return;
		} else if(basicURL.equals("/boardUpdateView.bo")) {
			action = new BoardUpdateView();
			action.executeQueryCommand(request, response);
			url = (String) request.getAttribute("url");
		} else if(basicURL.equals("/boardUpdate.bo")) {
			action = new BoardUpdate();
			action.executeQueryCommand(request, response);
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}
}
