package unidev.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnector {
	public static Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String username = System.getenv("DB_USER");
			String password = System.getenv("DB_PASSWORD");

			return DriverManager.getConnection("jdbc:mysql://localhost:3306/myuni", username, password);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("MySQL JDBC driver not found", e);
		} catch (SQLException e) {
			throw e; 
		}
	}

}
