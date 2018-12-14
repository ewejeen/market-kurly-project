package org.kurly.DBConnect;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnect {
	public static Connection getConnection() {
		Connection conn = null;
		DataSource ds = null;

		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/mysqlDB");
			conn = ds.getConnection();
			System.out.println("DB 연결 OK");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}
}
