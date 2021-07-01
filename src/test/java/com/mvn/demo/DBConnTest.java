package com.mvn.demo;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class DBConnTest {

	@Test
	public void test() throws Exception {
		Class.forName("com.tmax.tibero.jdbc.TbDriver"); // 마리아DB

		Connection con = DriverManager.getConnection("jdbc:tibero:thin:@localhost:8629:tibero", "sys", "test");// tibero
		// Connection con =
		// DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test","root","passwd");
		// MySQL
		System.out.println(con);
	}

}
