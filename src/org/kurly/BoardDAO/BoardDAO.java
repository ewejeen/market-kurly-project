package org.kurly.BoardDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import org.kurly.BoardDTO.BoardDTO;
import org.kurly.DBConnect.DBConnect;

public class BoardDAO {
	public BoardDAO() {
	}

	private static class Singleton {
		private static final BoardDAO INSTANCE = new BoardDAO();
	}

	public static BoardDAO getInstance() {
		return Singleton.INSTANCE;
	}

	// 게시글 목록 조회
	public ArrayList<BoardDTO> list() {
		ArrayList<BoardDTO> list = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "";

		try {
			conn = DBConnect.getConnection();
			query = "select * from board order by no desc";
			pstm = conn.prepareStatement(query);

			rs = pstm.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					int no = rs.getInt(1);
					String title = rs.getString(2);
					String content = rs.getString(3);
					String writer = rs.getString(4);
					Timestamp regdate = rs.getTimestamp(5);
					int hit = rs.getInt(6);

					list.add(new BoardDTO(no, title, content, writer, regdate, hit));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstm != null)
					pstm.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			}
		}

		return list;
	}

	// 조회수 +1
	public int upHit(int no) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";

		try {
			conn = DBConnect.getConnection();
			query = "update board set hit=hit+1 where no=?";
			pstm = conn.prepareStatement(query);

			pstm.setInt(1, no);

			result = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstm != null)
					pstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			}
		}

		return result;
	}

	// 게시글 상세 보기
	public BoardDTO view(int no) {

		upHit(no);

		BoardDTO dto = null;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "";

		try {
			conn = DBConnect.getConnection();
			query = "select * from board where no=?";
			pstm = conn.prepareStatement(query);

			pstm.setInt(1, no);

			rs = pstm.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					int no2 = rs.getInt(1);
					String title = rs.getString(2);
					String content = rs.getString(3);
					String writer = rs.getString(4);
					Timestamp regdate = rs.getTimestamp(5);
					int hit = rs.getInt(6);

					dto = new BoardDTO(no2, title, content, writer, regdate, hit);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstm != null)
					pstm.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			}
		}

		return dto;
	}

	// 게시글 작성 (관리자만)
	public int write(String title, String content, String writer) {

		int result = 0;
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";

		try {
			conn = DBConnect.getConnection();
			query = "insert into board(title, content, writer, regdate, hit) values(?,?,?,sysdate(),0)";
			pstm = conn.prepareStatement(query);

			pstm.setString(1, title);
			pstm.setString(2, content);
			pstm.setString(3, writer);

			result = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstm != null)
					pstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			}
		}

		return result;
	}

	// 게시글 삭제 (관리자만)
	public int delete(int no) {

		int result = 0;
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";

		try {
			conn = DBConnect.getConnection();
			query = "delete from board where no=?";
			pstm = conn.prepareStatement(query);

			pstm.setInt(1, no);

			result = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstm != null)
					pstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			}
		}

		return result;
	}

	// 게시글 수정 View (관리자만)
	public BoardDTO updateView(int no) {

		BoardDTO dto = null;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "";

		try {
			conn = DBConnect.getConnection();
			query = "select * from board where no=?";
			pstm = conn.prepareStatement(query);

			pstm.setInt(1, no);

			rs = pstm.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					int no2 = rs.getInt(1);
					String title = rs.getString(2);
					String content = rs.getString(3);
					String writer = rs.getString(4);
					Timestamp regdate = rs.getTimestamp(5);
					int hit = rs.getInt(6);

					dto = new BoardDTO(no2, title, content, writer, regdate, hit);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstm != null)
					pstm.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			}
		}

		return dto;
	}

	// 게시글 수정 (관리자만)
	public int update(String title, String content, String writer, int no) {

		int result = 0;
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "";

		try {
			conn = DBConnect.getConnection();
			query = "update board set title=?, content=?, writer=? where no=?";
			pstm = conn.prepareStatement(query);

			pstm.setString(1, title);
			pstm.setString(2, content);
			pstm.setString(3, writer);
			pstm.setInt(4, no);

			result = pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
				if (pstm != null)
					pstm.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
			}
		}

		return result;
	}
}
