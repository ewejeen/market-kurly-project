package org.kurly.MemberDTO;

public class MemberDTO {
	private String userId;
	private String userPw;
	private String userName;
	private String userPhone;
	private String userEmail;
	private String userGender;
	private String userBD;
	
	

	public MemberDTO(String userId, String userPw, String userName, String userPhone, String userEmail,
			String userGender, String userBD) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userGender = userGender;
		this.userBD = userBD;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserBD() {
		return userBD;
	}

	public void setUserBD(String userBD) {
		this.userBD = userBD;
	}

}