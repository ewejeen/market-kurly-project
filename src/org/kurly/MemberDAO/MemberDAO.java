package org.kurly.MemberDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.kurly.DBConnect.DBConnect;
import org.kurly.MemberDTO.MemberDTO;

public class MemberDAO {
	private MemberDAO() {
	}

	private static class Singleton {
		private static final MemberDAO INSTANCE = new MemberDAO();
	}

	public static MemberDAO getInstance() {
		return Singleton.INSTANCE;
	}

	// 회원 가입
	public int join(MemberDTO dto) {
		int result = 0;
		Connection conn = null;
		String query = "";
		PreparedStatement pstm = null;

		try {
			conn = DBConnect.getConnection();
			query = "insert into member(userId, userPw, userName, userPhone, userEmail, userGender, userBD) values(?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(query);

			pstm.setString(1, dto.getUserId());
			pstm.setString(2, dto.getUserPw());
			pstm.setString(3, dto.getUserName());
			pstm.setString(4, dto.getUserPhone());
			pstm.setString(5, dto.getUserEmail());
			pstm.setString(6, dto.getUserGender());
			pstm.setString(7, dto.getUserBD());

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

	// 아이디 중복 확인
	public int idCheck(String userId) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "";

		try {
			conn = DBConnect.getConnection();
			query = "select count(*) from member where userId=?";
			pstm = conn.prepareStatement(query);

			pstm.setString(1, userId);

			rs = pstm.executeQuery();

			while (rs.next()) {
				result = rs.getInt(1); // 값이 1이면 아이디 중복
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

		return result;
	}

	// 이메일 중복 확인
	public int emailCheck(String userEmail) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "";

		try {
			conn = DBConnect.getConnection();
			query = "select count(*) from member where userEmail=?";
			pstm = conn.prepareStatement(query);

			pstm.setString(1, userEmail);

			rs = pstm.executeQuery();

			while (rs.next()) {
				result = rs.getInt(1); // 값이 1이면 이메일 중복
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

		return result;
	}

	// 로그인
	public int login(String userId, String userPw) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "";

		try {
			conn = DBConnect.getConnection();
			query = "select count(*) from member where userId=? and userPw=?";
			pstm = conn.prepareStatement(query);

			pstm.setString(1, userId);
			pstm.setString(2, userPw);

			rs = pstm.executeQuery();

			while (rs.next()) {
				result = rs.getInt(1); // 값이 1이면 로그인 성공
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

		return result;
	}

	// 아이디 찾기
	public String idFind(String userEmail) {
		String result = "";
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "";

		try {
			conn = DBConnect.getConnection();
			query = "select userId from member where userEmail=?";
			pstm = conn.prepareStatement(query);

			pstm.setString(1, userEmail);

			rs = pstm.executeQuery();

			while (rs.next()) {
				result = rs.getString(1); // 1==userId?
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

		return result;
	}

	// 비밀번호 찾기
	public String pwFind(String userId, String userEmail) {
		String result = "";
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "";

		try {
			conn = DBConnect.getConnection();
			query = "select userPw from member where userId=? and userEmail=?";
			pstm = conn.prepareStatement(query);

			pstm.setString(1, userId);
			pstm.setString(2, userEmail);

			rs = pstm.executeQuery();

			while (rs.next()) {
				result = rs.getString(1); // 1==userPw?
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

		return result;
	}

}
